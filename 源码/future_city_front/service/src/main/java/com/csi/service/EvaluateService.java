package com.csi.service;

import com.csi.pojo.Evaluate;

import java.util.List;

public interface EvaluateService {
    boolean addEvaluate(Evaluate evaluate);
    boolean delEvaluate(int rid);
    boolean updEvaluate(Evaluate evaluate);
    Evaluate findByRid(int rid);
    List<Evaluate> findAll();
}
