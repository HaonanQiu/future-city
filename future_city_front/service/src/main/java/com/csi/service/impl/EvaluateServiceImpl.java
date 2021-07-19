package com.csi.service.impl;

import com.csi.mapper.EvaluateMapper;
import com.csi.pojo.Evaluate;
import com.csi.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    private EvaluateMapper evaluateMapper;
    @Override
    public boolean addEvaluate(Evaluate evaluate) {
        return evaluateMapper.ins(evaluate) > 0;
    }

    @Override
    public boolean delEvaluate(int rid) {
        return evaluateMapper.delByRid(rid) > 0;
    }

    @Override
    public boolean updEvaluate(Evaluate evaluate) {
        return evaluateMapper.updByRid(evaluate) > 0;
    }

    @Override
    public Evaluate findByRid(int rid) {
        return evaluateMapper.selByRid(rid);
    }

    @Override
    public List<Evaluate> findAll() {
        return evaluateMapper.selAll();
    }
}
