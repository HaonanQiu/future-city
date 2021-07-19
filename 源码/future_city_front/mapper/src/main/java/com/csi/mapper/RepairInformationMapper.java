package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.RepairInformation;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RepairInformationMapper {
    @Insert("insert into repair_information values(#{id},#{address},#{phone},#{message},#{householder.id},(select now()),#{finishTime},0)")
    int ins(RepairInformation repairInformation);

    @Select("select * from repair_information where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "address",column = "address"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "message",column = "message"),
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "finishTime",column = "finishTime"),
            @Result(property = "state",column = "state"),
    })
    RepairInformation selById(int id);

    @Select("select * from repair_information")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "address",column = "address"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "message",column = "message"),
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "finishTime",column = "finishTime"),
            @Result(property = "state",column = "state"),
    })
    List<RepairInformation> selAll();

    @Select("select * from repair_information where hid = #{hid} and state = #{state}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "address",column = "address"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "message",column = "message"),
            @Result(property = "householder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "finishTime",column = "finishTime"),
            @Result(property = "state",column = "state"),
    })
    List<RepairInformation> selByState(@Param("hid") int hid, @Param("state") int state);

    @Update("update repair_information set state = #{state}, finishTime = (select now()) where id = #{id};")
    int upd(RepairInformation repairInformation);
}
