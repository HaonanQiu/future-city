package com.csi.service;

import com.csi.pojo.RepairInformation;

import java.util.List;

public interface RepairInformationService {
    boolean addRepairInformation(RepairInformation repairInformation);
    RepairInformation findById(int id);
    List<RepairInformation> findAll();

    List<RepairInformation> findByState(int hid, int state);

    boolean amend(RepairInformation repairInformation);
}
