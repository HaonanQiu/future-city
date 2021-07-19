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
 * 订单信息
 */
public class Orders {
    //订单编号
    private String id;
    //户主
    private HouseHolder householder;
    //支付时间
    private Date payDate;
    //支付方式（0支付宝；1现金）
    private int payment;
    //金额
    private double money;
    //订单类型（0水费；1电费；2燃气费；3物业费）
    private int type;

    public String payTimeStr() {
        return DateUtil.date2String(this.payDate, "yyyy-MM-dd hh:mm:ss");
    }
}
