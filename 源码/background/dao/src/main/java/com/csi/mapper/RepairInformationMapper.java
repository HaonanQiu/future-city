package com.csi.mapper;

import com.csi.pojo.Information;
import com.csi.pojo.RepairInformation;
import com.csi.sql.InformationSql;
import com.csi.sql.RepairSql;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface RepairInformationMapper {

    @Select("select * from repair_information where id = #{id}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "address",column = "address"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "message",column = "message"),
            @Result(property = "finishTime",column = "finishTime"),
            @Result(property = "creatTime",column = "creatTime"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "hid",
                    one = @One(select = "com.csi.mapper.HouseholderMapper.selectById"))
    })
    RepairInformation selectById(int id);

    @SelectProvider(type = RepairSql.class ,method = "page")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "address",column = "address"),
            @Result(property = "phone",column = "phone"),
            @Result(property = "message",column = "message"),
            @Result(property = "finishTime",column = "finishTime"),
            @Result(property = "creatTime",column = "creatTime"),
            @Result(property = "state",column = "state"),
            @Result(property = "houseHolder",column = "hid",
                    one = @One(select = "com.csi.mapper.HouseholderMapper.selectById"))
    })
    List<RepairInformation> page(Map<String, String> args, int begin, int pageSize);

    @SelectProvider(type = RepairSql.class ,method = "count")
    int count(Map<String, String> args);

    @Update("update repair_information set state=#{state} where id=#{id}")
    int state( @Param("id")int id, @Param("state")int state);
}
