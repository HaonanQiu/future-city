package com.csi.sql;

import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class InformationSql {


    public String page(Map<String, String> map, int begin, int pageSize) {

        String title = map.get("title");
        String startDate = map.get("startDate");
        String endDate = map.get("endDate");

        String sql = new SQL() {
            {
                SELECT("*");
                FROM("information");
                if (map.get("title") != null && !title.equals("")) {
                    WHERE("title like " + "'%" + map.get("title") + "%'");
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
        String title = map.get("title");
        String startDate = map.get("startDate");
        String endDate = map.get("endDate");
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("information");
                if (map.get("title") != null && !title.equals("")) {
                    WHERE("title like " + "'%" + map.get("title") + "%'");
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
