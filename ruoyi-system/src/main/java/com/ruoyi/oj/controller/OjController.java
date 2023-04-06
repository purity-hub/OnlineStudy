package com.ruoyi.oj.controller;

import com.ruoyi.chapter.domain.Chapter;
import com.ruoyi.chapter.service.IChapterService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.oj.domain.*;
import com.ruoyi.oj.service.IOjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * 【请填写功能名称】Controller
 *
 * @author ruoyi
 * @date 2023-03-26
 */
@RestController
@RequestMapping("/oj")
public class OjController extends BaseController
{
    @Autowired
    private IOjService ojService;

    @Autowired
    private IChapterService chapterService;


    @GetMapping("/list")
    public TableDataInfo list(Oj oj)
    {
        startPage();
        List<Oj> list = ojService.selectOjList(oj);
        //查询oj有没有通过
        for (Oj oj2 : list) {
            oj2.setStatus(ojService.isExistSo(SecurityUtils.getUserId(),oj2.getId()));
        }
        return getDataTable(list);
    }

    /**
     * 导出oj列表
     */
    @PreAuthorize("@ss.hasPermi('oj:oj:export')")
    @Log(title = "oj", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Oj oj)
    {
        List<Oj> list = ojService.selectOjList(oj);
        ExcelUtil<Oj> util = new ExcelUtil<Oj>(Oj.class);
        util.exportExcel(response, list, "oj数据");
    }

    /**
     * 获取oj详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ojService.selectOjById(id));
    }

    /**
     * 新增oj
     */
    @PreAuthorize("@ss.hasPermi('oj:oj:add')")
    @Log(title = "oj", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Oj oj)
    {
        return toAjax(ojService.insertOj(oj));
    }

    /**
     * 修改oj
     */
    @PreAuthorize("@ss.hasPermi('oj:oj:edit')")
    @Log(title = "oj", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Oj oj)
    {
        return toAjax(ojService.updateOj(oj));
    }

    /**
     * 删除oj
     */
    @PreAuthorize("@ss.hasPermi('oj:oj:remove')")
    @Log(title = "oj", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ojService.deleteOjByIds(ids));
    }

    /**
     * 接收python代码
     */
    @RequestMapping("/sendCode")
    public AjaxResult sendCode(@RequestBody Code code) throws IOException {
    	//将code代码运行
        //执行结果
        //将代码保存到文件
        //将tab替换为4个空格
        code.setCode(code.getCode().replaceAll("\t", "    "));
        //随机生成文件名UUID
        String fileName = "test" + UUID.randomUUID().toString().replaceAll("-", "");
        //创建文件
        File file = new File(fileName + ".py");
        //将代码写入文件
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(code.getCode().getBytes());
        //执行python文件
        //获取oj
        Oj oj = ojService.selectOjById(code.getId());
        if(oj == null){
            //表示在线运行python代码
            String cmd = "python " + fileName + ".py";
            Process process = Runtime.getRuntime().exec(cmd);
            //获取运行结果
            //运行结果
            String result1 = new String(process.getInputStream().readAllBytes());
            //报错信息
            String error1 = new String(process.getErrorStream().readAllBytes());
            String result = result1 + error1;
            //进程终止
            process.destroy();
            //关闭文件流
            fos.close();
            //删除文件
            file.delete();
            return success(result);
        }
        //获取代码指定执行的方法
        String method = oj.getCodemethod();
        //获取运行的测试用例
        List<Testcase> testcaseList = oj.getTestcaseList();
        //保存测试结果状态数组
        List<RunResult> results = new ArrayList<>();
        //拼接测试参数
        for(int i=0;i<testcaseList.size();i++){
            //temp为测试用例的参数 带换行
            String param = testcaseList.get(i).getTestcases();
            //获取相对应的结果
            String trueResult = testcaseList.get(i).getAnswer();
            //将测试用例的参数的换行替换为逗号
            param = param.replaceAll("\r",",");
            param = param.replaceAll("\n",",");
            //去掉最后一个逗号,如果有的话,防止用户输入的测试用例参数最后一个是换行
            if(param.endsWith(",")){
                param = param.substring(0,param.length()-1);
            }
            String cmd = "python -c \"from " + fileName + " import Solution;print(Solution()."+method+"("+param+"))\"";
            RunResult result = new RunResult();
            //设置测试用例
            result.setTestcase(param);
            Process process = Runtime.getRuntime().exec(cmd);
            //运行结果
            String result1 = new String(process.getInputStream().readAllBytes());
            //报错信息
            String error1 = new String(process.getErrorStream().readAllBytes());
            //errer1删除 File\"D开头的子串
            error1 = error1.replaceAll("\bFile\\\"D:.*\b","");
            //去掉换行
            result1 = result1.replaceAll("\r","");
            result1 = result1.replaceAll("\n","");
            //将测试结果保存到数组
            result.setResult(result1);
            result.setError(error1);
            if(result1.equals(trueResult)){
                result.setStatus("运行成功");
            }else{
                result.setStatus("运行失败");
            }
            results.add(result);
            //终止进程
            process.destroy();
        }
        //关闭文件流
        fos.close();
        //删除文件
        file.delete();
        //oj通过
        //插入so表
        //获取sid,即用户id
        Long sid = SecurityUtils.getUserId();
        Long oid = code.getId();
        int trueNums = 0;
        for(int i=0;i<results.size();i++){
            if(Objects.equals(results.get(i).getStatus(), "运行成功")){
                //每运行成功一个测试用例加一
                trueNums += 1;
            }
        }
        if(trueNums==results.size()){
            //全部测试用例全部通过
            //先查询是否先前已经通过oj
            if(ojService.isExistSo(sid,oid)==0){
                ojService.insertSo(sid,oid);
            }
        }
        //System.out.println(results);
        return success(results);
    }

    @GetMapping("/chapterTree")
    public AjaxResult chapterTree(Chapter chapter)
    {
        Long userId = getUserId();
        //查询用户(老师)下的全部课程id
        List<Long> cidList = chapterService.selectCidList(userId);
        List<Chapter> chapterList = new ArrayList<>();
        for(int i=0;i<cidList.size();i++){
            chapter.setCourseid(cidList.get(i));
            chapterList.addAll(chapterService.selectChapterList(chapter));
        }
        return success(chapterList);
    }

    @RequestMapping("/publicProblemList")
    public TableDataInfo publicProblemList(Oj oj)
    {
        //获取公共代码库
        oj.setChapterid(0L);
        startPage();
        List<Oj> list = ojService.selectOjList(oj);
        return getDataTable(list);
    }

    @GetMapping("/checkOj/{id}")
    public AjaxResult checkOj(@PathVariable("id") Long id){
        //根据oj的id查询用户有没有通过该题目
        Long sid = SecurityUtils.getUserId();
        int result = ojService.isExistSo(sid,id);
        return success(result);
    }

    @GetMapping("/getComments/{id}")
    public AjaxResult getComments(@PathVariable("id") Long id){
        //获取评论
        List<Comments> comments = ojService.getComments(id);
        return success(comments);
    }
}
