package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 资源单价
 */
public class UnitPrice {
    private int id;
    //单价名
    private String name;
    //单价
    private double price;
    //单位
    private String unit;
}
