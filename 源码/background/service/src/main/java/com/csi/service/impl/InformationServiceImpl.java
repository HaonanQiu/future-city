package com.csi.service.impl;

import com.csi.mapper.InformationMapper;
import com.csi.pojo.Information;
import com.csi.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("InformationService")
@Transactional
public class InformationServiceImpl implements InformationService {

    @Autowired
    private InformationMapper informationMapper;


    @Override
    public int addInformation(Information information) {
        return informationMapper.add(information);
    }

    @Override
    public int deleteInformation(String[] ids) {
        int i = 0;
        for (String id : ids) {
            i = informationMapper.delete(id);
        }
        return i;
    }

    @Override
    public int update(Information information) {
        return informationMapper.update(information);
    }

    @Override
    public Information selectById(int id) {
        return informationMapper.selectById(id);
    }

    @Override
    public List<Information> page(Map<String, String> args, int begin, int pageSize) throws Exception {
        return informationMapper.page(args, begin, pageSize);
    }

    @Override
    public int count(Map<String, String> args) {
        return informationMapper.count(args);
    }
}
