package com.csi.service.impl;

import com.csi.mapper.UnitPriceMapper;
import com.csi.pojo.UnitPrice;
import com.csi.service.UnitPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UnitPriceServiceImpl implements UnitPriceService {
    @Autowired
    private UnitPriceMapper unitPriceMapper;

    @Override
    public UnitPrice findByName(String name) {
        return unitPriceMapper.selByName(name);
    }

    @Override
    public List<UnitPrice> findAll() {
        return unitPriceMapper.selAll();
    }
}
