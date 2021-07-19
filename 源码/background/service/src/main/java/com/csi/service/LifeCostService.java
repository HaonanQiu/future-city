package com.csi.service;

import com.csi.pojo.LifeCost;
import com.csi.pojo.RepairInformation;

import java.util.List;
import java.util.Map;

public interface LifeCostService {



    //分页查询
    List<LifeCost> page(Map<String ,String> args, int begin, int pageSize) throws Exception;

    //数量查询
    int count (Map<String ,String> args);


}
