package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
/**
 * 资源单价
 */
public class UnitPrice {
    //id
    private int id;
    //单价名
    private String name;
    //单价
    private double price;
    //单位
    private String unit;


    @Override
    public String toString() {
        return "UnitPrice{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", unit='" + unit + '\'' +
                '}';
    }
}
