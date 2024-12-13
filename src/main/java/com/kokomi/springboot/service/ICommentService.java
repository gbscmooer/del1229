package com.kokomi.springboot.service;

import com.kokomi.springboot.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ICommentService extends IService<Comment> {

    List<Comment> findCommentDetail(Integer articleId);
}
