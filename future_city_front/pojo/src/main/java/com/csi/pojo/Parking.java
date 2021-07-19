package com.csi.pojo;

import com.csi.utils.DateUtil;
import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 停车位信息
 */
public class Parking {
    //停车位编号
    private String id;
    //分区
    private String area;
    //起始时间
    private Date startDate;
    //结束时间
    private Date endDate;
    //停车位状态（0闲置；1租赁；2售出）
    private int state;
    //户主
    private HouseHolder houseHolder;

    public String startTimeStr() {
        return DateUtil.date2String(this.startDate, "yyyy-MM-dd hh:mm:ss");
    }

    public String endTimeStr() {
        return DateUtil.date2String(this.endDate, "yyyy-MM-dd hh:mm:ss");
    }
}
