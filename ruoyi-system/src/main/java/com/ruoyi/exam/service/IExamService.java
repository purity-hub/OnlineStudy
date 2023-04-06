package com.ruoyi.exam.service;

import java.util.List;

import com.ruoyi.es.domain.Es;
import com.ruoyi.exam.domain.Exam;

/**
 * 试卷Service接口
 *
 * @author ruoyi
 * @date 2023-04-05
 */
public interface IExamService
{
    /**
     * 查询试卷
     *
     * @param id 试卷主键
     * @return 试卷
     */
    public Exam selectExamById(Long id);

    public Exam selectExamNoAnsById(Long id);

    /**
     * 查询试卷列表
     *
     * @param exam 试卷
     * @return 试卷集合
     */
    public List<Exam> selectExamList(Exam exam);

    /**
     * 新增试卷
     *
     * @param exam 试卷
     * @return 结果
     */
    public int insertExam(Exam exam);

    /**
     * 修改试卷
     *
     * @param exam 试卷
     * @return 结果
     */
    public int updateExam(Exam exam);

    /**
     * 批量删除试卷
     *
     * @param ids 需要删除的试卷主键集合
     * @return 结果
     */
    public int deleteExamByIds(Long[] ids);

    /**
     * 删除试卷信息
     *
     * @param id 试卷主键
     * @return 结果
     */
    public int deleteExamById(Long id);

    int selectIsSubmit(Long eid, Long sid);

    Es selectExamMyAnsById(Long eid, Long sid);
}
