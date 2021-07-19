package com.csi.service;

import com.csi.pojo.LifeCost;

import java.util.List;

public interface LifeCostService {
    boolean addLifeCost(LifeCost lifeCost);
    LifeCost findByRid(String rid);
    List<LifeCost> findAll();
    List<LifeCost> findByCategory(int hid, int category);
}
