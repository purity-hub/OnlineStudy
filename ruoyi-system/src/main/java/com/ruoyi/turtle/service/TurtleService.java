package com.ruoyi.turtle.service;

import com.ruoyi.turtle.domain.School;
import com.ruoyi.turtle.domain.Turtle;

import java.util.List;

public interface TurtleService {

    public int insertTurtle(Turtle turtle);

    List<Turtle> selectTurtleList(Turtle turtle);

    void updatelookNum(long id,long lookNum);

    void updatelikeNum(long id, long likeNum);

    List<School> getAllSchool();

    List<Turtle> getTurtleBySchool(String schoolName);

    List<String> getTeacherBySchool(String schoolName);

    List<Turtle> selectMyTurtleList(long userId);

    void updatePublic(long id, long isPublic);
}
