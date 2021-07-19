package com.csi.service.impl;

import com.csi.mapper.RepairInformationMapper;
import com.csi.pojo.RepairInformation;
import com.csi.service.RepairInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepairInformationServiceImpl implements RepairInformationService {
    @Autowired
    private RepairInformationMapper repairInformationMapper;
    @Override
    public boolean addRepairInformation(RepairInformation repairInformation) {
        return repairInformationMapper.ins(repairInformation) > 0;
    }

    @Override
    public RepairInformation findById(int id) {
        return repairInformationMapper.selById(id);
    }

    @Override
    public List<RepairInformation> findAll() {
        return repairInformationMapper.selAll();
    }

    @Override
    public List<RepairInformation> findByState(int hid, int state) {
        return repairInformationMapper.selByState(hid, state);
    }

    @Override
    public boolean amend(RepairInformation repairInformation) {
        return repairInformationMapper.upd(repairInformation) > 0 ? true : false;
    }
}
