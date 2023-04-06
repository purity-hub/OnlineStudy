package com.ruoyi.chapter.controller;

import com.ruoyi.chapter.domain.Chapter;
import com.ruoyi.chapter.service.IChapterService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDept;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.course.domain.Course;
import com.ruoyi.course.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * chapterController
 *
 * @author ruoyi
 * @date 2023-03-28
 */
@RestController
@RequestMapping("/chapter")
public class ChapterController extends BaseController
{
    @Autowired
    private IChapterService chapterService;

    @Autowired
    private ICourseService courseService;

    /**
     * 查询chapter列表
     */
    @GetMapping("/list")
    public AjaxResult list(Chapter chapter)
    {
        List<Chapter> list = chapterService.selectChapterList(chapter);
        return success(list);
    }

    /**
     * 导出chapter列表
     */
    @PreAuthorize("@ss.hasPermi('chapter:chapter:export')")
    @Log(title = "chapter", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Chapter chapter)
    {
        List<Chapter> list = chapterService.selectChapterList(chapter);
        ExcelUtil<Chapter> util = new ExcelUtil<Chapter>(Chapter.class);
        util.exportExcel(response, list, "chapter数据");
    }

    /**
     * 获取chapter详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(chapterService.selectChapterById(id));
    }

    /**
     * 新增chapter
     */
    @PreAuthorize("@ss.hasPermi('chapter:chapter:add')")
    @Log(title = "chapter", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Chapter chapter)
    {
        return toAjax(chapterService.insertChapter(chapter));
    }

    /**
     * 修改chapter
     */
    @PreAuthorize("@ss.hasPermi('chapter:chapter:edit')")
    @Log(title = "chapter", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Chapter chapter)
    {
        return toAjax(chapterService.updateChapter(chapter));
    }

    /**
     * 删除chapter
     */
    @PreAuthorize("@ss.hasPermi('chapter:chapter:remove')")
    @Log(title = "chapter", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(chapterService.deleteChapterByIds(ids));
    }

    @PreAuthorize("@ss.hasAnyRoles('admin,teacher')")
    @GetMapping("/courseTree")
    public AjaxResult deptTree(Course course)
    {
        Long userId = getUserId();
        course.setTeacher(userId);
        return success(courseService.selectCourseList(course));
    }
}
