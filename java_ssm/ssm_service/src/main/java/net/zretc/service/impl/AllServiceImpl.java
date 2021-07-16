package net.zretc.service.impl;

import net.zretc.mapper.BalanceMapper;
import net.zretc.mapper.LifeCostMapper;
import net.zretc.mapper.ResourceMapper;
import net.zretc.mapper.UnitPriceMapper;
import net.zretc.pojo.LifeCost;
import net.zretc.pojo.Resource;
import net.zretc.service.AllService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("AllService")
@Transactional
public class AllServiceImpl implements AllService {

    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private LifeCostMapper lifeCostMapper;
    @Autowired
    private UnitPriceMapper unitPriceMapper;
    @Autowired
    private BalanceMapper balanceMapper;

    @Override
    public Resource selectByHid(int hid) {
        return resourceMapper.select(hid);
    }

    @Override
    public Double selectBefore(int category) {
        return lifeCostMapper.before(category);
    }

    @Override
    public Double selectUnitPrice(String priceName) {
        return unitPriceMapper.selectByName(priceName);
    }

    @Override
    public int add(LifeCost lifeCost) {
        return lifeCostMapper.add(lifeCost);
    }

    @Override
    public int addResource(int hid, String priceName, Double difference) {
        return resourceMapper.update(hid,priceName,difference);
    }

    @Override
    public int updateBalance(int hid, String priceName, Double num) {
        return balanceMapper.change(hid,num,priceName);
    }

}
