package com.ruoyi.signin.service;

import java.util.Date;
import java.util.List;

import com.ruoyi.signin.domain.SigninView;
import com.ruoyi.signin.domain.Signrecord;

/**
 * 签到记录信息Service接口
 *
 * @author ruoyi
 * @date 2023-04-02
 */
public interface ISignrecordService
{
    /**
     * 查询签到记录信息
     *
     * @param id 签到记录信息主键
     * @return 签到记录信息
     */
    public Signrecord selectSignrecordById(Long id);

    /**
     * 查询签到记录信息列表
     *
     * @param signrecord 签到记录信息
     * @return 签到记录信息集合
     */
    public List<Signrecord> selectSignrecordList(Signrecord signrecord);

    /**
     * 新增签到记录信息
     *
     * @param signrecord 签到记录信息
     * @return 结果
     */
    public int insertSignrecord(Signrecord signrecord);

    /**
     * 修改签到记录信息
     *
     * @param signrecord 签到记录信息
     * @return 结果
     */
    public int updateSignrecord(Signrecord signrecord);

    /**
     * 批量删除签到记录信息
     *
     * @param ids 需要删除的签到记录信息主键集合
     * @return 结果
     */
    public int deleteSignrecordByIds(Long[] ids);

    /**
     * 删除签到记录信息信息
     *
     * @param id 签到记录信息主键
     * @return 结果
     */
    public int deleteSignrecordById(Long id);

    List<SigninView> selectSigninList(Signrecord signrecord);

    String selectTeacherName(Long courseId);

    String selectCourseName(Long courseId);

    int selectTotalUserNum(Long courseId);

    int selectSignedUserNum(Long courseId);

    int selectSignStatus(Long id, Long userId);

    void sign(Long signid, Long userId);

    Date selectEndTime(Long signid);
}
