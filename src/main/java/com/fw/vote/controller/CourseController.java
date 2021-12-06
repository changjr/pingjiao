package com.fw.vote.controller;

import com.fw.vote.model.Course;
import com.fw.vote.model.Player;
import com.fw.vote.service.CourseService;
import com.fw.vote.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("course")
public class CourseController {

    @Autowired
    CourseService courseService;

    @RequestMapping("select")
    public ModelAndView select(Course course,ModelAndView mv){
      int index=(course.getCurr()-1)*course.getPageSize();
        course.setIndex(index);
        course.setCount(courseService.getCount(course));
        List<Course> courseList= courseService.select(course);
        mv.setViewName("course");
        mv.addObject("courseList",courseList);
        return mv;
    }

    @RequestMapping("save")
    public ModelAndView add(Course course, ModelAndView mv, HttpServletRequest req) throws IllegalStateException, IOException {

        if (course.getCid()!=null&&!course.getCid().equals("")){
            courseService.update(course);
        }else {
            courseService.insert(course);
        }
          /* return select(null,mv);*/
        return select(new Course(),mv);

    }


    @RequestMapping("selectById")
    public ModelAndView selectById(String courseId,ModelAndView mv){
        if(courseId!=null&&!courseId.equals("")){
            Course course=courseService.selectById(courseId);
            mv.addObject("course",course);
        }
        mv.setViewName("courseedit");
        return mv;
    }
    @ResponseBody
    @RequestMapping("delete")
    public Map<String,String>delete(String courseId){
        //用map传值
        Map<String,String> map=new HashMap<>();
        //抛出异常，删除时提示
        try {
            courseService.delete(courseId);
            map.put("msg","删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","删除失败！");
        }
        return map;
    }
}
