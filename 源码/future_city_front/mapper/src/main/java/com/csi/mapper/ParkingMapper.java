package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Parking;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParkingMapper {
    @Select("select * from parking where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "area",column = "area"),
            @Result(property = "startDate",column = "startDate"),
            @Result(property = "endDate",column = "endDate"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "houseHolder",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById"))
    })
    Parking selById(String id);

    @Select("select * from parking")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "area",column = "area"),
            @Result(property = "startDate",column = "startDate"),
            @Result(property = "endDate",column = "endDate"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "houseHolder",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById"))
    })
    List<Parking> selAll();
}
