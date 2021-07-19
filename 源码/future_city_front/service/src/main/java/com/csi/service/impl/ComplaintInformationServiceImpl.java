package com.csi.service.impl;

import com.csi.mapper.ComplaintInformationMapper;
import com.csi.pojo.ComplaintInformation;
import com.csi.service.ComplaintInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComplaintInformationServiceImpl implements ComplaintInformationService {
    @Autowired
    private ComplaintInformationMapper complaintInformationMapper;
    @Override
    public boolean addComplaintInformation(ComplaintInformation complaintInformation) {
        return complaintInformationMapper.ins(complaintInformation) > 0;
    }

    @Override
    public ComplaintInformation findById(int id) {
        return complaintInformationMapper.selById(id);
    }

    @Override
    public List<ComplaintInformation> findAll() {
        return complaintInformationMapper.selAll();
    }
}
