package com.ruoyi.classfile.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.classfile.mapper.ClassfileMapper;
import com.ruoyi.classfile.domain.Classfile;
import com.ruoyi.classfile.service.IClassfileService;

/**
 * classfileService业务层处理
 *
 * @author ruoyi
 * @date 2023-04-06
 */
@Service
public class ClassfileServiceImpl implements IClassfileService
{
    @Autowired
    private ClassfileMapper classfileMapper;

    /**
     * 查询classfile
     *
     * @param id classfile主键
     * @return classfile
     */
    @Override
    public Classfile selectClassfileById(Long id)
    {
        return classfileMapper.selectClassfileById(id);
    }

    /**
     * 查询classfile列表
     *
     * @param classfile classfile
     * @return classfile
     */
    @Override
    public List<Classfile> selectClassfileList(Classfile classfile)
    {
        return classfileMapper.selectClassfileList(classfile);
    }

    /**
     * 新增classfile
     *
     * @param classfile classfile
     * @return 结果
     */
    @Override
    public int insertClassfile(Classfile classfile)
    {
        return classfileMapper.insertClassfile(classfile);
    }

    /**
     * 修改classfile
     *
     * @param classfile classfile
     * @return 结果
     */
    @Override
    public int updateClassfile(Classfile classfile)
    {
        return classfileMapper.updateClassfile(classfile);
    }

    /**
     * 批量删除classfile
     *
     * @param ids 需要删除的classfile主键
     * @return 结果
     */
    @Override
    public int deleteClassfileByIds(Long[] ids)
    {
        return classfileMapper.deleteClassfileByIds(ids);
    }

    /**
     * 删除classfile信息
     *
     * @param id classfile主键
     * @return 结果
     */
    @Override
    public int deleteClassfileById(Long id)
    {
        return classfileMapper.deleteClassfileById(id);
    }
}
