package com.fw.vote.service;

import com.fw.vote.model.Course;
import com.fw.vote.model.Player;

import java.util.List;

public interface CourseService {
    public void insert(Course course);
    public void update(Course course);
    public void delete(String courseId);
    public List<Course> select(Course course);
    public Course selectById(String courseId);
    public int getCount(Course course);

}
