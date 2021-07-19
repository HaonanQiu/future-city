package com.csi.service;

import com.csi.pojo.Information;
import com.csi.pojo.RepairInformation;

import java.util.List;
import java.util.Map;

public interface RepairInformationService {

    //根据id查询
    RepairInformation selectById(int id);

    //分页查询
    List<RepairInformation> page(Map<String ,String> args, int begin, int pageSize) throws Exception;

    //数量查询
    int count (Map<String ,String> args);


    int updateState(int id,int state);

}
