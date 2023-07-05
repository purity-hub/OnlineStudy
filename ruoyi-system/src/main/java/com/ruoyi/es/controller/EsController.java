package com.ruoyi.es.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.question.domain.Question;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.es.domain.Es;
import com.ruoyi.es.service.IEsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试卷学生成绩Controller
 *
 * @author ruoyi
 * @date 2023-04-05
 */
@RestController
@RequestMapping("/es/es")
public class EsController extends BaseController
{
    @Autowired
    private IEsService esService;

    /**
     * 查询试卷学生成绩列表
     */
    @PreAuthorize("@ss.hasPermi('es:es:list')")
    @GetMapping("/list")
    public TableDataInfo list(Es es)
    {
        startPage();
        List<Es> list = esService.selectEsList(es);
        return getDataTable(list);
    }

    /**
     * 导出试卷学生成绩列表
     */
    @PreAuthorize("@ss.hasPermi('es:es:export')")
    @Log(title = "试卷学生成绩", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Es es)
    {
        List<Es> list = esService.selectEsList(es);
        ExcelUtil<Es> util = new ExcelUtil<Es>(Es.class);
        util.exportExcel(response, list, "试卷学生成绩数据");
    }

    /**
     * 获取试卷学生成绩详细信息
     */
    @PreAuthorize("@ss.hasPermi('es:es:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(esService.selectEsById(id));
    }

    /**
     * 新增试卷学生成绩
     */
    @Log(title = "试卷学生成绩", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Es es)
    {
        //获取当前用户id
        Long userId = getUserId();
        es.setSid(userId);
        //获取试卷id
        Long eid = es.getEid();
        //查询用户是否已经提交过试卷
        int count = esService.selectEsByEidAndSid(eid,userId);
        if(count > 0){
            return error("您已经提交过试卷了,不能重复提交");
        }
        String answer = es.getAnswer();
        //[[{"id":1,"answer":"A"},{"id":5,"answer":"C"}],[{"id":2,"answer":"ABD"}],[{"id":3,"answer":"对"}],[{"id":4,"answer":null}],[]]
        //转化为五个数组
        answer = answer.substring(2,answer.length()-2);
        String[] answers = answer.split("],\\[");
        HashMap<Long, String> map = new HashMap<>();
        for(int i=0;i<answers.length;i++){
            //转化为json数组
            answers[i] = "["+answers[i]+"]";
            List<HashMap> list = JSON.parseArray(answers[i], HashMap.class);
            for(int j=0;j<list.size();j++){
                //获取题目id
                Long id = Long.parseLong(list.get(j).get("id").toString());
                //获取题目答案
                String ans = "";
                if(list.get(j).get("answer") != null){
                    ans = list.get(j).get("answer").toString();
                }
                map.put(id,ans);
            }
        }
        //获取试卷题目
        List<Question> list = esService.selectEsByEid(eid);
        //计算分数
        Long score = 0L;
        for(int i=0;i<list.size();i++){
            if(list.get(i).getAnswer().equals(map.get(list.get(i).getId()))){
                score += list.get(i).getScore();
            }
        }
        es.setScore(score);
        return toAjax(esService.insertEs(es));
    }

    /**
     * 修改试卷学生成绩
     */
    @PreAuthorize("@ss.hasPermi('es:es:edit')")
    @Log(title = "试卷学生成绩", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Es es)
    {
        return toAjax(esService.updateEs(es));
    }

    /**
     * 删除试卷学生成绩
     */
    @PreAuthorize("@ss.hasPermi('es:es:remove')")
    @Log(title = "试卷学生成绩", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(esService.deleteEsByIds(ids));
    }
}
