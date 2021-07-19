package net.zretc.pojo;

import java.util.Date;

/**
 * 生活费用
 */
public class LifeCost {
    //房屋
    private String rid;
    //户主
    private int hid;
    //费用类别
    private int category;
    //当前用量
    private double consumption;
    //差量
    private double difference;
    //记录日期
    private Date inputDate;
    //小计
    private double price;

    public LifeCost() {

    }

    public LifeCost(String rid, int hid, int category, double consumption, double difference, Date inputDate, double price) {
        this.rid = rid;
        this.hid = hid;
        this.category = category;
        this.consumption = consumption;
        this.difference = difference;
        this.inputDate = inputDate;
        this.price = price;
    }

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public double getConsumption() {
        return consumption;
    }

    public void setConsumption(double consumption) {
        this.consumption = consumption;
    }

    public double getDifference() {
        return difference;
    }

    public void setDifference(double difference) {
        this.difference = difference;
    }

    public Date getInputDate() {
        return inputDate;
    }

    public void setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "LifeCost{" +
                "rid=" + rid +
                ", hid=" + hid +
                ", category=" + category +
                ", consumption=" + consumption +
                ", difference=" + difference +
                ", inputDate=" + inputDate +
                ", price=" + price +
                '}';
    }
}
