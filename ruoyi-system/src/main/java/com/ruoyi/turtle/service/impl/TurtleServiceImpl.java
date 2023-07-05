package com.ruoyi.turtle.service.impl;

import com.ruoyi.turtle.domain.School;
import com.ruoyi.turtle.domain.Turtle;
import com.ruoyi.turtle.mapper.TurtleMapper;
import com.ruoyi.turtle.service.TurtleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TurtleServiceImpl implements TurtleService {

    @Autowired
    private TurtleMapper turtleMapper;
    @Override
    public int insertTurtle(Turtle turtle) {
        return turtleMapper.insertTurtle(turtle);
    }

    @Override
    public List<Turtle> selectTurtleList(Turtle turtle) {
        return turtleMapper.selectTurtleList(turtle);
    }

    @Override
    public void updatelookNum(long id,long lookNum) {
        turtleMapper.updatelookNum(id,lookNum);
    }

    @Override
    public void updatelikeNum(long id, long likeNum) {
        turtleMapper.updatelikeNum(id,likeNum);
    }

    @Override
    public List<School> getAllSchool() {
        return turtleMapper.getAllSchool();
    }

    @Override
    public List<Turtle> getTurtleBySchool(String schoolName) {
        return turtleMapper.getTurtleBySchool(schoolName);
    }

    @Override
    public List<String> getTeacherBySchool(String schoolName) {
        return turtleMapper.getTeacherBySchool(schoolName);
    }

    @Override
    public List<Turtle> selectMyTurtleList(long userId) {
        return turtleMapper.selectMyTurtleList(userId);
    }

    @Override
    public void updatePublic(long id, long isPublic) {
        turtleMapper.updatePublic(id,isPublic);
    }
}
