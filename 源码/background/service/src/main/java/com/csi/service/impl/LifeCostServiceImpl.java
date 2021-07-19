package com.csi.service.impl;

import com.csi.mapper.LifeCostMapper;
import com.csi.pojo.LifeCost;
import com.csi.service.LifeCostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class LifeCostServiceImpl implements LifeCostService {

    @Autowired
    private LifeCostMapper lifeCostMapper;

    @Override
    public List<LifeCost> page(Map<String, String> args, int begin, int pageSize) throws Exception {
        return lifeCostMapper.page(args,begin,pageSize);
    }

    @Override
    public int count(Map<String, String> args) {
        return lifeCostMapper.count(args);
    }

}
