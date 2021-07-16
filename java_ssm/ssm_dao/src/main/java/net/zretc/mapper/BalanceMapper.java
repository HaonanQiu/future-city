package net.zretc.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface BalanceMapper {

    @Update("update balance set ${type}=${type}-#{num} where hid=#{id}")
    int change (@Param("id") int id,@Param("num")  double num ,@Param("type")  String type);

    @Select("select #{type} from balance where id = #{id}")
    Double select (@Param("id") int id,@Param("type")  String type);

}
