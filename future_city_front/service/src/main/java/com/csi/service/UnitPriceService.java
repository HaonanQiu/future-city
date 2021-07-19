package com.csi.service;

import com.csi.pojo.UnitPrice;

import java.util.List;

public interface UnitPriceService {
    UnitPrice findByName(String name);
    List<UnitPrice> findAll();
}
