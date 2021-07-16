package com.csi.mapper;

import com.csi.pojo.Login;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

public interface LoginMapper {

    @Select("select * from login where name = #{name} and password = #{password}")
    Login findByName(@Param("name") String name, @Param("password") String password);

}
