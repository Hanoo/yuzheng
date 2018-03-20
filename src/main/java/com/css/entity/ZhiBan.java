package com.css.entity;

import java.io.Serializable;

/**
 * Created by wugaofeng on 4/21 0021.
 */
public class ZhiBan implements Serializable {

    private String zbid;//值班id
    private String aid;//监区id
    private String zbname;//值班名称
    private String zbflag;//值班标志
    private String zbtel;//值班电话
    private String zbtemp1;//扩充字段
    private String zbtemp2;//扩充字段

    public ZhiBan() {
    }

    public ZhiBan(String zbid, String aid, String zbname, String zbflag, String zbtel, String zbtemp1, String zbtemp2) {
        this.zbid = zbid;
        this.aid = aid;
        this.zbname = zbname;
        this.zbflag = zbflag;
        this.zbtel = zbtel;
        this.zbtemp1 = zbtemp1;
        this.zbtemp2 = zbtemp2;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getZbname() {
        return zbname;
    }

    public void setZbname(String zbname) {
        this.zbname = zbname;
    }

    public String getZbflag() {
        return zbflag;
    }

    public void setZbflag(String zbflag) {
        this.zbflag = zbflag;
    }

    public String getZbtel() {
        return zbtel;
    }

    public void setZbtel(String zbtel) {
        this.zbtel = zbtel;
    }

    public String getZbtemp1() {
        return zbtemp1;
    }

    public void setZbtemp1(String zbtemp1) {
        this.zbtemp1 = zbtemp1;
    }

    public String getZbtemp2() {
        return zbtemp2;
    }

    public void setZbtemp2(String zbtemp2) {
        this.zbtemp2 = zbtemp2;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ZhiBan zhiBan = (ZhiBan) o;

        if (zbid != null ? !zbid.equals(zhiBan.zbid) : zhiBan.zbid != null) return false;
        if (aid != null ? !aid.equals(zhiBan.aid) : zhiBan.aid != null) return false;
        if (zbname != null ? !zbname.equals(zhiBan.zbname) : zhiBan.zbname != null) return false;
        if (zbflag != null ? !zbflag.equals(zhiBan.zbflag) : zhiBan.zbflag != null) return false;
        if (zbtel != null ? !zbtel.equals(zhiBan.zbtel) : zhiBan.zbtel != null) return false;
        if (zbtemp1 != null ? !zbtemp1.equals(zhiBan.zbtemp1) : zhiBan.zbtemp1 != null) return false;
        return zbtemp2 != null ? zbtemp2.equals(zhiBan.zbtemp2) : zhiBan.zbtemp2 == null;
    }

    @Override
    public int hashCode() {
        int result = zbid != null ? zbid.hashCode() : 0;
        result = 31 * result + (aid != null ? aid.hashCode() : 0);
        result = 31 * result + (zbname != null ? zbname.hashCode() : 0);
        result = 31 * result + (zbflag != null ? zbflag.hashCode() : 0);
        result = 31 * result + (zbtel != null ? zbtel.hashCode() : 0);
        result = 31 * result + (zbtemp1 != null ? zbtemp1.hashCode() : 0);
        result = 31 * result + (zbtemp2 != null ? zbtemp2.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ZhiBan{" +
                "zbid='" + zbid + '\'' +
                ", aid='" + aid + '\'' +
                ", zbname='" + zbname + '\'' +
                ", zbflag='" + zbflag + '\'' +
                ", zbtel='" + zbtel + '\'' +
                ", zbtemp1='" + zbtemp1 + '\'' +
                ", zbtemp2='" + zbtemp2 + '\'' +
                '}';
    }
}
