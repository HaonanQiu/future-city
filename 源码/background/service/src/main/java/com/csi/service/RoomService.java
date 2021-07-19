package com.csi.service;

import com.csi.pojo.Room;

import java.util.List;
import java.util.Map;

public interface RoomService {

    //修改信息
    int update(Room room);

    //修改状态
    int updateState(String id,int state);

    //根据id查询
    Room selectById(String id);

    //分页查询
    List<Room> page(Map<String ,String> args, int begin, int pageSize) throws Exception;

    //数量查询
    int count (Map<String ,String> args);

    int add(Room room);
}
