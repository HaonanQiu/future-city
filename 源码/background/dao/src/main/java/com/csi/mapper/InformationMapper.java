package com.csi.mapper;

import com.csi.pojo.Information;
import com.csi.sql.InformationSql;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface InformationMapper {

    @Insert("insert into information values(#{id},#{title},#{content},#{readCount},(select now()))")
    int add(Information information);

    @Delete("delete from information where id = #{id}")
    int delete(String id);

    @Update("update information set title=#{title} ,content=#{content} where id=#{id}")
    int update(Information information);

    @Select("select * from information where id = #{id}")
    Information selectById(int id);

    @SelectProvider(type = InformationSql.class ,method = "page")
    List<Information> page(Map<String, String> args, int begin, int pageSize);

    @SelectProvider(type = InformationSql.class ,method = "count")
    int count(Map<String, String> args);
}
