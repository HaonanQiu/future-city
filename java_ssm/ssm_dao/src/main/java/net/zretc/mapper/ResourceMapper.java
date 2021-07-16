package net.zretc.mapper;

import net.zretc.pojo.Resource;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ResourceMapper {

    @Select("select * from resource where hid = #{id}")
    Resource select(@Param("id") int id);

    @Update("update resource set ${type} = #{num} where hid = #{id}")
    int update(@Param("id") int id,@Param("type") String type,@Param("num") double num);

}
