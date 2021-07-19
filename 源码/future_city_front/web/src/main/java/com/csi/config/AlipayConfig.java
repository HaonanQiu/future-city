package com.csi.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117689693";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtc+d6FJRqrf22jl5ubC+EI4uUWz9PmAn7iUsYY4Xe/usuQmU3UYe+W9NDpIPlrRAoXfJ5JISC2JdGIB/b/u6DRQP9vGmVvd++IM8BaxZxThlxkv1R/8nxZk2idgb9f62N1xxoSr0AUEKawTcDLzhIeGKLiglcU9ESBNJTp4RhDZNBSMMM6meKRj7jRurxobERvazt432b9xLDvaHn+dJie4Friun1R7shdrH538K+JsM8wBJD1A4qFInyxTcvfBj5dlmeZi4JaJU/IDP/cQ8Tw3tUaEL7i40HYvCUEze7GCpvI+MNgKdNTSBZgLqxSUNhvyjwxg61f0H4jnP/KukhAgMBAAECggEBAIpFXz3+seHpGdwx2i2EqMxZ2adGpk25Ehwm8mpazBlcdfbGjxFuORwS73N47nxlXgAQBH92EPyN1OneKgeiTlju56OaU0E/v+E9HkgvKhDhBX94geCgXEfIGhNsq13iLmRoGwk4qzpYwP/FDynGtsNu1IAQZi3n0z7eAR0W6XzDmJjMqDParb8lyMfgYcl4euTVK5xdfjoPSwYJGFwSQZ9tETdNFqcoNeB1Jw0zePrnGbr09NiOPkKVHlkEHMj8Q5BS0EXk9Pvsoze2ZcxDoLuVHqGRMTzX2BlRCSLIu4sx69owPtbnbhN7elikO5pR5UOuZmnqO2MFgFghCdf3blECgYEA5EbcU9vKaoLTYkUU3bBmHLZuAX8H894m1pngg7sDP9J67KSWDes2hSju7GkyHjQ3hRsB0wPhVdVwupe5/LcOx+2JKS5MnTNJ+t/huSMa3AsW70hQNySqXJnT79YAK6Y8xrtSAF33aLJJbimlanjI071yBWor8MR4FtCI3+lJRdcCgYEAwoSPg5flHui8vF4EsD380USiIEhgb2ufK4ky/qwUAQCNx2IpBqs6DYg0oSfh7P1XRzdeZwLvzi5TA0k8FU2ESRYCUMFgXiBCedBtl3vWV2p9ftLNkiGDLmxMcp8OuUU5M4s6Ingnbx8m/L78PaCIb2EX6eExDYKicg/3JJgFeccCgYEAy9s0G3dmdmPKnjGPBsLnDbEk4BUvZur2yCK2yy0RI8e1musITfnFwHjjlSAEb9C13BpYMLeAXgS0HQ4uO67Gdmh8WthL9v68jFuu2oStEeCdZKaxa+1Eblm5WK9Fi7VzBQ53lnhT352H0edDH6gpwF2oG4nLH8J0c/taoItWshUCgYBK56swPIzhozQSwY3CpIw3tdtM3TItld78b9/wTCmD3Ue7kORFiihXz6ycpnQMw94ZMYwr1OitmA8lg80cUvZvAoevu1e1x2xx5j5diDWZAgwDi3/YFwmiFdg2h2OvGqYVYDbp0SU2WGO2DoGp5ajEYzpHOQ2fqz+M9vLv546sPwKBgCtWs9cdbiAdOL1cZ2c23wcF781lJMYbsWYpVc3IscPL4HyMBKcXjbeCOC/zTbQ7DVKfSW1xnP3jbhm9yoFkSwiR7w1nauQ1TIfBLtH5ovpkSkbfUGfmr9wsPJvYqp2JYM3wnahp3pJmzpyAw3AJVO4LjdxTAixeJODKHCYYk1EK";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAl2IOBd3Xgcdu9WmoTbj3eMCT5Ru0tA/I6rx6+TyQsYKWodFY/TuA3dmr5Q9H8ymJMvuQvDMVn3zwmQrcFDv3DR7iJpD/MTVtIXoEIs6B1/Kl3xV8laulNJMbzrwaQRniLjh5J7BCzAkJqGGpPW26TfzQ30ZObN6LwzNZUBeS4pUVkMAV3lBrHpQA9j+cMFOGFrHAQOiyzw/Kq6Uue932KCzywlosB+dirIZoAcxpjAJ/zutc+gBsSEhvOvx92JYnc8a1y8H7bg2Mv49VuawlPWZq+O6fx0sKL96bju+sRHGaJgmET4OYXdEYfEbTwYbV6f8sDgpfD+30wI1bqasj/wIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/web/pay/success";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/web/pay/success";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

