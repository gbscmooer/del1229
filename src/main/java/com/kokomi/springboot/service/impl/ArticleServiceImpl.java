package com.kokomi.springboot.service.impl;

import com.kokomi.springboot.entity.Article;
import com.kokomi.springboot.mapper.ArticleMapper;
import com.kokomi.springboot.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {

}
