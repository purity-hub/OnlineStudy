package com.ruoyi.notice.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.notice.mapper.NoticeMapper;
import com.ruoyi.notice.domain.Notice;
import com.ruoyi.notice.service.INoticeService;

/**
 * 课程通知公告Service业务层处理
 *
 * @author ruoyi
 * @date 2023-04-04
 */
@Service
public class NoticeServiceImpl implements INoticeService
{
    @Autowired
    private NoticeMapper noticeMapper;

    /**
     * 查询课程通知公告
     *
     * @param id 课程通知公告主键
     * @return 课程通知公告
     */
    @Override
    public Notice selectNoticeById(Long id)
    {
        return noticeMapper.selectNoticeById(id);
    }

    /**
     * 查询课程通知公告列表
     *
     * @param notice 课程通知公告
     * @return 课程通知公告
     */
    @Override
    public List<Notice> selectNoticeList(Notice notice)
    {
        return noticeMapper.selectNoticeList(notice);
    }

    /**
     * 新增课程通知公告
     *
     * @param notice 课程通知公告
     * @return 结果
     */
    @Override
    public int insertNotice(Notice notice)
    {
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改课程通知公告
     *
     * @param notice 课程通知公告
     * @return 结果
     */
    @Override
    public int updateNotice(Notice notice)
    {
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 批量删除课程通知公告
     *
     * @param ids 需要删除的课程通知公告主键
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(Long[] ids)
    {
        return noticeMapper.deleteNoticeByIds(ids);
    }

    /**
     * 删除课程通知公告信息
     *
     * @param id 课程通知公告主键
     * @return 结果
     */
    @Override
    public int deleteNoticeById(Long id)
    {
        return noticeMapper.deleteNoticeById(id);
    }
}
