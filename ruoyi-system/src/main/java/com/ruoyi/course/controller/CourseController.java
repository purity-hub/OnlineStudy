package com.ruoyi.course.controller;

import com.ruoyi.chapter.domain.Chapter;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.course.domain.Course;
import com.ruoyi.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 课程Controller
 *
 * @author ruoyi
 * @date 2023-03-27
 */
@RestController
@RequestMapping("/course")
public class CourseController extends BaseController
{
    @Autowired
    private ICourseService courseService;

    /**
     * 查询课程列表
     */
    @PreAuthorize("@ss.hasAnyRoles('teacher,admin')")
    @GetMapping("/list")
    public TableDataInfo list(Course course)
    {
        startPage();
        //查看已选课程
        //获取当前用户id
        Long userId = getUserId();
        course.setTeacher(userId);
        List<Course> list = courseService.selectCourseList(course);
        return getDataTable(list);
    }

    /**
     * 导出课程列表
     */
    @PreAuthorize("@ss.hasPermi('system:course:export')")
    @Log(title = "课程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Course course)
    {
        List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        util.exportExcel(response, list, "课程数据");
    }

    /**
     * 获取课程详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(courseService.selectCourseById(id));
    }

    /**
     * 新增课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:add')")
    @Log(title = "课程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Course course)
    {
        return toAjax(courseService.insertCourse(course));
    }

    /**
     * 修改课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Course course)
    {
        return toAjax(courseService.updateCourse(course));
    }

    /**
     * 删除课程
     */
    @PreAuthorize("@ss.hasPermi('system:course:remove')")
    @Log(title = "课程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(courseService.deleteCourseByIds(ids));
    }

    @PreAuthorize("@ss.hasPermi('system:user:list')")
    @GetMapping("/courseTree")
    public AjaxResult courseTree(Course course)
    {
        return success(courseService.selectCourseList(course));
    }

    @GetMapping("/listmycourse")
    public TableDataInfo listMyCourse()
    {
        startPage();
        //查看已选课程
        List<Course> list = courseService.selectMyCourseList();
        return getDataTable(list);
    }

    @GetMapping("/listpubliccourse")
    public TableDataInfo listPublicCourse()
    {
        startPage();
        //查看已选课程
        List<Course> list = courseService.selectPublicCourseList();
        return getDataTable(list);
    }

    @GetMapping("/choosecourse/{courseId}")
    public AjaxResult chooseCourse(@PathVariable("courseId") Long courseId)
    {
        //选择课程
        int isSuccess = courseService.chooseCourse(courseId);
        if(isSuccess == 1)
            return success();
        else if(isSuccess == 22)
            return error("课程已选,请勿重复选择");
        else if(isSuccess == 33)
            return error("您不是学生,无法选择课程");
        else
            return error("错误");
    }

    @GetMapping("/listteacher")
    public AjaxResult listTeacher()
    {
        startPage();
        //查看所有教师
        List<SysUser> list = courseService.selectTeacherList();
        return success(list);
    }

    @GetMapping("/getteachername/{teacherid}")
    public AjaxResult getTeacherName(@PathVariable("teacherid") Long teacherid)
    {
        //获取教师姓名
        String teacherName = courseService.selectTeacherNameById(teacherid);
        return success(teacherName);
    }
}
