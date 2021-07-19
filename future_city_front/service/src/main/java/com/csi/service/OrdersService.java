package com.csi.service;

import com.csi.pojo.Orders;


import java.util.List;

public interface OrdersService {
    boolean addOrders(Orders orders);
    Orders findById(int id);
    List<Orders> findAll();
}
