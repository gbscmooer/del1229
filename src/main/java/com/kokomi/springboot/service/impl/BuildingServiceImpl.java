package com.kokomi.springboot.service.impl;

import com.kokomi.springboot.entity.Building;
import com.kokomi.springboot.mapper.BuildingMapper;
import com.kokomi.springboot.service.IBuildingService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 青哥哥
 * @since 2022-05-23
 */
@Service
public class BuildingServiceImpl extends ServiceImpl<BuildingMapper, Building> implements IBuildingService {

}
