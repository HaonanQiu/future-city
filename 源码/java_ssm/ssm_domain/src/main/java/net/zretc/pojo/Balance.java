package net.zretc.pojo;




/**
 * 账户余额
 */
public class Balance {
    //户主
    private int hid;
    //房屋
    private int rid;
    //水费
    private double water;
    //电费
    private double electric;
    //燃气费
    private double gas;
    //物业费
    private double property;

    public Balance() {

    }

    public Balance(int hid, int rid, double water, double electric, double gas, double property) {
        this.hid = hid;
        this.rid = rid;
        this.water = water;
        this.electric = electric;
        this.gas = gas;
        this.property = property;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public double getWater() {
        return water;
    }

    public void setWater(double water) {
        this.water = water;
    }

    public double getElectric() {
        return electric;
    }

    public void setElectric(double electric) {
        this.electric = electric;
    }

    public double getGas() {
        return gas;
    }

    public void setGas(double gas) {
        this.gas = gas;
    }

    public double getProperty() {
        return property;
    }

    public void setProperty(double property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "Balance{" +
                "hid=" + hid +
                ", rid=" + rid +
                ", water=" + water +
                ", electric=" + electric +
                ", gas=" + gas +
                ", property=" + property +
                '}';
    }
}