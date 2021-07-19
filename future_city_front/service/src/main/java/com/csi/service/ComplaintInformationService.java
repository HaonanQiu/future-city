package com.csi.service;

import com.csi.pojo.ComplaintInformation;

import java.util.List;

public interface ComplaintInformationService {
    boolean addComplaintInformation(ComplaintInformation complaintInformation);
    ComplaintInformation findById(int id);
    List<ComplaintInformation> findAll();
}
