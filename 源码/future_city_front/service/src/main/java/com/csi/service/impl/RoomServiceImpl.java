package com.csi.service.impl;

import com.csi.mapper.RoomMapper;
import com.csi.pojo.Room;
import com.csi.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    private RoomMapper roomMapper;

    @Override
    public Room findById(String id) {
        return roomMapper.selById(id);
    }

    @Override
    public List<Room> findAll(int hid) {
        return roomMapper.selAll(hid);
    }
}
