package com.csi.mapper;

import com.csi.pojo.LifeCost;
import com.csi.pojo.RepairInformation;
import com.csi.sql.LifeCostSql;
import com.csi.sql.RepairSql;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface LifeCostMapper {

    @SelectProvider(type = LifeCostSql.class ,method = "page")
    @Results({
            @Result(property = "category",column = "category"),
            @Result(property = "consumption",column = "consumption"),
            @Result(property = "difference",column = "difference"),
            @Result(property = "inputDate",column = "inputDate"),
            @Result(property = "price",column = "price"),
            @Result(property = "houseHolder",column = "hid",
                    one = @One(select = "com.csi.mapper.HouseholderMapper.selectById")),
            @Result(property = "room",column = "rid",
                    one = @One(select = "com.csi.mapper.RoomMapper.selectById"))
    })
    List<LifeCost> page(Map<String, String> args, int begin, int pageSize);

    @SelectProvider(type = LifeCostSql.class ,method = "count")
    int count(Map<String, String> args);


}
