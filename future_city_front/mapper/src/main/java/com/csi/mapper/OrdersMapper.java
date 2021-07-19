package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Orders;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersMapper {
    @Insert("insert into orders values(#{id},#{householder.id},#{payDate},#{payment},#{money},#{type})")
    int ins(Orders orders);

    @Select("select * from orders where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "payDate",column = "payDate"),
            @Result(property = "payment",column = "payment"),
            @Result(property = "money",column = "money"),
            @Result(property = "type",column = "type")
    })
    Orders selById(int id);

    @Select("select * from orders")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "payDate",column = "payDate"),
            @Result(property = "payment",column = "payment"),
            @Result(property = "money",column = "money"),
            @Result(property = "type",column = "type")
    })
    List<Orders> selAll();
}
