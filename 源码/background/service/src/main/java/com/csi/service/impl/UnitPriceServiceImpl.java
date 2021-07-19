package com.csi.service.impl;


import com.csi.mapper.UnitPriceMapper;
import com.csi.pojo.UnitPrice;
import com.csi.service.UnitPriceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("UnitPriceService")
@Transactional
public class UnitPriceServiceImpl implements UnitPriceService{

    @Autowired
    private UnitPriceMapper unitPriceMapper;

    @Override
    public List<UnitPrice> list() throws Exception {
        return unitPriceMapper.findAll();
    }

    @Override
    public int addUnitPrice(UnitPrice unitPrice) throws Exception {
        return unitPriceMapper.addUnitPrice(unitPrice);
    }

    @Override
    public int updateUnitPrice(UnitPrice unitPrice) throws Exception {
        return unitPriceMapper.updateUnitPrice(unitPrice);
    }

    @Override
    public int deleteUnitPrice(String name) throws Exception {
        return unitPriceMapper.deleteUnitPrice(name);
    }

    @Override
    public UnitPrice findByName(String name) throws Exception {
        return unitPriceMapper.findByName(name);

    }
}
