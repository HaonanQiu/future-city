package com.csi.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter

/**
 * 户主信息
 */
public class HouseHolder {
    //户主id
    private int id;
    //户主姓名
    private String name;
    //身份证号
    private String identification;
    //手机号
    private String phone;
    //邮箱
    private String email;
    //密码
    private String password;
    //账号状态
    private int state;

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", identification='" + identification + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", state=" + state +
                '}';
    }
}
