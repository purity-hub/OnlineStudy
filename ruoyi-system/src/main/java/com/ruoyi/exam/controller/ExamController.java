package com.ruoyi.exam.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.exam.domain.Exam;
import com.ruoyi.exam.service.IExamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试卷Controller
 *
 * @author ruoyi
 * @date 2023-04-05
 */
@RestController
@RequestMapping("/exam/exam")
public class ExamController extends BaseController
{
    @Autowired
    private IExamService examService;

    /**
     * 查询试卷列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Exam exam)
    {
        startPage();
        List<Exam> list = examService.selectExamList(exam);
        return getDataTable(list);
    }

    @GetMapping("/list1")
    public TableDataInfo list1(Exam exam)
    {
        List<Exam> list = examService.selectExamList(exam);
        Long sid = getUserId();
        //查询是否提交过试卷
        for (Exam exam1 : list) {
            exam1.setIsSubmit(examService.selectIsSubmit(exam1.getId(),sid));
        }
        return getDataTable(list);
    }

    /**
     * 导出试卷列表
     */
    @PreAuthorize("@ss.hasPermi('exam:exam:export')")
    @Log(title = "试卷", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Exam exam)
    {
        List<Exam> list = examService.selectExamList(exam);
        ExcelUtil<Exam> util = new ExcelUtil<Exam>(Exam.class);
        util.exportExcel(response, list, "试卷数据");
    }

    /**
     * 获取试卷详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(examService.selectExamById(id));
    }

    @GetMapping(value = "/noans/{id}")
    public AjaxResult getNoAnsInfo(@PathVariable("id") Long id)
    {
        return success(examService.selectExamNoAnsById(id));
    }

    @GetMapping(value = "/myans/{id}")
    public AjaxResult getMyAns(@PathVariable("id") Long id)
    {
        //获取当前用户id
        Long sid = getUserId();
        return success(examService.selectExamMyAnsById(id,sid));
    }

    /**
     * 新增试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:exam:add')")
    @Log(title = "试卷", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Exam exam)
    {
        exam.setCreateBy(getUsername());
        return toAjax(examService.insertExam(exam));
    }

    /**
     * 修改试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:exam:edit')")
    @Log(title = "试卷", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Exam exam)
    {
        return toAjax(examService.updateExam(exam));
    }

    /**
     * 删除试卷
     */
    @PreAuthorize("@ss.hasPermi('exam:exam:remove')")
    @Log(title = "试卷", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(examService.deleteExamByIds(ids));
    }
}
