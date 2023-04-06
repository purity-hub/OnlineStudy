package com.ruoyi.chapter.mapper;

import java.util.List;
import com.ruoyi.chapter.domain.Chapter;
import org.apache.ibatis.annotations.Param;

/**
 * chapterMapper接口
 *
 * @author ruoyi
 * @date 2023-03-28
 */
public interface ChapterMapper
{
    /**
     * 查询chapter
     *
     * @param id chapter主键
     * @return chapter
     */
    public Chapter selectChapterById(Long id);

    /**
     * 查询chapter列表
     *
     * @param chapter chapter
     * @return chapter集合
     */
    public List<Chapter> selectChapterList(Chapter chapter);

    /**
     * 新增chapter
     *
     * @param chapter chapter
     * @return 结果
     */
    public int insertChapter(Chapter chapter);

    /**
     * 修改chapter
     *
     * @param chapter chapter
     * @return 结果
     */
    public int updateChapter(Chapter chapter);

    /**
     * 删除chapter
     *
     * @param id chapter主键
     * @return 结果
     */
    public int deleteChapterById(Long id);

    /**
     * 批量删除chapter
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteChapterByIds(Long[] ids);

    List<Long> selectCidList(@Param("userId") Long userId);
}
