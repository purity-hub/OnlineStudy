package com.ruoyi.oj.service;

import java.util.List;

import com.ruoyi.oj.domain.Comments;
import com.ruoyi.oj.domain.Oj;

/**
 * ojService接口
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public interface IOjService
{
    /**
     * 查询oj
     *
     * @param id oj主键
     * @return oj
     */
    public Oj selectOjById(Long id);

    /**
     * 查询oj列表
     *
     * @param oj oj
     * @return oj集合
     */
    public List<Oj> selectOjList(Oj oj);

    /**
     * 新增oj
     *
     * @param oj oj
     * @return 结果
     */
    public int insertOj(Oj oj);

    /**
     * 修改oj
     *
     * @param oj oj
     * @return 结果
     */
    public int updateOj(Oj oj);

    /**
     * 批量删除oj
     *
     * @param ids 需要删除的oj主键集合
     * @return 结果
     */
    public int deleteOjByIds(Long[] ids);

    /**
     * 删除oj信息
     *
     * @param id oj主键
     * @return 结果
     */
    public int deleteOjById(Long id);

    int insertSo(Long sid, Long oid);

    int isExistSo(Long sid, Long oid);

    List<Comments> getComments(Long id);
}
