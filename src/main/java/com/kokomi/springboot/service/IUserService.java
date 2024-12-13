package com.kokomi.springboot.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kokomi.springboot.controller.dto.UserDTO;
import com.kokomi.springboot.controller.dto.UserPasswordDTO;
import com.kokomi.springboot.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
//服务
public interface IUserService extends IService<User> {

    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);

    void updatePassword(UserPasswordDTO userPasswordDTO);

    Page<User> findPage(Page<User> objectPage, String username, String email, String address);
}
