package com.csi.mapper;

import com.csi.pojo.Information;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface InformationMapper {
    @Select("select * from information order by sendTime desc")
    List<Information> selAll();

    @Select("select * from information where id = #{id}")
    Information selById(int id);

    @Update("update information set title= #{title},content=#{content},readCount=#{readCount},sendTime=#{sendTime} where id=#{id}")
    int upd(Information information);
}
