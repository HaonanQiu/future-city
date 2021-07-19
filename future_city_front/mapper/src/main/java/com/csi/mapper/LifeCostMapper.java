package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.LifeCost;
import com.csi.pojo.Room;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LifeCostMapper {
    @Insert("insert into life_cost values(#{room.id},#{householder.id},#{category},#{consumption},#{difference},#{inputDate},#{price})")
    int ins(LifeCost lifeCost);

    @Select("select * from life_cost where rid = #{rid}")
    @Results({
            @Result(property = "room",column = "rid",javaType = Room.class,
            one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "category",column = "category"),
            @Result(property = "consumption",column = "consumption"),
            @Result(property = "difference",column = "difference"),
            @Result(property = "inputDate",column = "inputDate"),
            @Result(property = "price",column = "price")
    })
    LifeCost selByRid(String rid);

    @Select("select * from life_cost where hid = #{hid} and category = #{category} order by inputDate desc")
    @Results({
            @Result(property = "room",column = "rid",javaType = Room.class,
                    one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "category",column = "category"),
            @Result(property = "consumption",column = "consumption"),
            @Result(property = "difference",column = "difference"),
            @Result(property = "inputDate",column = "inputDate"),
            @Result(property = "price",column = "price")
    })
    List<LifeCost> selByCategory(@Param("hid") int hid, @Param("category") int category);

    @Select("select * from life_cost")
    @Results({
            @Result(property = "room",column = "rid",javaType = Room.class,
                    one = @One(select = "com.csi.mapper.RoomMapper.selById")),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "category",column = "category"),
            @Result(property = "consumption",column = "consumption"),
            @Result(property = "difference",column = "difference"),
            @Result(property = "inputDate",column = "inputDate"),
            @Result(property = "price",column = "price")
    })
    List<LifeCost> selAll();
}
