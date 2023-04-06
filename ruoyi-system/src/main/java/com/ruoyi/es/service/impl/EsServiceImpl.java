package com.ruoyi.es.service.impl;

import java.util.HashMap;
import java.util.List;

import com.ruoyi.exam.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.es.mapper.EsMapper;
import com.ruoyi.es.domain.Es;
import com.ruoyi.es.service.IEsService;

/**
 * 试卷学生成绩Service业务层处理
 *
 * @author ruoyi
 * @date 2023-04-05
 */
@Service
public class EsServiceImpl implements IEsService
{
    @Autowired
    private EsMapper esMapper;

    /**
     * 查询试卷学生成绩
     *
     * @param id 试卷学生成绩主键
     * @return 试卷学生成绩
     */
    @Override
    public Es selectEsById(Long id)
    {
        return esMapper.selectEsById(id);
    }

    /**
     * 查询试卷学生成绩列表
     *
     * @param es 试卷学生成绩
     * @return 试卷学生成绩
     */
    @Override
    public List<Es> selectEsList(Es es)
    {
        return esMapper.selectEsList(es);
    }

    /**
     * 新增试卷学生成绩
     *
     * @param es 试卷学生成绩
     * @return 结果
     */
    @Override
    public int insertEs(Es es)
    {
        return esMapper.insertEs(es);
    }

    /**
     * 修改试卷学生成绩
     *
     * @param es 试卷学生成绩
     * @return 结果
     */
    @Override
    public int updateEs(Es es)
    {
        return esMapper.updateEs(es);
    }

    /**
     * 批量删除试卷学生成绩
     *
     * @param ids 需要删除的试卷学生成绩主键
     * @return 结果
     */
    @Override
    public int deleteEsByIds(Long[] ids)
    {
        return esMapper.deleteEsByIds(ids);
    }

    /**
     * 删除试卷学生成绩信息
     *
     * @param id 试卷学生成绩主键
     * @return 结果
     */
    @Override
    public int deleteEsById(Long id)
    {
        return esMapper.deleteEsById(id);
    }

    @Override
    public List<Question> selectEsByEid(Long eid) {
        return esMapper.selectEsByEid(eid);
    }

    @Override
    public int selectEsByEidAndSid(Long eid, Long userId) {
        return esMapper.selectEsByEidAndSid(eid,userId);
    }
}
