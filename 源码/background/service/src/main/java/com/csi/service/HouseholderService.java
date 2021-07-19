package com.csi.service;

import com.csi.pojo.HouseHolder;

import java.util.List;
import java.util.Map;

public interface HouseholderService {

    //添加住户
    int addHouseholder(HouseHolder houseHolder);

    //删除住户
    int deleteHouseholder(String [] ids);

    //修改信息
    int updateAll(HouseHolder houseHolder);

    //修改状态
    int updateState(int id,int state);

    //根据id查询
    HouseHolder selectById(int id);

    //分页查询
    List<HouseHolder> page(Map<String ,String> args,int begin,int pageSize) throws Exception;

    //数量查询
    int count (Map<String ,String> args);

    List<HouseHolder> all();

}
