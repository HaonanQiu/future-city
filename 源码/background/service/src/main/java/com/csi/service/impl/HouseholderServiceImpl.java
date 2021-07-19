package com.csi.service.impl;


import com.csi.mapper.HouseholderMapper;
import com.csi.pojo.HouseHolder;
import com.csi.service.HouseholderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("HouseholderService")
@Transactional
public class HouseholderServiceImpl implements HouseholderService {

    @Autowired
    private HouseholderMapper householderMapper;



    @Override
    public int addHouseholder(HouseHolder houseHolder) {
        return householderMapper.addHouseholder(houseHolder);
    }

    @Override
    public int deleteHouseholder(String[] ids) {
        int i = 0;
        for (String id : ids) {
            i = householderMapper.delHouseholder(id);
        }
        return i;
    }


    @Override
    public int updateState(int id, int state) {
        return householderMapper.updateState(id,state);
    }

    @Override
    public HouseHolder selectById(int id) {
        return householderMapper.selectById(id);
    }


    @Override
    public int updateAll(HouseHolder houseHolder) {
        return householderMapper.updateAll(houseHolder);
    }


    @Override
    public List<HouseHolder> page(Map<String, String> args, int begin, int pageSize) throws Exception {
        return householderMapper.page(args, begin, pageSize);
    }

    @Override
    public int count(Map<String, String> args) {
        return householderMapper.count(args);
    }

    @Override
    public List<HouseHolder> all() {
        return householderMapper.selectAll();
    }


}
