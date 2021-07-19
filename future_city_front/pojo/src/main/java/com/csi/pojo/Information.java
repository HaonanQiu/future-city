package com.csi.pojo;

import com.csi.utils.DateUtil;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
/**
 * 资讯
 */
public class Information {
    //资讯编号
    private int id;
    //标题
    private String title;
    //内容
    private String content;
    //阅读次数
    private int readCount;
    //发布时间
    private Date sendTime;

    public String sendTimeStr() {
        return DateUtil.date2String(this.sendTime, "yyyy-MM-dd hh:mm:ss");
    }

    public String dayStr(){
        return DateUtil.date2String(this.sendTime, "dd");
    }

    public String ymStr(){
        return DateUtil.date2String(this.sendTime, "yyyy-MM");
    }

    public String timeStr(){
        return DateUtil.date2String(this.sendTime, "hh:mm:ss");
    }
}
