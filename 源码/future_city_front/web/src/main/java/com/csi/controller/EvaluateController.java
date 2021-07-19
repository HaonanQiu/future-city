package com.csi.controller;

import com.csi.pojo.Evaluate;
import com.csi.pojo.RepairInformation;
import com.csi.service.EvaluateService;
import com.csi.service.RepairInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/evaluate")
public class EvaluateController {
    @Autowired
    private EvaluateService evaluateService;
    @Autowired
    private RepairInformationService repairInformationService;

    @RequestMapping("/submit")
    public String submit(int rid, double star, String content){
        RepairInformation repairInformation = new RepairInformation();
        repairInformation.setId(rid);
        Evaluate evaluate = new Evaluate(repairInformation, star, content);
        evaluateService.addEvaluate(evaluate);
        RepairInformation information = repairInformationService.findById(rid);
        information.setState(3);
        repairInformationService.amend(information);
        return "/repair";
    }
}
