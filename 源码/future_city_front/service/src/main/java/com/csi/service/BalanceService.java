package com.csi.service;

import com.csi.pojo.Balance;

import java.util.List;

public interface BalanceService {
    boolean addBalance(Balance balance);
    boolean updBalance(Balance balance);
    Balance findByRid(String rid);
    List<Balance> findAll();
    boolean recharge(int hid, double total_amount,int type);
    Balance findByHid(int hid);
}
