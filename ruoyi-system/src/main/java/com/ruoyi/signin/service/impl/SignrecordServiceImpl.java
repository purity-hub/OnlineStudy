package com.ruoyi.signin.service.impl;

import java.security.Security;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.signin.domain.SigninView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.signin.domain.Signin;
import com.ruoyi.signin.mapper.SignrecordMapper;
import com.ruoyi.signin.domain.Signrecord;
import com.ruoyi.signin.service.ISignrecordService;

/**
 * 签到记录信息Service业务层处理
 *
 * @author ruoyi
 * @date 2023-04-02
 */
@Service
public class SignrecordServiceImpl implements ISignrecordService
{
    @Autowired
    private SignrecordMapper signrecordMapper;

    /**
     * 查询签到记录信息
     *
     * @param id 签到记录信息主键
     * @return 签到记录信息
     */
    @Override
    public Signrecord selectSignrecordById(Long id)
    {
        return signrecordMapper.selectSignrecordById(id);
    }

    /**
     * 查询签到记录信息列表
     *
     * @param signrecord 签到记录信息
     * @return 签到记录信息
     */
    @Override
    public List<Signrecord> selectSignrecordList(Signrecord signrecord)
    {
        return signrecordMapper.selectSignrecordList(signrecord);
    }

    /**
     * 新增签到记录信息
     *
     * @param signrecord 签到记录信息
     * @return 结果
     */
    @Transactional
    @Override
    public int insertSignrecord(Signrecord signrecord)
    {
        int rows = signrecordMapper.insertSignrecord(signrecord);
        insertSignin(signrecord);
        return rows;
    }

    /**
     * 修改签到记录信息
     *
     * @param signrecord 签到记录信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updateSignrecord(Signrecord signrecord)
    {
        signrecordMapper.deleteSigninBySignId(signrecord.getId());
        insertSignin(signrecord);
        return signrecordMapper.updateSignrecord(signrecord);
    }

    /**
     * 批量删除签到记录信息
     *
     * @param ids 需要删除的签到记录信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSignrecordByIds(Long[] ids)
    {
        signrecordMapper.deleteSigninBySignIds(ids);
        return signrecordMapper.deleteSignrecordByIds(ids);
    }

    /**
     * 删除签到记录信息信息
     *
     * @param id 签到记录信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteSignrecordById(Long id)
    {
        signrecordMapper.deleteSigninBySignId(id);
        return signrecordMapper.deleteSignrecordById(id);
    }

    @Override
    public List<SigninView> selectSigninList(Signrecord signrecord) {
        //获取课程id
        Long courseId = signrecord.getCourseId();
        //返回签到列表
        return signrecordMapper.selectSigninList(courseId);
    }

    @Override
    public String selectTeacherName(Long courseId) {
        return signrecordMapper.selectTeacherName(courseId);
    }

    @Override
    public String selectCourseName(Long courseId) {
        return signrecordMapper.selectCourseName(courseId);
    }

    @Override
    public int selectTotalUserNum(Long courseId) {
        return signrecordMapper.selectTotalUserNum(courseId);
    }

    @Override
    public int selectSignedUserNum(Long courseId) {
        return signrecordMapper.selectSignedUserNum(courseId);
    }

    @Override
    public int selectSignStatus(Long id, Long userId) {
        return signrecordMapper.selectSignStatus(id,userId);
    }

    @Override
    public void sign(Long signid, Long userId) {
        signrecordMapper.sign(signid,userId);
    }

    @Override
    public Date selectEndTime(Long signid) {
        return signrecordMapper.selectEndTime(signid);
    }

    /**
     * 新增签到信息
     *
     * @param signrecord 签到记录信息对象
     */
    public void insertSignin(Signrecord signrecord)
    {
        List<Signin> signinList = signrecord.getSigninList();
        Long id = signrecord.getId();
        if (StringUtils.isNotNull(signinList))
        {
            List<Signin> list = new ArrayList<Signin>();
            for (Signin signin : signinList)
            {
                signin.setSignId(id);
                list.add(signin);
            }
            if (list.size() > 0)
            {
                signrecordMapper.batchSignin(list);
            }
        }
    }
}
