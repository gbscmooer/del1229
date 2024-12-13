package com.kokomi.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kokomi.springboot.entity.Course;
import com.baomidou.mybatisplus.extension.service.IService;

public interface ICourseService extends IService<Course> {

    Page<Course> findPage(Page<Course> page, String name);

    void setStudentCourse(Integer courseId, Integer studentId);
}
