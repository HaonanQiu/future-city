package com.csi.service.impl;

import com.csi.mapper.OrdersMapper;
import com.csi.pojo.Orders;
import com.csi.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;
    @Override
    public boolean addOrders(Orders orders) {
        return ordersMapper.ins(orders) > 0;
    }

    @Override
    public Orders findById(int id) {
        return ordersMapper.selById(id);
    }

    @Override
    public List<Orders> findAll() {
        return ordersMapper.selAll();
    }
}
