package com.csi.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class RoomSql {

    public String page(Map<String, String> map, int begin, int pageSize) {

        String buildingNum = map.get("buildingNum");
        String unitNum = map.get("unitNum");
        String roomNum = map.get("roomNum");

        String sql = new SQL() {
            {
                SELECT("*");
                FROM("room");
                if (map.get("buildingNum") != null && !buildingNum.equals("")) {
                    WHERE("buildingNum = " + "'" + map.get("buildingNum") + "'");
                }
                if (map.get("unitNum") != null && !unitNum.equals("")) {
                    WHERE("unitNum = " + "'" + map.get("unitNum") + "'");
                }
                if (map.get("roomNum") != null && !roomNum.equals("")) {
                    WHERE("roomNum = " + "'" + map.get("roomNum") + "'");
                }
            }
        }.toString();
        String limit = " limit " + begin + "," + pageSize;
        return sql.concat(limit);

    }


    public String count(Map<String, String> map) {
        String buildingNum = map.get("buildingNum");
        String unitNum = map.get("unitNum");
        String roomNum = map.get("roomNum");
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("room");
                if (map.get("buildingNum") != null && !buildingNum.equals("")) {
                    WHERE("buildingNum = " + "'" + map.get("buildingNum") + "'");
                }
                if (map.get("unitNum") != null && !unitNum.equals("")) {
                    WHERE("unitNum = " + "'" + map.get("unitNum") + "'");
                }
                if (map.get("roomNum") != null && !roomNum.equals("")) {
                    WHERE("roomNum = " + "'" + map.get("roomNum") + "'");
                }
            }
        }.toString();
    }

}
