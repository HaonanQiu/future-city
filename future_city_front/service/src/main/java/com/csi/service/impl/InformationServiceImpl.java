package com.csi.service.impl;

import com.csi.mapper.InformationMapper;
import com.csi.pojo.Information;
import com.csi.service.InformationService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    private InformationMapper informationMapper;

    @Override
    public List<Information> findAll() {
        return informationMapper.selAll();
    }

    @Override
    public List<Information> findByPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return informationMapper.selAll();
    }

    @Override
    public Information findById(int id) {
        return informationMapper.selById(id);
    }

    @Override
    public boolean amend(Information information) {
        return informationMapper.upd(information) > 0;
    }

}
