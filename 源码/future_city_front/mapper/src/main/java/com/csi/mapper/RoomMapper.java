package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Room;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomMapper {
    @Select("select * from room where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "buildingNum",column = "buildingNum"),
            @Result(property = "unitNum",column = "unitNum"),
            @Result(property = "roomNum",column = "roomNum"),
            @Result(property = "area",column = "area"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "state",column = "state"),
    })
    Room selById(String id);

    @Select("select * from room where hid = #{hid}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "buildingNum",column = "buildingNum"),
            @Result(property = "unitNum",column = "unitNum"),
            @Result(property = "roomNum",column = "roomNum"),
            @Result(property = "area",column = "area"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "state",column = "state"),
    })
    List<Room> selAll(int hid);
}
