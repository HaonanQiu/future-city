package com.csi.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class RepairSql {


    public String page(Map<String, String> map, int begin, int pageSize) {

        String state = map.get("state");
        String startDate = map.get("startDate");
        String endDate = map.get("endDate");

        String sql = new SQL() {
            {
                SELECT("*");
                FROM("repair_information");
                if (map.get("state") != null && !state.equals("")) {
                    WHERE("state = " + "'" + map.get("state") + "'");
                }
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
        String state = map.get("state");
        String startDate = map.get("startDate");
        String endDate = map.get("endDate");
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("repair_information");
                if (map.get("state") != null && !state.equals("")) {
                    WHERE("state = " + "'" + map.get("state") + "'");
                }
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
