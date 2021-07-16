package com.csi.service.impl;

import com.csi.mapper.RepairInformationMapper;
import com.csi.pojo.RepairInformation;
import com.csi.service.RepairInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("RepairInformationService")
@Transactional
public class RepairInformationServiceImpl implements RepairInformationService {

    @Autowired
    private RepairInformationMapper mapper;

    @Override
    public RepairInformation selectById(int id) {
        return mapper.selectById(id);
    }

    @Override
    public List<RepairInformation> page(Map<String, String> args, int begin, int pageSize) throws Exception {
        return mapper.page(args,begin,pageSize);
    }

    @Override
    public int count(Map<String, String> args) {
        return mapper.count(args);
    }

    @Override
    public int updateState(int id, int state) {
        return mapper.state(id,state);
    }
}
