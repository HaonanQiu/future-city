package com.csi.mapper;

import com.csi.pojo.UnitPrice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UnitPriceMapper {

    @Select("select * from unit_price")
    List<UnitPrice> findAll();

    @Insert("insert into unit_price values(#{id},#{name},#{price},#{unit})")
    int addUnitPrice(UnitPrice unitPrice);

    @Update("update unit_price set name=#{name},price=#{price},unit=#{unit} where id=#{id}")
    int updateUnitPrice(UnitPrice unitPrice);

    @Delete("delete from unit_price where name=#{name}")
    int deleteUnitPrice(String name);

    @Select("select * from unit_price where name=#{name}")
    UnitPrice findByName(String name);
}
