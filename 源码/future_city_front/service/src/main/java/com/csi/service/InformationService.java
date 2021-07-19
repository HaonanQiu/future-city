package com.csi.service;

import com.csi.pojo.Information;

import java.util.List;

public interface InformationService {
    List<Information> findAll();

    List<Information> findByPage(int pageNum, int pageSize);

    Information findById(int id);

    boolean amend(Information information);
}
