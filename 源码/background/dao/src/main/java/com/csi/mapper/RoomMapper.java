package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Room;
import com.csi.sql.RoomSql;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface RoomMapper {

    //分页查询
    @SelectProvider(type = RoomSql.class,method = "page")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "buildingNum",column = "buildingNum"),
            @Result(property = "unitNum",column = "unitNum"),
            @Result(property = "roomNum",column = "roomNum"),
            @Result(property = "area",column = "area"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "hid",
                    one = @One (select = "com.csi.mapper.HouseholderMapper.selectById"))
    })
    List<Room> page(Map<String, String> args, int begin, int pageSize);

    //分页数量查询
    @SelectProvider(type = RoomSql.class,method = "count")
    int count(Map<String, String> args);

    //根据ID查询
    @Select("select * from room where id = #{id}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "buildingNum",column = "buildingNum"),
            @Result(property = "unitNum",column = "unitNum"),
            @Result(property = "roomNum",column = "roomNum"),
            @Result(property = "area",column = "area"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "hid",
                    one = @One (select = "com.csi.mapper.HouseholderMapper.selectById"))
    })
    Room selectById(String id);

    @Update("update room set buildingNum = #{buildingNum}, unitNum= #{unitNum}, roomNum = #{roomNum},area= #{area} where id = #{id}")
    int update(Room room);

    @Update("update room set state=state where id=id")
    int state(String id, int state);

    @Insert("insert into room values(#{id},#{buildingNum},#{unitNum},#{roomNum},#{area},1,1)")
    int add(Room room);
}
