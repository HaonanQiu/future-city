package com.csi.service;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Information;

import java.util.List;
import java.util.Map;

public interface InformationService {

    //添加通知
    int addInformation(Information information);

    //删除通知
    int deleteInformation(String [] ids);

    //修改通知
    int update(Information information);

    //根据id查询
    Information selectById(int id);

    //分页查询
    List<Information> page(Map<String ,String> args, int begin, int pageSize) throws Exception;

    //数量查询
    int count (Map<String ,String> args);

}
