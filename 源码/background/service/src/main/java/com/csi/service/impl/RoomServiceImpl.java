package com.csi.service.impl;

import com.csi.mapper.RoomMapper;
import com.csi.pojo.Room;
import com.csi.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("RoomService")
@Transactional

public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;


    @Override
    public int update(Room room) {
        return roomMapper.update(room);
    }

    @Override
    public int updateState(String id, int state) {
        return roomMapper.state(id,state);
    }

    @Override
    public Room selectById(String id) {
        return roomMapper.selectById(id);
    }

    @Override
    public List<Room> page(Map<String, String> args, int begin, int pageSize) throws Exception {
        return roomMapper.page(args,begin,pageSize);
    }

    @Override
    public int count(Map<String, String> args) {
        return roomMapper.count(args);
    }

    @Override
    public int add(Room room) {
        return roomMapper.add(room);
    }
}
