package com.csi.mapper;

import com.csi.pojo.Balance;
import com.csi.pojo.HouseHolder;
import com.csi.pojo.Room;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BalanceMapper {
    @Insert("insert into balance values(#{householder.id},#{room.id},#{water},#{electric},#{gas},#{property})")
    int ins(Balance balance);

    @Update("update balance set water = #{water},electric = #{electric},gas = #{gas},property = #{property} where rid = #{room.id}")
    int updByRid(Balance balance);

    @Update("update balance set water = #{water},electric = #{electric},gas = #{gas},property = #{property} where hid = #{householder.id}")
    int updByHid(Balance balance);

    @Select("select * from balance where rid = #{rid}")
    @Results({
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "room",column = "rid",javaType = Room.class,
            one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "water",column = "water"),
            @Result(property = "electric",column = "electric"),
            @Result(property = "gas",column = "gas"),
            @Result(property = "property",column = "property")
    })
    Balance selByRid(String rid);

    @Select("select * from balance where hid = #{hid}")
    @Results({
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "room",column = "rid",javaType = Room.class,
                    one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "water",column = "water"),
            @Result(property = "electric",column = "electric"),
            @Result(property = "gas",column = "gas"),
            @Result(property = "property",column = "property")
    })
    Balance selByHid(int hid);

    @Select("select * from balance")
    @Results({
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "room",column = "rid",javaType = Room.class,
                    one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "water",column = "water"),
            @Result(property = "electric",column = "electric"),
            @Result(property = "gas",column = "gas"),
            @Result(property = "property",column = "property")
    })
    List<Balance> selAll();
}
