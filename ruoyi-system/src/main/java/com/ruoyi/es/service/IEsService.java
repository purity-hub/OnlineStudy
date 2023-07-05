package com.ruoyi.es.service;

import java.util.HashMap;
import java.util.List;
import com.ruoyi.es.domain.Es;
import com.ruoyi.question.domain.Question;

/**
 * 试卷学生成绩Service接口
 *
 * @author ruoyi
 * @date 2023-04-05
 */
public interface IEsService
{
    /**
     * 查询试卷学生成绩
     *
     * @param id 试卷学生成绩主键
     * @return 试卷学生成绩
     */
    public Es selectEsById(Long id);

    /**
     * 查询试卷学生成绩列表
     *
     * @param es 试卷学生成绩
     * @return 试卷学生成绩集合
     */
    public List<Es> selectEsList(Es es);

    /**
     * 新增试卷学生成绩
     *
     * @param es 试卷学生成绩
     * @return 结果
     */
    public int insertEs(Es es);

    /**
     * 修改试卷学生成绩
     *
     * @param es 试卷学生成绩
     * @return 结果
     */
    public int updateEs(Es es);

    /**
     * 批量删除试卷学生成绩
     *
     * @param ids 需要删除的试卷学生成绩主键集合
     * @return 结果
     */
    public int deleteEsByIds(Long[] ids);

    /**
     * 删除试卷学生成绩信息
     *
     * @param id 试卷学生成绩主键
     * @return 结果
     */
    public int deleteEsById(Long id);

    List<Question> selectEsByEid(Long eid);

    int selectEsByEidAndSid(Long eid, Long userId);
}
