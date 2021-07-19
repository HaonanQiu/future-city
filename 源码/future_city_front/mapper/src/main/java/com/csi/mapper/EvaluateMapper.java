package com.csi.mapper;

import com.csi.pojo.Evaluate;
import com.csi.pojo.RepairInformation;
import com.csi.pojo.Room;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluateMapper {
    @Insert("insert into evaluate values (#{repairInformation.id},#{star},#{content})")
    int ins(Evaluate evaluate);

    @Delete("delete from evaluate where rid = #{rid}")
    int delByRid(int rid);

    @Update("update evaluate set rid = #{repairInformation.id},star = #{star},content = #{content} where rid = #{repairInformation.id}")
    int updByRid(Evaluate evaluate);

    @Select("select * from evaluate where rid = #{rid}")
    @Results({
            @Result(property = "repairInformation",column = "rid",javaType = RepairInformation.class,
            one = @One(select = "com.csi.mapper.RepairInformationMapper.selById")),
            @Result(property = "star",column = "star"),
            @Result(property = "content",column = "content")
    })
    Evaluate selByRid(int rid);

    @Select("select * from evaluate")
    @Results({
            @Result(property = "repairInformation",column = "rid",javaType = RepairInformation.class,
                    one = @One(select = "com.csi.mapper.RepairInformationMapper.selById")),
            @Result(property = "star",column = "star"),
            @Result(property = "content",column = "content")
    })
    List<Evaluate> selAll();
}
