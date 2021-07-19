package com.csi.service.impl;

import com.csi.mapper.LifeCostMapper;
import com.csi.pojo.LifeCost;
import com.csi.service.LifeCostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LifeCostServiceImpl implements LifeCostService {
    @Autowired
    private LifeCostMapper lifeCostMapper;
    @Override
    public boolean addLifeCost(LifeCost lifeCost) {
        return lifeCostMapper.ins(lifeCost) > 0;
    }

    @Override
    public LifeCost findByRid(String rid) {
        return lifeCostMapper.selByRid(rid);
    }

    @Override
    public List<LifeCost> findAll() {
        return lifeCostMapper.selAll();
    }

    @Override
    public List<LifeCost> findByCategory(int hid, int category) {
        return lifeCostMapper.selByCategory(hid, category);
    }
}
