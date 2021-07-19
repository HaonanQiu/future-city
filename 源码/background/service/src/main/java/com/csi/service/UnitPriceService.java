package com.csi.service;

import com.csi.pojo.UnitPrice;

import java.util.List;

public interface UnitPriceService {

    List<UnitPrice> list() throws Exception;

    int addUnitPrice(UnitPrice unitPrice) throws Exception;

    int updateUnitPrice(UnitPrice unitPrice)throws Exception;

    int  deleteUnitPrice(String name)throws Exception;

    UnitPrice findByName(String name) throws Exception;

}
