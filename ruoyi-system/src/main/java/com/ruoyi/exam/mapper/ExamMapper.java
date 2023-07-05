package com.ruoyi.exam.mapper;

import java.util.List;

import com.ruoyi.es.domain.Es;
import com.ruoyi.exam.domain.Exam;
import com.ruoyi.exam.domain.ExamQuestion;
import com.ruoyi.question.domain.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 试卷Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-05
 */
@Mapper
public interface ExamMapper
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
     * 删除试卷
     *
     * @param id 试卷主键
     * @return 结果
     */
    public int deleteExamById(Long id);

    /**
     * 批量删除试卷
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExamByIds(Long[] ids);

    /**
     * 批量删除题目
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
//    public int deleteQuestionByExamIds(Long[] ids);

    /**
     * 批量新增题目
     *
     * @param questionList 题目列表
     * @return 结果
     */
    public int batchQuestion(List<Question> questionList);

    /**
     * 单个新增题目
     * @param question
     * @return
     */
    public int insertQuestion(Question question);


    /**
     * 通过试卷主键删除题目信息
     *
     * @param id 试卷ID
     * @return 结果
     */
    public int deleteQuestionById(Long id);

    int selectIsSubmit(@Param("eid") Long eid, @Param("sid") Long sid);

    Es selectExamMyAnsById(@Param("eid") Long eid, @Param("sid") Long sid);

    void insertExamQuestion(ExamQuestion examQuestion);

    void deleteExamQuestionByExamIds(Long[] ids);
}
