package com.ruoyi.question.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.question.mapper.QuestionMapper;
import com.ruoyi.question.domain.Question;
import com.ruoyi.question.service.IQuestionService;

/**
 * 题目Service业务层处理
 *
 * @author ruoyi
 * @date 2023-06-12
 */
@Service
public class QuestionServiceImpl implements IQuestionService
{
    @Autowired
    private QuestionMapper questionMapper;

    /**
     * 查询题目
     *
     * @param id 题目主键
     * @return 题目
     */
    @Override
    public Question selectQuestionById(Long id)
    {
        return questionMapper.selectQuestionById(id);
    }

    /**
     * 查询题目列表
     *
     * @param question 题目
     * @return 题目
     */
    @Override
    public List<Question> selectQuestionList(Question question)
    {
        return questionMapper.selectQuestionList(question);
    }

    /**
     * 新增题目
     *
     * @param question 题目
     * @return 结果
     */
    @Override
    public int insertQuestion(Question question)
    {
        question.setCreateTime(DateUtils.getNowDate());
        return questionMapper.insertQuestion(question);
    }

    /**
     * 修改题目
     *
     * @param question 题目
     * @return 结果
     */
    @Override
    public int updateQuestion(Question question)
    {
        question.setUpdateTime(DateUtils.getNowDate());
        return questionMapper.updateQuestion(question);
    }

    /**
     * 批量删除题目
     *
     * @param ids 需要删除的题目主键
     * @return 结果
     */
    @Override
    public int deleteQuestionByIds(Long[] ids)
    {
        return questionMapper.deleteQuestionByIds(ids);
    }

    /**
     * 删除题目信息
     *
     * @param id 题目主键
     * @return 结果
     */
    @Override
    public int deleteQuestionById(Long id)
    {
        return questionMapper.deleteQuestionById(id);
    }
}
