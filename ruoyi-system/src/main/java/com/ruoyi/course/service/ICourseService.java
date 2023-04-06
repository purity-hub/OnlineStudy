package com.ruoyi.course.service;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.course.domain.Course;

import java.util.List;

/**
 * 课程Service接口
 *
 * @author ruoyi
 * @date 2023-03-27
 */
public interface ICourseService
{
    /**
     * 查询课程
     *
     * @param id 课程主键
     * @return 课程
     */
    public Course selectCourseById(Long id);

    /**
     * 查询课程列表
     *
     * @param course 课程
     * @return 课程集合
     */
    public List<Course> selectCourseList(Course course);

    /**
     * 新增课程
     *
     * @param course 课程
     * @return 结果
     */
    public int insertCourse(Course course);

    /**
     * 修改课程
     *
     * @param course 课程
     * @return 结果
     */
    public int updateCourse(Course course);

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的课程主键集合
     * @return 结果
     */
    public int deleteCourseByIds(Long[] ids);

    /**
     * 删除课程信息
     *
     * @param id 课程主键
     * @return 结果
     */
    public int deleteCourseById(Long id);

    List<Course> selectMyCourseList();

    List<Course> selectPublicCourseList();

    int chooseCourse(Long courseId);

    List<SysUser> selectTeacherList();

    String selectTeacherNameById(Long teacherid);
}
