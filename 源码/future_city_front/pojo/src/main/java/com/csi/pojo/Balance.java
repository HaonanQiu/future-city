package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@Getter
@Setter
@ToString
/**
 * 账户余额
 */
public class Balance {
    //户主
    private HouseHolder householder;
    //房屋
    private Room room;
    //水费
    private double water;
    //电费
    private double electric;
    //燃气费
    private double gas;
    //物业费
    private double property;

    public Balance(HouseHolder householder, Room room, double water, double electric, double gas, double property) {
        this.householder = householder;
        this.room = room;
        this.water = water;
        this.electric = electric;
        this.gas = gas;
        this.property = property;
    }
}