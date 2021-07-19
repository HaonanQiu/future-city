package com.csi.pojo;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 生活费用
 */
public class LifeCost {
    //房屋
    private Room room;
    //户主
    private HouseHolder houseHolder;
    //费用类别
    private int category;
    //当前用量
    private double consumption;
    //差量
    private double difference;
    //记录日期
    private Date inputDate;
    //小计
    private double price;
}
