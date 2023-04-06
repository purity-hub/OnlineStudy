package com.ruoyi.course.mapper;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.course.domain.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

/**
 * 课程Mapper接口
 *
 * @author ruoyi
 * @date 2023-03-27
 */
public interface CourseMapper
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
     * 删除课程
     *
     * @param id 课程主键
     * @return 结果
     */
    public int deleteCourseById(Long id);

    /**
     * 批量删除课程
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCourseByIds(Long[] ids);

    List<Course> selectMyCourseList(@Param("userId") Long userId);

    List<Course> selectPublicCourseList();

    int isChoose(@Param("courseId") Long courseId, @Param("userId") Long userId);

    int chooseCourse(@Param("courseId") Long courseId, @Param("userId") Long userId);

    List<SysUser> selectTeacherList();

    String selectTeacherNameById(@Param("teacherid") Long teacherid);
}
