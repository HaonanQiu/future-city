package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 评价
 */
public class Evaluate {
    //报修信息
    private RepairInformation repairInformation;
    //星级
    private double star;
    //评价内容
    private String content;
}
