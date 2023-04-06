package com.ruoyi.classfile.mapper;

import java.util.List;
import com.ruoyi.classfile.domain.Classfile;

/**
 * classfileMapper接口
 *
 * @author ruoyi
 * @date 2023-04-06
 */
public interface ClassfileMapper
{
    /**
     * 查询classfile
     *
     * @param id classfile主键
     * @return classfile
     */
    public Classfile selectClassfileById(Long id);

    /**
     * 查询classfile列表
     *
     * @param classfile classfile
     * @return classfile集合
     */
    public List<Classfile> selectClassfileList(Classfile classfile);

    /**
     * 新增classfile
     *
     * @param classfile classfile
     * @return 结果
     */
    public int insertClassfile(Classfile classfile);

    /**
     * 修改classfile
     *
     * @param classfile classfile
     * @return 结果
     */
    public int updateClassfile(Classfile classfile);

    /**
     * 删除classfile
     *
     * @param id classfile主键
     * @return 结果
     */
    public int deleteClassfileById(Long id);

    /**
     * 批量删除classfile
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteClassfileByIds(Long[] ids);
}
