package com.csi.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
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
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;
}
