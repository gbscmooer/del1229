package com.kokomi.springboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class CorsConfig {

    // 当前跨域请求最大有效时长。这里默认1天
    private static final long MAX_AGE = 24 * 60 * 60;

    @Bean
    public CorsFilter corsFilter() {
        // 创建 CorsConfiguration 对象
        CorsConfiguration corsConfiguration = new CorsConfiguration();

        // 设置允许的来源，可以选择使用 setAllowedOriginPatterns 或 addAllowedOrigin
        corsConfiguration.addAllowedOrigin("*");  // 允许所有的来源访问，也可以使用 setAllowedOriginPatterns 配置

        // 设置允许的请求方法
        corsConfiguration.addAllowedMethod("*");  // 允许所有方法：GET, POST, PUT 等

        // 设置允许的请求头
        corsConfiguration.addAllowedHeader("*");  // 允许所有请求头

        // 设置最大缓存时间
        corsConfiguration.setMaxAge(MAX_AGE);

        // 创建配置源并注册到源
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

        // 注册跨域配置
        source.registerCorsConfiguration("/**", corsConfiguration); // 对所有路径启用 CORS 配置
        source.registerCorsConfiguration("/file/**", corsConfiguration); // 对 /file/** 路径启用 CORS 配置

        // 返回 CorsFilter 对象
        return new CorsFilter(source);
    }
}