package net.zretc.ssm.controller;

import net.zretc.pojo.LifeCost;
import net.zretc.pojo.Resource;
import net.zretc.service.AllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/all")
public class AllController {

    @Autowired
    private AllService allService;

    @RequestMapping("/init")
    public String init(int hid, Model model){
        Resource resource = allService.selectByHid(hid);
        model.addAttribute("resource",resource);
        return "resource";
    }

    @RequestMapping("/save")
    @ResponseBody
    public String save( LifeCost lifeCost){
        System.out.println(lifeCost);
        int category = lifeCost.getCategory();
        String priceName="";
        if (category==0){
            priceName="水费";
        }else if (category==1){
            priceName="电费";
        }else if (category==2){
            priceName="燃气费";
        }
        String priceType="";
        if (category==0){
            priceType="water";
        }else if (category==1){
            priceType="electric";
        }else if (category==2){
            priceType="gas";
        }
        Double before = allService.selectBefore(lifeCost.getCategory());
        Double unitPrice = allService.selectUnitPrice(priceName);
        Double difference = lifeCost.getConsumption()-before;
        lifeCost.setDifference(difference);
        lifeCost.setPrice(unitPrice*difference);
        int i = allService.add(lifeCost);

        int i1 = allService.addResource(lifeCost.getHid(), priceType, lifeCost.getConsumption());
        int i2 = allService.updateBalance(lifeCost.getHid(), priceType, difference);
        System.out.println(i+i1+i2);

        return "true";
    }

}
