package com.csi.service.impl;

import com.csi.mapper.ParkingMapper;
import com.csi.pojo.Parking;
import com.csi.service.ParkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParkingServiceImpl implements ParkingService {
    @Autowired
    private ParkingMapper parkingMapper;
    @Override
    public Parking findById(String id) {
        return parkingMapper.selById(id);
    }

    @Override
    public List<Parking> findAll() {
        return parkingMapper.selAll();
    }
}
