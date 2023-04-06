package com.ruoyi.exam.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.es.domain.Es;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.exam.domain.Question;
import com.ruoyi.exam.mapper.ExamMapper;
import com.ruoyi.exam.domain.Exam;
import com.ruoyi.exam.service.IExamService;

/**
 * 试卷Service业务层处理
 *
 * @author ruoyi
 * @date 2023-04-05
 */
@Service
public class ExamServiceImpl implements IExamService
{
    @Autowired
    private ExamMapper examMapper;

    /**
     * 查询试卷
     *
     * @param id 试卷主键
     * @return 试卷
     */
    @Override
    public Exam selectExamById(Long id)
    {
        return examMapper.selectExamById(id);
    }

    @Override
    public Exam selectExamNoAnsById(Long id) {
        return examMapper.selectExamNoAnsById(id);
    }

    /**
     * 查询试卷列表
     *
     * @param exam 试卷
     * @return 试卷
     */
    @Override
    public List<Exam> selectExamList(Exam exam)
    {
        return examMapper.selectExamList(exam);
    }

    /**
     * 新增试卷
     *
     * @param exam 试卷
     * @return 结果
     */
    @Transactional
    @Override
    public int insertExam(Exam exam)
    {
        exam.setCreateTime(DateUtils.getNowDate());
        int rows = examMapper.insertExam(exam);
        insertQuestion(exam);
        return rows;
    }

    /**
     * 修改试卷
     *
     * @param exam 试卷
     * @return 结果
     */
    @Transactional
    @Override
    public int updateExam(Exam exam)
    {
        examMapper.deleteQuestionByExamId(exam.getId());
        insertQuestion(exam);
        return examMapper.updateExam(exam);
    }

    /**
     * 批量删除试卷
     *
     * @param ids 需要删除的试卷主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteExamByIds(Long[] ids)
    {
        examMapper.deleteQuestionByExamIds(ids);
        return examMapper.deleteExamByIds(ids);
    }

    /**
     * 删除试卷信息
     *
     * @param id 试卷主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteExamById(Long id)
    {
        examMapper.deleteQuestionByExamId(id);
        return examMapper.deleteExamById(id);
    }

    @Override
    public int selectIsSubmit(Long eid,Long sid) {
        return examMapper.selectIsSubmit(eid,sid);
    }

    @Override
    public Es selectExamMyAnsById(Long eid, Long sid) {
        return examMapper.selectExamMyAnsById(eid,sid);
    }

    /**
     * 新增题目信息
     *
     * @param exam 试卷对象
     */
    public void insertQuestion(Exam exam)
    {
        List<Question> questionList = exam.getQuestionList();
        Long id = exam.getId();
        if (StringUtils.isNotNull(questionList))
        {
            List<Question> list = new ArrayList<Question>();
            for (Question question : questionList)
            {
                question.setExamId(id);
                list.add(question);
            }
            if (list.size() > 0)
            {
                examMapper.batchQuestion(list);
            }
        }
    }
}
