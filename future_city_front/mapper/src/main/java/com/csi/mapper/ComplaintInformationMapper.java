package com.csi.mapper;


import com.csi.pojo.ComplaintInformation;
import com.csi.pojo.HouseHolder;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComplaintInformationMapper {
    @Insert("insert into complaint_Information values(#{id},#{message},#{householder.id},(select now()),#{state})")
    int ins(ComplaintInformation complaintInformation);

    @Select("select * from complaint_Information where id = #{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "message",column = "message"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
            one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "state",column = "state"),
    })
    ComplaintInformation selById(int id);

    @Select("select * from complaint_Information")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "message",column = "message"),
            @Result(property = "houseHolder",column = "hid",javaType = HouseHolder.class,
                    one = @One(select = "com.csi.mapper.HouseHolderMapper.selById")),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "state",column = "state"),
    })
    List<ComplaintInformation> selAll();
}
