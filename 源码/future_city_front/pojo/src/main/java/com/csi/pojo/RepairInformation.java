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
 * 报修信息
 */
public class RepairInformation {
    //报修编号
    private int id;
    //地址
    private String address;
    //联系电话
    private String phone;
    //报修信息
    private String message;
    //户主
    private HouseHolder householder;
    //报修时间
    private Date createTime;
    //完成时间
    private Date finishTime;
    //事件状态（0未处理；1处理中；2已处理）
    private int state;

    public String createTimeStr() {
        return DateUtil.date2String(this.createTime, "yyyy-MM-dd hh:mm:ss");
    }
    public String finishTimeStr(){
        return DateUtil.date2String(this.createTime, "yyyy-MM-dd hh:mm:ss");
    }
}
