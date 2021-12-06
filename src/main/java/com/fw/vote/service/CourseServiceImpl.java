package com.fw.vote.service;

import com.fw.vote.dao.CourseDao;
import com.fw.vote.dao.CourseDao;
import com.fw.vote.model.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("courseSerivce")
public class CourseServiceImpl implements CourseService{

    @Autowired
    CourseDao courseDao;
    @Override
    public void insert(Course Course) {
        courseDao.insert(Course);
    }

    @Override
    public void update(Course Course) {

        courseDao.update(Course);
    }

    @Override
    public void delete(String courseId) {

        courseDao.delete(courseId);
    }

    @Override
    public List<Course> select(Course Course) {

        return courseDao.select(Course);
    }

    @Override
    public Course selectById(String courseId) {

        return courseDao.selectById(courseId);
    }

    @Override
    public int getCount(Course Course) {
        return courseDao.getCount(Course);
    }


}
