package com.csi.service;

import com.csi.pojo.Parking;

import java.util.List;

public interface ParkingService {
    Parking findById(String id);
    List<Parking> findAll();
}
