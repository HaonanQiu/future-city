package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 房屋信息
 */
public class Room {
    //房屋id
    private String id = "1";
    //楼号
    private int buildingNum;
    //单元号
    private int unitNum;
    //房间号
    private int roomNum;
    //房屋面积
    private int area;
    //户主
    private HouseHolder houseHolder;
    //房屋状态（0无人；1有人）
    private int state;
}
