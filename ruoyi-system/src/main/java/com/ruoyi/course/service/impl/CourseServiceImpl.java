package com.ruoyi.course.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.spring.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.course.mapper.CourseMapper;
import com.ruoyi.course.domain.Course;
import com.ruoyi.course.service.ICourseService;

/**
 * 课程Service业务层处理
 *
 * @author ruoyi
 * @date 2023-03-27
 */
@Service
public class CourseServiceImpl implements ICourseService
{
    @Autowired
    private CourseMapper courseMapper;

    /**
     * 查询课程
     *
     * @param id 课程主键
     * @return 课程
     */
    @Override
    public Course selectCourseById(Long id)
    {
        return courseMapper.selectCourseById(id);
    }

    /**
     * 查询课程列表
     *
     * @param course 课程
     * @return 课程
     */
    @Override
    public List<Course> selectCourseList(Course course)
    {
        return courseMapper.selectCourseList(course);
    }

    /**
     * 新增课程
     *
     * @param course 课程
     * @return 结果
     */
    @Override
    public int insertCourse(Course course)
    {
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改课程
     *
     * @param course 课程
     * @return 结果
     */
    @Override
    public int updateCourse(Course course)
    {
        return courseMapper.updateCourse(course);
    }

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的课程主键
     * @return 结果
     */
    @Override
    public int deleteCourseByIds(Long[] ids)
    {
        return courseMapper.deleteCourseByIds(ids);
    }

    /**
     * 删除课程信息
     *
     * @param id 课程主键
     * @return 结果
     */
    @Override
    public int deleteCourseById(Long id)
    {
        return courseMapper.deleteCourseById(id);
    }

    /**
     * 查询我的课程列表
     * @return 我的已选课程列表
     */
    @Override
    public List<Course> selectMyCourseList() {
        //获取当前用户的id
        Long userId = SecurityUtils.getUserId();
        return courseMapper.selectMyCourseList(userId);
    }

    /**
     * 查询公开课程列表
     * @return 公开课程列表
     */
    @Override
    public List<Course> selectPublicCourseList() {
        return courseMapper.selectPublicCourseList();
    }

    /**
     * 选课
     * @param courseId 课程id
     * @return 是否选课成功
     */
    @Override
    public int chooseCourse(Long courseId) {
        //获取当前用户的id
        Long userId = SecurityUtils.getUserId();
        //获取角色
        String role = SecurityUtils.getLoginUser().getUser().getRoles().get(0).getRoleKey();
        //如果是学生
        if(role.equals("student")){
            //判断是否已选课
            if(courseMapper.isChoose(courseId,userId) == 0){
                //选课
                return courseMapper.chooseCourse(courseId,userId);
            }
            else{
                return 22;
            }
        }
        else{
            //33表示不是学生
            return 33;
        }
    }

    @Override
    public List<SysUser> selectTeacherList() {
        return courseMapper.selectTeacherList();
    }

    /**
     * 根据教师id查询教师姓名
     * @param teacherid 教师id
     * @return 教师姓名
     */
    @Override
    public String selectTeacherNameById(Long teacherid) {
        return courseMapper.selectTeacherNameById(teacherid);
    }
}
