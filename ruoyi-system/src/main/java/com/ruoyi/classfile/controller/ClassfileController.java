package com.ruoyi.classfile.controller;

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
import com.ruoyi.classfile.domain.Classfile;
import com.ruoyi.classfile.service.IClassfileService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * classfileController
 *
 * @author ruoyi
 * @date 2023-04-06
 */
@RestController
@RequestMapping("/classfile/classfile")
public class ClassfileController extends BaseController
{
    @Autowired
    private IClassfileService classfileService;

    /**
     * 查询classfile列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Classfile classfile)
    {
        startPage();
        List<Classfile> list = classfileService.selectClassfileList(classfile);
        return getDataTable(list);
    }

    /**
     * 导出classfile列表
     */
    @Log(title = "classfile", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Classfile classfile)
    {
        List<Classfile> list = classfileService.selectClassfileList(classfile);
        ExcelUtil<Classfile> util = new ExcelUtil<Classfile>(Classfile.class);
        util.exportExcel(response, list, "classfile数据");
    }

    /**
     * 获取classfile详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(classfileService.selectClassfileById(id));
    }

    /**
     * 新增classfile
     */
    @PreAuthorize("@ss.hasAnyRoles('teacher,admin')")
    @Log(title = "classfile", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Classfile classfile)
    {
        return toAjax(classfileService.insertClassfile(classfile));
    }

    /**
     * 修改classfile
     */
    @PreAuthorize("@ss.hasAnyRoles('teacher,admin')")
    @Log(title = "classfile", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Classfile classfile)
    {
        return toAjax(classfileService.updateClassfile(classfile));
    }

    /**
     * 删除classfile
     */
    @PreAuthorize("@ss.hasAnyRoles('teacher,admin')")
    @Log(title = "classfile", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(classfileService.deleteClassfileByIds(ids));
    }
}
