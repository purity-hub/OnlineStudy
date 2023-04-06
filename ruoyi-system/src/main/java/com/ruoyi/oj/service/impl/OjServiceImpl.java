package com.ruoyi.oj.service.impl;

import java.util.List;

import com.ruoyi.oj.domain.Comments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.oj.domain.Testcase;
import com.ruoyi.oj.mapper.OjMapper;
import com.ruoyi.oj.domain.Oj;
import com.ruoyi.oj.service.IOjService;

/**
 * ojService业务层处理
 *
 * @author ruoyi
 * @date 2023-03-28
 */
@Service
public class OjServiceImpl implements IOjService
{
    @Autowired
    private OjMapper ojMapper;

    /**
     * 查询oj
     *
     * @param id oj主键
     * @return oj
     */
    @Override
    public Oj selectOjById(Long id)
    {
        return ojMapper.selectOjById(id);
    }

    /**
     * 查询oj列表
     *
     * @param oj oj
     * @return oj
     */
    @Override
    public List<Oj> selectOjList(Oj oj)
    {
        return ojMapper.selectOjList(oj);
    }

    /**
     * 新增oj
     *
     * @param oj oj
     * @return 结果
     */
    @Transactional
    @Override
    public int insertOj(Oj oj)
    {
        int rows = ojMapper.insertOj(oj);
        insertTestcase(oj);
        return rows;
    }

    /**
     * 修改oj
     *
     * @param oj oj
     * @return 结果
     */
    @Transactional
    @Override
    public int updateOj(Oj oj)
    {
        ojMapper.deleteTestcaseByOid(oj.getId());
        insertTestcase(oj);
        return ojMapper.updateOj(oj);
    }

    /**
     * 批量删除oj
     *
     * @param ids 需要删除的oj主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteOjByIds(Long[] ids)
    {
        ojMapper.deleteTestcaseByOids(ids);
        return ojMapper.deleteOjByIds(ids);
    }

    /**
     * 删除oj信息
     *
     * @param id oj主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteOjById(Long id)
    {
        ojMapper.deleteTestcaseByOid(id);
        return ojMapper.deleteOjById(id);
    }

    @Override
    public int insertSo(Long sid, Long oid) {
        return ojMapper.insertSo(sid,oid);
    }

    @Override
    public int isExistSo(Long sid, Long oid) {
        return ojMapper.isExistSo(sid,oid);
    }

    @Override
    public List<Comments> getComments(Long id) {
        return ojMapper.getComments(id);
    }

    /**
     * 新增用例与答案信息
     *
     * @param oj oj对象
     */
    public void insertTestcase(Oj oj)
    {
        List<Testcase> testcaseList = oj.getTestcaseList();
        Long id = oj.getId();
        if (StringUtils.isNotNull(testcaseList))
        {
            List<Testcase> list = new ArrayList<Testcase>();
            for (Testcase testcase : testcaseList)
            {
                testcase.setOid(id);
                list.add(testcase);
            }
            if (list.size() > 0)
            {
                ojMapper.batchTestcase(list);
            }
        }
    }
}
