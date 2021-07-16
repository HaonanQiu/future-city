package net.zretc.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UnitPriceMapper {

    @Select("select price from unit_price where name = #{name}")
    Double selectByName ( @Param("name") String name);

}
