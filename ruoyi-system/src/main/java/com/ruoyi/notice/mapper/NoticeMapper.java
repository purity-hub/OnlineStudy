package com.ruoyi.notice.mapper;

import java.util.List;
import com.ruoyi.notice.domain.Notice;

/**
 * 课程通知公告Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-04
 */
public interface NoticeMapper
{
    /**
     * 查询课程通知公告
     *
     * @param id 课程通知公告主键
     * @return 课程通知公告
     */
    public Notice selectNoticeById(Long id);

    /**
     * 查询课程通知公告列表
     *
     * @param notice 课程通知公告
     * @return 课程通知公告集合
     */
    public List<Notice> selectNoticeList(Notice notice);

    /**
     * 新增课程通知公告
     *
     * @param notice 课程通知公告
     * @return 结果
     */
    public int insertNotice(Notice notice);

    /**
     * 修改课程通知公告
     *
     * @param notice 课程通知公告
     * @return 结果
     */
    public int updateNotice(Notice notice);

    /**
     * 删除课程通知公告
     *
     * @param id 课程通知公告主键
     * @return 结果
     */
    public int deleteNoticeById(Long id);

    /**
     * 批量删除课程通知公告
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNoticeByIds(Long[] ids);
}
