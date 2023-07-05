package com.ruoyi.turtle.controller;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.turtle.domain.Turtle;
import com.ruoyi.turtle.service.TurtleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/turtle")
public class TurtleController extends BaseController {

    @Autowired
    private TurtleService turtleService;

    @Autowired
    private RedisCache redisCache;

    @RequestMapping("/insert")
    public AjaxResult insertTurtle(@RequestBody Turtle turtle){
        //获取当前用户id
        turtle.setUserId(getUserId());
        turtle.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        int i = turtleService.insertTurtle(turtle);
        return AjaxResult.success();
    }

    @GetMapping("/list")
    public TableDataInfo list(Turtle turtle){
        startPage();
        List<Turtle> list = turtleService.selectTurtleList(turtle);
        return getDataTable(list);
    }

    @PostMapping("/uploadImg")
    public AjaxResult uploadImg(@RequestParam("file") MultipartFile file) throws IOException {
        if(file.isEmpty()){
            return AjaxResult.error("文件为空");
        }
        String imgUrl = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
        return AjaxResult.success(imgUrl);
    }

    @PostMapping("/updatelookNum")
    public AjaxResult updatelookNum(@RequestBody Turtle turtle){
        turtleService.updatelookNum(turtle.getId(),turtle.getLookNum());
        return AjaxResult.success();
    }

    @PostMapping("/updatelikeNum")
    public AjaxResult updatelikeNum(@RequestBody Turtle turtle){
        //获取当前用户id
        Long userId = getUserId();
        //判断是否已经点赞
        String key = "like_" + userId + "_" + turtle.getId();
        //查询当前点赞数
        if(redisCache.hasKey(key)){
            //取消点赞
            if(turtle.getLikeNum() < (long)redisCache.getCacheObject(key)){
                //点赞数-1
                turtleService.updatelikeNum(turtle.getId(),turtle.getLikeNum());
                //删除redis缓存
                redisCache.deleteObject(key);
                return AjaxResult.success();
            }
            return AjaxResult.error("今天已经点赞过了");
        }
        //redis缓存点赞信息,设置过期时间为1天
        redisCache.setCacheObject(key,turtle.getLikeNum(),60*60*24, TimeUnit.SECONDS);
        //点赞数+1
        turtleService.updatelikeNum(turtle.getId(),turtle.getLikeNum());
        return AjaxResult.success();
    }

    @GetMapping("/listMostLike")
    public TableDataInfo listMostLike(Turtle turtle){
        startPage();
        List<Turtle> list = turtleService.selectTurtleList(turtle);
        //按照点赞数排序
        list.sort((o1, o2) -> {
            if(o1.getLikeNum() > o2.getLikeNum()){
                return -1;
            }else if(o1.getLikeNum() < o2.getLikeNum()){
                return 1;
            }else{
                //点赞数相等，按照浏览数排序
                if(o1.getLookNum() > o2.getLookNum()){
                    return -1;
                }else if(o1.getLookNum() < o2.getLookNum()){
                    return 1;
                }else{
                    //浏览数相等，按照时间排序
                    return Long.compare(o2.getCreateTime().getTime(), o1.getCreateTime().getTime());
                }
            }
        });
        return getDataTable(list);
    }

    @GetMapping("/getAllSchool")
    public AjaxResult getAllSchool(){
        return AjaxResult.success(turtleService.getAllSchool());
    }

    @GetMapping("/getTurtleBySchool/{schoolName}")
    public TableDataInfo getTurtleBySchool(@PathVariable("schoolName") String schoolName){
        System.out.println(schoolName);
        startPage();
        List<Turtle> list = turtleService.getTurtleBySchool(schoolName);
        return getDataTable(list);
    }

    @GetMapping("/getTeacherBySchool/{schoolName}")
    public AjaxResult getTeacherBySchool(@PathVariable("schoolName") String schoolName){
        return AjaxResult.success(turtleService.getTeacherBySchool(schoolName));
    }

    @GetMapping("/getMyTurtle")
    public TableDataInfo getMyTurtle(){
        startPage();
        long userId = getUserId();
        List<Turtle> list = turtleService.selectMyTurtleList(userId);
        return getDataTable(list);
    }

    @PostMapping("/updatePublic")
    public AjaxResult updatePublic(@RequestBody Turtle turtle){
        turtleService.updatePublic(turtle.getId(),turtle.getIsPublic());
        return AjaxResult.success();
    }
}
