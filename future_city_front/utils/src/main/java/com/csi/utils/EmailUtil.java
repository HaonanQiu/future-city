package com.csi.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
    public static boolean send_email(String to, String verCode) {
        // 发件人电子邮箱
        String from = "17602258902@163.com";

        String checkCode = "JANYAGIFFBVLJRLY";

        // 指定发送邮件的主机为 smtp.qq.com
        String host = "smtp.163.com";  //QQ 邮件服务器

        // 获取系统属性
        Properties properties = System.getProperties();

        // 设置邮件服务器
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        // 获取默认session对象
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, checkCode);
                //第一个参数是发者的邮箱  第二个参数是你的授权码  这一步我已经改过不会出现错误
            }
        });

        try {
            // 创建默认的 MimeMessage 对象
            MimeMessage message = new MimeMessage(session);

            // Set From: 头部头字段
            message.setFrom(new InternetAddress(from));

            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: 头部头字段
            message.setSubject("future-city (*^▽^*)");

            // 设置消息体
            message.setText("验证码是：" + verCode + "。此邮件无需回复！！！");

            // 发送消息
            Transport.send(message);
            return true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
            return false;
        }
    }
}
