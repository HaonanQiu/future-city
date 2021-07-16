package com.csi.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class LifeCostSql {


    public String page(Map<String, String> map, int begin, int pageSize) {

        String startDate = map.get("startDate");
        String endDate = map.get("endDate");

        String sql = new SQL() {
            {
                SELECT("*");
                FROM("life_cost");
                if (map.get("startDate") != null && !startDate.equals("")) {
                    if (map.get("endDate") != null && !endDate.equals("")) {
                        WHERE("sendTime  between" + "'" + map.get("startDate") + "'"+ "and '" + map.get("endDate") + "'" );
                    }
                    if (map.get("endDate") == null || endDate.equals("")) {
                        WHERE("sendTime  between" + "'" + map.get("startDate") + "'"+ "and (select now())");
                    }
                }

            }
        }.toString();
        String limit = " limit " + begin + "," + pageSize;
        return sql.concat(limit);

    }


    public String count(Map<String, String> map) {
        String startDate = map.get("startDate");
        String endDate = map.get("endDate");
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("life_cost");
                if (map.get("startDate") != null && !startDate.equals("")) {
                    if (map.get("endDate") != null && !endDate.equals("")) {
                        WHERE("sendTime  between" + "'" + map.get("startDate") + "'"+ "and '" + map.get("endDate") + "'" );
                    }
                    if (map.get("endDate") == null || endDate.equals("")) {
                        WHERE("sendTime  between" + "'" + map.get("startDate") + "'"+ "and (select now())");
                    }
                }
            }
        }.toString();
    }

}
