package com.csi.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class HouseHolderSql {

    public String page(Map<String, String> map, int begin, int pageSize) {

        String name = map.get("name");
        String identification = map.get("identification");
        String state = map.get("state");

        String sql = new SQL() {
            {
                SELECT("*");
                FROM("householder");
                if (map.get("name") != null && !name.equals("")) {
                    WHERE("name = " + "'" + map.get("name") + "'");
                }
                if (map.get("identification") != null && !identification.equals("")) {
                    WHERE("identification = " + "'" + map.get("identification") + "'");
                }
                if (map.get("state") != null && !state.equals("")) {
                    WHERE("state = " + "'" + map.get("state") + "'");
                }
            }
        }.toString();
        String limit = " limit " + begin + "," + pageSize;
        return sql.concat(limit);

    }


    public String count(Map<String, String> map) {
        String name = map.get("name");
        String identification = map.get("identification");
        String state = map.get("state");
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("householder");
                if (map.get("name") != null && !name.equals("")) {
                    WHERE("name = " + "'" + map.get("name") + "'");
                }
                if (map.get("identification") != null && !identification.equals("")) {
                    WHERE("identification = " + "'" + map.get("identification") + "'");
                }
                if (map.get("state") != null && !state.equals("")) {
                    WHERE("state = " + "'" + map.get("state") + "'");
                }
            }
        }.toString();
    }
}
