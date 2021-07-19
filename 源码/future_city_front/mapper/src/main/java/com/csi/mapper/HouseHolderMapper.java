package com.csi.mapper;

import com.csi.pojo.HouseHolder;
import lombok.Setter;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface HouseHolderMapper {
    /**
     * 添加业主
     * @return 数据库受影响行数
     */
    @Insert("insert into householder values(#id,#name,#identification,#phone,#email,#password,#state)")
    int ins(HouseHolder houseHolder);

    /**
     * 根据id删除业主
     * @param id 要删除的id
     * @return 数据库受影响行数
     */
    @Delete("delete from householder where id = #{id}")
    int delById(int id);

    /**
     * @param houseHolder
     * @return
     */
    @Update("update householder set name = #{name},identification = #{identification},phone = #{phone},email = #{email},password = #{password},state = #{state} where id = #{id}")
    int updById(HouseHolder houseHolder);

    /**
     * 根据id查看户主信息
     * @param id 要查看的id
     * @return 一个HouseHolder对象
     */
    @Select("select * from householder where id = #{id}")
    HouseHolder selById(int id);

    /**
     * 根据身份证号查看户主信息
     * @param identification 要查看的 身份证号
     * @return 一个HouseHolder对象
     */
    @Select("select * from householder where identification = #{identification}")
    HouseHolder selByIdentification(String identification);

    /**
     * 根据邮箱查看户主
     * @param email 要查找的email
     * @return 一个HouseHolder对象
     */
    @Select("select * from householder where email = #{email}")
    HouseHolder selByEmail(String email);

    /**
     * 查看全部业主
     * @return
     */
    @Select("select * from householder")
    List<HouseHolder> selAll();
}
