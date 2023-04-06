package com.ruoyi.signin.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.signin.domain.SigninView;
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
import com.ruoyi.signin.domain.Signrecord;
import com.ruoyi.signin.service.ISignrecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 签到记录信息Controller
 *
 * @author ruoyi
 * @date 2023-04-02
 */
@RestController
@RequestMapping("/signin/signin")
public class SignrecordController extends BaseController
{
    @Autowired
    private ISignrecordService signrecordService;

    /**
     * 查询签到记录信息列表
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:list')")
    @GetMapping("/list")
    public TableDataInfo list(Signrecord signrecord)
    {
        startPage();
        List<Signrecord> list = signrecordService.selectSignrecordList(signrecord);
        return getDataTable(list);
    }

    @GetMapping("/list2")
    public AjaxResult list2(Signrecord signrecord)
    {
        //根据课程id查询全部属于该课程的签到记录
        List<SigninView> list = signrecordService.selectSigninList(signrecord);
        //根据课程id查询该课程的教师姓名
        String teacherName = signrecordService.selectTeacherName(signrecord.getCourseId());
        //根据课程id查询该课程的名称
        String courseName = signrecordService.selectCourseName(signrecord.getCourseId());
        //查询当前课程的总人数
        int total = signrecordService.selectTotalUserNum(signrecord.getCourseId());
        //查询当前课程的已签到人数
        int signed = signrecordService.selectSignedUserNum(signrecord.getCourseId());
        //查询用户id
        Long userId = SecurityUtils.getUserId();
        for(SigninView signinView : list){
            //根据课程id查询该课程的教师姓名
            signinView.setTeacherName(teacherName);
            //根据课程id查询该课程的名称
            signinView.setCourseName(courseName);
            //查询当前课程的总人数
            signinView.setShouldSignNum((long) total);
            //查询当前课程的已签到人数
            signinView.setSignedNum((long) signed);
            int signStatus = signrecordService.selectSignStatus(signinView.getId(), userId);
            if(signStatus == 1){
                signinView.setSignStatus("已签到");
            }else{
                signinView.setSignStatus("未签到");
            }
        }
        return AjaxResult.success(list);
    }

    /**
     * 导出签到记录信息列表
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:export')")
    @Log(title = "签到记录信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Signrecord signrecord)
    {
        List<Signrecord> list = signrecordService.selectSignrecordList(signrecord);
        ExcelUtil<Signrecord> util = new ExcelUtil<Signrecord>(Signrecord.class);
        util.exportExcel(response, list, "签到记录信息数据");
    }

    /**
     * 获取签到记录信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(signrecordService.selectSignrecordById(id));
    }

    /**
     * 新增签到记录信息
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:add')")
    @Log(title = "签到记录信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Signrecord signrecord)
    {
        return toAjax(signrecordService.insertSignrecord(signrecord));
    }

    /**
     * 修改签到记录信息
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:edit')")
    @Log(title = "签到记录信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Signrecord signrecord)
    {
        return toAjax(signrecordService.updateSignrecord(signrecord));
    }

    /**
     * 删除签到记录信息
     */
    @PreAuthorize("@ss.hasPermi('signin:signin:remove')")
    @Log(title = "签到记录信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(signrecordService.deleteSignrecordByIds(ids));
    }

    /**
     * 签到
     */
    @Log(title = "签到记录信息", businessType = BusinessType.UPDATE)
    @PostMapping("/signin")
    public AjaxResult sign(@RequestBody Long signid)
    {
        //查询用户id
        Long userId = SecurityUtils.getUserId();
        //先查询该用户是否已经签到
        int signStatus = signrecordService.selectSignStatus(signid, userId);
        //判断用户角色
        String role = SecurityUtils.getLoginUser().getUser().getRoles().get(0).getRoleKey();
        if(!role.equals("student")){
            return AjaxResult.error("您不是学生，无法签到");
        }
        if(signStatus == 1){
            return AjaxResult.error("您已经签到过了");
        }else{
            //签到
            //查询时间
            //根据签到id查询签到截止时间
            Date endTime = signrecordService.selectEndTime(signid);
            //获取当前时间
            Date nowTime = new Date();
            //判断当前时间是否在签到截止时间之前
            if(nowTime.after(endTime)){
                return AjaxResult.error("签到已截止");
            }
            signrecordService.sign(signid, userId);
            return AjaxResult.success("签到成功");
        }
    }
}
