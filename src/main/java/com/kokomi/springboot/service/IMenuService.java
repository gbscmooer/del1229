package com.kokomi.springboot.service;

import com.kokomi.springboot.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
