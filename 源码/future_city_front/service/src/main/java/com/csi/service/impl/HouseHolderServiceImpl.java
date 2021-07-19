package com.csi.service.impl;

import com.csi.mapper.HouseHolderMapper;
import com.csi.pojo.HouseHolder;
import com.csi.service.HouseHolderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseHolderServiceImpl implements HouseHolderService {
    @Autowired
    private HouseHolderMapper houseHolderMapper;

    @Override
    public boolean addHouseholder(HouseHolder houseHolder) {
        return houseHolderMapper.ins(houseHolder) > 0;
    }

    @Override
    public HouseHolder findByIdentification(String identification) {
        return houseHolderMapper.selByIdentification(identification);
    }

    @Override
    public HouseHolder findByEmail(String email) {
        return houseHolderMapper.selByEmail(email);
    }

    @Override
    public boolean amend(HouseHolder houseHolder) {
        return houseHolderMapper.updById(houseHolder) > 0 ? true : false;
    }
}
