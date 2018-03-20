package com.css.entity;

import java.io.Serializable;

/**
 * Created by wugaofeng on 4/21 0021.
 */
public class DeptJL implements Serializable {
    /* 部门合计出勤情况*/
    private Integer DeptID;
    private String DeptNo;
    private String DeptName;
    private Integer realCount ;
    private Integer planCount ;
    private String perc;

    /*各类型人员出勤统计*/
    private String typeID;
    private String typeName;
    private String absentCount;

    //导出前一天各类型人员进出统计数据
    private Integer xh;//序号
    private String timeNodes;//时间点数
    private Integer mjis;//民警进统计
    private Integer mjos;//民警出统计
    private Integer sydwis;//事业单位人员进统计
    private Integer sydwos;//事业单位人员出统计
    private Integer zgis;//职工进统计
    private Integer zgos;//职工出统计
    private Integer wdwis;//外单位人员进统计
    private Integer wdwos;//外单位人员出统计

    //值班信息
    private String zbname;//值班名称
    private String zbflag;//值班标志
    private String zbtel;//值班电话
    private String zbtemp1;//扩充字段
    private String zbtemp2;//扩充字段

    public DeptJL() {
    }

    public DeptJL(Integer deptID, String deptNo, String deptName, Integer realCount, Integer planCount, String perc, String typeID, String typeName, String absentCount, Integer xh, String timeNodes, Integer mjis, Integer mjos, Integer sydwis, Integer sydwos, Integer zgis, Integer zgos, Integer wdwis, Integer wdwos, String zbname, String zbflag, String zbtel, String zbtemp1, String zbtemp2) {
        DeptID = deptID;
        DeptNo = deptNo;
        DeptName = deptName;
        this.realCount = realCount;
        this.planCount = planCount;
        this.perc = perc;
        this.typeID = typeID;
        this.typeName = typeName;
        this.absentCount = absentCount;
        this.xh = xh;
        this.timeNodes = timeNodes;
        this.mjis = mjis;
        this.mjos = mjos;
        this.sydwis = sydwis;
        this.sydwos = sydwos;
        this.zgis = zgis;
        this.zgos = zgos;
        this.wdwis = wdwis;
        this.wdwos = wdwos;
        this.zbname = zbname;
        this.zbflag = zbflag;
        this.zbtel = zbtel;
        this.zbtemp1 = zbtemp1;
        this.zbtemp2 = zbtemp2;
    }

    public Integer getDeptID() {
        return DeptID;
    }

    public void setDeptID(Integer deptID) {
        DeptID = deptID;
    }

    public String getDeptNo() {
        return DeptNo;
    }

    public void setDeptNo(String deptNo) {
        DeptNo = deptNo;
    }

    public String getDeptName() {
        return DeptName;
    }

    public void setDeptName(String deptName) {
        DeptName = deptName;
    }

    public Integer getRealCount() {
        return realCount;
    }

    public void setRealCount(Integer realCount) {
        this.realCount = realCount;
    }

    public Integer getPlanCount() {
        return planCount;
    }

    public void setPlanCount(Integer planCount) {
        this.planCount = planCount;
    }

    public String getPerc() {
        return perc;
    }

    public void setPerc(String perc) {
        this.perc = perc;
    }

    public String getTypeID() {
        return typeID;
    }

    public void setTypeID(String typeID) {
        this.typeID = typeID;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getAbsentCount() {
        return absentCount;
    }

    public void setAbsentCount(String absentCount) {
        this.absentCount = absentCount;
    }

    public Integer getXh() {
        return xh;
    }

    public void setXh(Integer xh) {
        this.xh = xh;
    }

    public String getTimeNodes() {
        return timeNodes;
    }

    public void setTimeNodes(String timeNodes) {
        this.timeNodes = timeNodes;
    }

    public Integer getMjis() {
        return mjis;
    }

    public void setMjis(Integer mjis) {
        this.mjis = mjis;
    }

    public Integer getMjos() {
        return mjos;
    }

    public void setMjos(Integer mjos) {
        this.mjos = mjos;
    }

    public Integer getSydwis() {
        return sydwis;
    }

    public void setSydwis(Integer sydwis) {
        this.sydwis = sydwis;
    }

    public Integer getSydwos() {
        return sydwos;
    }

    public void setSydwos(Integer sydwos) {
        this.sydwos = sydwos;
    }

    public Integer getZgis() {
        return zgis;
    }

    public void setZgis(Integer zgis) {
        this.zgis = zgis;
    }

    public Integer getZgos() {
        return zgos;
    }

    public void setZgos(Integer zgos) {
        this.zgos = zgos;
    }

    public Integer getWdwis() {
        return wdwis;
    }

    public void setWdwis(Integer wdwis) {
        this.wdwis = wdwis;
    }

    public Integer getWdwos() {
        return wdwos;
    }

    public void setWdwos(Integer wdwos) {
        this.wdwos = wdwos;
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

        DeptJL deptJL = (DeptJL) o;

        if (DeptID != null ? !DeptID.equals(deptJL.DeptID) : deptJL.DeptID != null) return false;
        if (DeptNo != null ? !DeptNo.equals(deptJL.DeptNo) : deptJL.DeptNo != null) return false;
        if (DeptName != null ? !DeptName.equals(deptJL.DeptName) : deptJL.DeptName != null) return false;
        if (realCount != null ? !realCount.equals(deptJL.realCount) : deptJL.realCount != null) return false;
        if (planCount != null ? !planCount.equals(deptJL.planCount) : deptJL.planCount != null) return false;
        if (perc != null ? !perc.equals(deptJL.perc) : deptJL.perc != null) return false;
        if (typeID != null ? !typeID.equals(deptJL.typeID) : deptJL.typeID != null) return false;
        if (typeName != null ? !typeName.equals(deptJL.typeName) : deptJL.typeName != null) return false;
        if (absentCount != null ? !absentCount.equals(deptJL.absentCount) : deptJL.absentCount != null) return false;
        if (xh != null ? !xh.equals(deptJL.xh) : deptJL.xh != null) return false;
        if (timeNodes != null ? !timeNodes.equals(deptJL.timeNodes) : deptJL.timeNodes != null) return false;
        if (mjis != null ? !mjis.equals(deptJL.mjis) : deptJL.mjis != null) return false;
        if (mjos != null ? !mjos.equals(deptJL.mjos) : deptJL.mjos != null) return false;
        if (sydwis != null ? !sydwis.equals(deptJL.sydwis) : deptJL.sydwis != null) return false;
        if (sydwos != null ? !sydwos.equals(deptJL.sydwos) : deptJL.sydwos != null) return false;
        if (zgis != null ? !zgis.equals(deptJL.zgis) : deptJL.zgis != null) return false;
        if (zgos != null ? !zgos.equals(deptJL.zgos) : deptJL.zgos != null) return false;
        if (wdwis != null ? !wdwis.equals(deptJL.wdwis) : deptJL.wdwis != null) return false;
        if (wdwos != null ? !wdwos.equals(deptJL.wdwos) : deptJL.wdwos != null) return false;
        if (zbname != null ? !zbname.equals(deptJL.zbname) : deptJL.zbname != null) return false;
        if (zbflag != null ? !zbflag.equals(deptJL.zbflag) : deptJL.zbflag != null) return false;
        if (zbtel != null ? !zbtel.equals(deptJL.zbtel) : deptJL.zbtel != null) return false;
        if (zbtemp1 != null ? !zbtemp1.equals(deptJL.zbtemp1) : deptJL.zbtemp1 != null) return false;
        return zbtemp2 != null ? zbtemp2.equals(deptJL.zbtemp2) : deptJL.zbtemp2 == null;
    }

    @Override
    public int hashCode() {
        int result = DeptID != null ? DeptID.hashCode() : 0;
        result = 31 * result + (DeptNo != null ? DeptNo.hashCode() : 0);
        result = 31 * result + (DeptName != null ? DeptName.hashCode() : 0);
        result = 31 * result + (realCount != null ? realCount.hashCode() : 0);
        result = 31 * result + (planCount != null ? planCount.hashCode() : 0);
        result = 31 * result + (perc != null ? perc.hashCode() : 0);
        result = 31 * result + (typeID != null ? typeID.hashCode() : 0);
        result = 31 * result + (typeName != null ? typeName.hashCode() : 0);
        result = 31 * result + (absentCount != null ? absentCount.hashCode() : 0);
        result = 31 * result + (xh != null ? xh.hashCode() : 0);
        result = 31 * result + (timeNodes != null ? timeNodes.hashCode() : 0);
        result = 31 * result + (mjis != null ? mjis.hashCode() : 0);
        result = 31 * result + (mjos != null ? mjos.hashCode() : 0);
        result = 31 * result + (sydwis != null ? sydwis.hashCode() : 0);
        result = 31 * result + (sydwos != null ? sydwos.hashCode() : 0);
        result = 31 * result + (zgis != null ? zgis.hashCode() : 0);
        result = 31 * result + (zgos != null ? zgos.hashCode() : 0);
        result = 31 * result + (wdwis != null ? wdwis.hashCode() : 0);
        result = 31 * result + (wdwos != null ? wdwos.hashCode() : 0);
        result = 31 * result + (zbname != null ? zbname.hashCode() : 0);
        result = 31 * result + (zbflag != null ? zbflag.hashCode() : 0);
        result = 31 * result + (zbtel != null ? zbtel.hashCode() : 0);
        result = 31 * result + (zbtemp1 != null ? zbtemp1.hashCode() : 0);
        result = 31 * result + (zbtemp2 != null ? zbtemp2.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "DeptJL{" +
                "DeptID=" + DeptID +
                ", DeptNo='" + DeptNo + '\'' +
                ", DeptName='" + DeptName + '\'' +
                ", realCount=" + realCount +
                ", planCount=" + planCount +
                ", perc='" + perc + '\'' +
                ", typeID='" + typeID + '\'' +
                ", typeName='" + typeName + '\'' +
                ", absentCount='" + absentCount + '\'' +
                ", xh=" + xh +
                ", timeNodes='" + timeNodes + '\'' +
                ", mjis=" + mjis +
                ", mjos=" + mjos +
                ", sydwis=" + sydwis +
                ", sydwos=" + sydwos +
                ", zgis=" + zgis +
                ", zgos=" + zgos +
                ", wdwis=" + wdwis +
                ", wdwos=" + wdwos +
                ", zbname='" + zbname + '\'' +
                ", zbflag='" + zbflag + '\'' +
                ", zbtel='" + zbtel + '\'' +
                ", zbtemp1='" + zbtemp1 + '\'' +
                ", zbtemp2='" + zbtemp2 + '\'' +
                '}';
    }
}
