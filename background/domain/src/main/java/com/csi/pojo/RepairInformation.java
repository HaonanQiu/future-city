package com.csi.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
/**
 * 报修信息
 */
public class RepairInformation {
    //报修编号
    private int id;
    //地址
    private String address;
    //电话
    private String phone;
    //报修信息
    private String message;
    //户主
    private HouseHolder houseHolder;

    //创建日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    //结束日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date finishTime;

    //事件状态（0未处理；1处理中；2/3已处理 ）
    private int state;
}
