package com.ruoyi.signin.mapper;

import java.util.Date;
import java.util.List;

import com.ruoyi.signin.domain.SigninView;
import com.ruoyi.signin.domain.Signrecord;
import com.ruoyi.signin.domain.Signin;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

/**
 * 签到记录信息Mapper接口
 *
 * @author ruoyi
 * @date 2023-04-02
 */
public interface SignrecordMapper
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
     * 删除签到记录信息
     *
     * @param id 签到记录信息主键
     * @return 结果
     */
    public int deleteSignrecordById(Long id);

    /**
     * 批量删除签到记录信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSignrecordByIds(Long[] ids);

    /**
     * 批量删除签到
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSigninBySignIds(Long[] ids);

    /**
     * 批量新增签到
     *
     * @param signinList 签到列表
     * @return 结果
     */
    public int batchSignin(List<Signin> signinList);


    /**
     * 通过签到记录信息主键删除签到信息
     *
     * @param id 签到记录信息ID
     * @return 结果
     */
    public int deleteSigninBySignId(Long id);

    List<SigninView> selectSigninList(@Param("courseId") Long courseId);

    String selectTeacherName(@Param("courseId") Long courseId);

    String selectCourseName(@Param("courseId") Long courseId);

    int selectTotalUserNum(Long courseId);

    int selectSignedUserNum(Long courseId);

    int selectSignStatus(@Param("signId") Long id, @Param("userId") Long userId);

    void sign(@Param("signId") Long signId, @Param("userId")Long userId);

    Date selectEndTime(@Param("signId") Long signId);
}
