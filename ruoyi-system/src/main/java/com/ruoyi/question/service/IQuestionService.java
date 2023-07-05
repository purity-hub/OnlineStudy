package com.ruoyi.question.service;

import java.util.List;
import com.ruoyi.question.domain.Question;

/**
 * 题目Service接口
 *
 * @author ruoyi
 * @date 2023-06-12
 */
public interface IQuestionService
{
    /**
     * 查询题目
     *
     * @param id 题目主键
     * @return 题目
     */
    public Question selectQuestionById(Long id);

    /**
     * 查询题目列表
     *
     * @param question 题目
     * @return 题目集合
     */
    public List<Question> selectQuestionList(Question question);

    /**
     * 新增题目
     *
     * @param question 题目
     * @return 结果
     */
    public int insertQuestion(Question question);

    /**
     * 修改题目
     *
     * @param question 题目
     * @return 结果
     */
    public int updateQuestion(Question question);

    /**
     * 批量删除题目
     *
     * @param ids 需要删除的题目主键集合
     * @return 结果
     */
    public int deleteQuestionByIds(Long[] ids);

    /**
     * 删除题目信息
     *
     * @param id 题目主键
     * @return 结果
     */
    public int deleteQuestionById(Long id);
}
