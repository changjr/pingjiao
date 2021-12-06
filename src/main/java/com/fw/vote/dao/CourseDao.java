package com.fw.vote.dao;

import com.fw.vote.model.Course;

import java.util.List;

public interface CourseDao {
    public void insert(Course course);
    public void update(Course course);
    public void delete(String courseId);
    public List<Course> select(Course course);
    public Course selectById(String courseId);
    public List<Course> count(Course course);
    public int getCount(Course course);
}
