package com.csi.service;

import com.csi.pojo.Room;

import java.util.List;

public interface RoomService {
    Room findById(String id);
    List<Room> findAll(int hid);
}
