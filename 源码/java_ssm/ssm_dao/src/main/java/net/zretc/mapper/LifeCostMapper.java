package net.zretc.mapper;

import net.zretc.pojo.LifeCost;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface LifeCostMapper {
    @Select("SELECT consumption FROM (SELECT * FROM life_cost ORDER BY inputDate DESC) r  WHERE category = #{category} LIMIT 0,1")
    Double before(int category);

    @Insert("insert into life_cost values(#{rid},#{hid},#{category},#{consumption},#{difference},(select now()),#{price})")
    int add(LifeCost lifeCost);
}
