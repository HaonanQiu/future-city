package net.zretc.service;

import net.zretc.pojo.LifeCost;
import net.zretc.pojo.Resource;

public interface AllService {

    Resource selectByHid(int hid);


    Double selectBefore(int category);

    Double selectUnitPrice(String priceName);

    int add(LifeCost lifeCost);

    int addResource(int hid, String priceName, Double difference);

    int updateBalance(int hid, String priceName, Double num);



}
