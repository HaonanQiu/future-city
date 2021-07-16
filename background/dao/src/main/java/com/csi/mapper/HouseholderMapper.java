package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import com.csi.sql.HouseHolderSql;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface HouseholderMapper {

    //添加
    @Insert("insert into householder values(#{id},#{name},#{identification},#{phone},#{email},#{password},#{state})")
    int addHouseholder(HouseHolder houseHolder);

    //删除
    @Delete("delete from householder where id=#{id}")
    int delHouseholder(String id);

    //修改状态
    @Update("update householder set state=#{state} where id=#{id}")
    int updateState(@Param("id") int id,@Param("state") int state);

    //修改信息
    @Update("update householder set name=#{name},identification=#{identification},phone=#{phone},email=#{email},password=#{password},state=#{state}  where id=#{id}")
    int updateAll(HouseHolder houseHolder);

    //根据id查询
    @Select("select * from householder where id = #{id}")
    HouseHolder selectById(int id);

    //分页查询
    @SelectProvider(type = HouseHolderSql.class,method = "page")
    List<HouseHolder> page(Map<String ,String> args, int begin, int pageSize);

    //分页数量查询
    @SelectProvider(type = HouseHolderSql.class,method = "count")
    int count(Map<String, String> args);

    @Select("select * from householder ")
    List<HouseHolder> selectAll();

}
