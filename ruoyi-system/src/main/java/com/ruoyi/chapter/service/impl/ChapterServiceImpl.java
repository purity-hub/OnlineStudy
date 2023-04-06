package com.ruoyi.chapter.service.impl;

import com.ruoyi.chapter.domain.Chapter;
import com.ruoyi.chapter.mapper.ChapterMapper;
import com.ruoyi.chapter.service.IChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * chapterService业务层处理
 *
 * @author ruoyi
 * @date 2023-03-28
 */
@Service
public class ChapterServiceImpl implements IChapterService
{
    @Autowired
    private ChapterMapper chapterMapper;

    /**
     * 查询chapter
     *
     * @param id chapter主键
     * @return chapter
     */
    @Override
    public Chapter selectChapterById(Long id)
    {
        return chapterMapper.selectChapterById(id);
    }

    /**
     * 查询chapter列表
     *
     * @param chapter chapter
     * @return chapter
     */
    @Override
    public List<Chapter> selectChapterList(Chapter chapter)
    {
        return chapterMapper.selectChapterList(chapter);
    }

    /**
     * 新增chapter
     *
     * @param chapter chapter
     * @return 结果
     */
    @Override
    public int insertChapter(Chapter chapter)
    {
        return chapterMapper.insertChapter(chapter);
    }

    /**
     * 修改chapter
     *
     * @param chapter chapter
     * @return 结果
     */
    @Override
    public int updateChapter(Chapter chapter)
    {
        return chapterMapper.updateChapter(chapter);
    }

    /**
     * 批量删除chapter
     *
     * @param ids 需要删除的chapter主键
     * @return 结果
     */
    @Override
    public int deleteChapterByIds(Long[] ids)
    {
        return chapterMapper.deleteChapterByIds(ids);
    }

    /**
     * 删除chapter信息
     *
     * @param id chapter主键
     * @return 结果
     */
    @Override
    public int deleteChapterById(Long id)
    {
        return chapterMapper.deleteChapterById(id);
    }

    @Override
    public List<Long> selectCidList(Long userId) {
        return chapterMapper.selectCidList(userId);
    }
}
