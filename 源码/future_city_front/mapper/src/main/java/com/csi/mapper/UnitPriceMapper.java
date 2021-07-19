package com.csi.mapper;

import com.csi.pojo.UnitPrice;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UnitPriceMapper {
    @Select("select * from unit_price where name = #{name}")
    UnitPrice selByName(String name);

    @Select("select * from unit_price")
    List<UnitPrice> selAll();
}
