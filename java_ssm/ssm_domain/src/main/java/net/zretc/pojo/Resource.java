package net.zretc.pojo;

public class Resource {

    private int id;

    private int hid;

    private String rid;

    //水费
    private double water;
    //电费
    private double electric;
    //燃气费
    private double gas;
    //物业费
    private double property;

    public Resource() {

    }

    public Resource(int id, int hid, String rid, double water, double electric, double gas, double property) {
        this.id = id;
        this.hid = hid;
        this.rid = rid;
        this.water = water;
        this.electric = electric;
        this.gas = gas;
        this.property = property;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHid() {
        return hid;
    }

    public void setHid(int hid) {
        this.hid = hid;
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

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", hid=" + hid +
                ", rid=" + rid +
                ", water=" + water +
                ", electric=" + electric +
                ", gas=" + gas +
                ", property=" + property +
                '}';
    }
}
