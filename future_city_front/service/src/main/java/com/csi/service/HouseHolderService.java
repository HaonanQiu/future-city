package com.csi.service;

import com.csi.pojo.HouseHolder;

public interface HouseHolderService {
    boolean addHouseholder(HouseHolder houseHolder);

    HouseHolder findByIdentification(String identification);

    HouseHolder findByEmail(String email);

    boolean amend(HouseHolder houseHolder);
}
