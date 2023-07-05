package com.ruoyi.turtle.mapper;

import com.ruoyi.turtle.domain.School;
import com.ruoyi.turtle.domain.Turtle;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

import java.util.List;

@Mapper
public interface TurtleMapper {

    int insertTurtle(Turtle turtle);

    List<Turtle> selectTurtleList(Turtle turtle);

    void updatelookNum(@Param("id") long id, @Param("lookNum") long lookNum);

    void updatelikeNum(@Param("id") long id, @Param("likeNum") long likeNum);


    List<School> getAllSchool();

    List<Turtle> getTurtleBySchool(String schoolName);

    List<String> getTeacherBySchool(String schoolName);

    List<Turtle> selectMyTurtleList(@Param("userId") long userId);

    void updatePublic(@Param("id") long id, @Param("isPublic") long isPublic);
}
