package com.csi.service.impl;

import com.csi.mapper.BalanceMapper;
import com.csi.pojo.Balance;
import com.csi.pojo.Room;
import com.csi.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BalanceServiceImpl implements BalanceService {
    @Autowired
    private BalanceMapper balanceMapper;

    @Override
    public boolean addBalance(Balance balance) {
        return balanceMapper.ins(balance) > 0;
    }

    @Override
    public boolean updBalance(Balance balance) {
        return balanceMapper.updByRid(balance) > 0;
    }

    @Override
    public Balance findByRid(String rid) {
        return balanceMapper.selByRid(rid);
    }

    @Override
    public List<Balance> findAll() {
        return balanceMapper.selAll();
    }

    @Override
    public boolean recharge(int hid, double total_amount, int type) {
        Balance balance = balanceMapper.selByHid(hid);
        switch (type){
            case 0:
                balance.setWater(balance.getWater() + total_amount);
                break;
            case 1:
                balance.setElectric(balance.getElectric() + total_amount);
                break;
            case 2:
                balance.setGas(balance.getGas() + total_amount);
                break;
            case 3:
                balance.setProperty(balance.getProperty() + total_amount);
                break;
        }
        int row = balanceMapper.updByHid(balance);
        return row > 0 ? true : false;
    }

    @Override
    public Balance findByHid(int hid) {
        return balanceMapper.selByHid(hid);
    }
}
