package com.ruoyi.oj.mapper;

import java.util.List;

import com.ruoyi.oj.domain.Comments;
import com.ruoyi.oj.domain.Oj;
import com.ruoyi.oj.domain.Testcase;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

/**
 * ojMapper接口
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public interface OjMapper
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
     * 删除oj
     *
     * @param id oj主键
     * @return 结果
     */
    public int deleteOjById(Long id);

    /**
     * 批量删除oj
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOjByIds(Long[] ids);

    /**
     * 批量删除用例与答案
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTestcaseByOids(Long[] ids);

    /**
     * 批量新增用例与答案
     *
     * @param testcaseList 用例与答案列表
     * @return 结果
     */
    public int batchTestcase(List<Testcase> testcaseList);


    /**
     * 通过oj主键删除用例与答案信息
     *
     * @param id ojID
     * @return 结果
     */
    public int deleteTestcaseByOid(Long id);

    public int isExistSo(@Param("sid") Long sid, @Param("oid") Long oid);

    public int insertSo(@Param("sid") Long sid, @Param("oid") Long oid);

    List<Comments> getComments(@Param("id")Long id);
}
