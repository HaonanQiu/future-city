package com.csi.pojo;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 投诉信息
 */
public class ComplaintInformation {
    //投诉id
    private int id;
    //投诉信息
    private String message;
    //户主
    private HouseHolder houseHolder;
    //创建时间
    private Date createTime;
    //是否匿名
    private int state;
}
