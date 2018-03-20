package com.css.entity;







import java.io.Serializable;
import java.util.Date;

/**
 * Created by July on 2017/4/24.
 */
public class XunGeng implements Serializable{
    private Integer RID;
    private String  LineID;
    private Date  BeginTime;
    private Date  EndTime;

    private String AddrID;
    private  Date LogTime;
    private  String AddrName;

    private Date LogDate;

    private Integer Xgnum;

    public XunGeng() {
    }

    public XunGeng(Integer RID, String lineID, Date beginTime, Date endTime, String addrID, Date logTime, String addrName, Date logDate, Integer xgnum) {
        this.RID = RID;
        LineID = lineID;
        BeginTime = beginTime;
        EndTime = endTime;
        AddrID = addrID;
        LogTime = logTime;
        AddrName = addrName;
        LogDate = logDate;
        Xgnum = xgnum;
    }

    public Integer getRID() {
        return RID;
    }


    public void setRID(Integer RID) {
        this.RID = RID;
    }

    public String getLineID() {
        return LineID;
    }

    public void setLineID(String lineID) {
        LineID = lineID;
    }

    public Date getBeginTime() {
        return BeginTime;
    }

    public void setBeginTime(Date beginTime) {
        BeginTime = beginTime;
    }

    public Date getEndTime() {
        return EndTime;
    }

    public void setEndTime(Date endTime) {
        EndTime = endTime;
    }

    public String getAddrID() {
        return AddrID;
    }

    public void setAddrID(String addrID) {
        AddrID = addrID;
    }

    public Date getLogTime() {
        return LogTime;
    }

    public void setLogTime(Date logTime) {
        LogTime = logTime;
    }

    public String getAddrName() {
        return AddrName;
    }

    public void setAddrName(String addrName) {
        AddrName = addrName;
    }

    public Date getLogDate() {
        return LogDate;
    }

    public void setLogDate(Date logDate) {
        LogDate = logDate;
    }

    public Integer getXgnum() {
        return Xgnum;
    }

    public void setXgnum(Integer xgnum) {
        Xgnum = xgnum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        XunGeng xunGeng = (XunGeng) o;

        if (RID != null ? !RID.equals(xunGeng.RID) : xunGeng.RID != null) return false;
        if (LineID != null ? !LineID.equals(xunGeng.LineID) : xunGeng.LineID != null) return false;
        if (BeginTime != null ? !BeginTime.equals(xunGeng.BeginTime) : xunGeng.BeginTime != null) return false;
        if (EndTime != null ? !EndTime.equals(xunGeng.EndTime) : xunGeng.EndTime != null) return false;
        if (AddrID != null ? !AddrID.equals(xunGeng.AddrID) : xunGeng.AddrID != null) return false;
        if (LogTime != null ? !LogTime.equals(xunGeng.LogTime) : xunGeng.LogTime != null) return false;
        if (AddrName != null ? !AddrName.equals(xunGeng.AddrName) : xunGeng.AddrName != null) return false;
        if (LogDate != null ? !LogDate.equals(xunGeng.LogDate) : xunGeng.LogDate != null) return false;
        return Xgnum != null ? Xgnum.equals(xunGeng.Xgnum) : xunGeng.Xgnum == null;
    }

    @Override
    public int hashCode() {
        int result = RID != null ? RID.hashCode() : 0;
        result = 31 * result + (LineID != null ? LineID.hashCode() : 0);
        result = 31 * result + (BeginTime != null ? BeginTime.hashCode() : 0);
        result = 31 * result + (EndTime != null ? EndTime.hashCode() : 0);
        result = 31 * result + (AddrID != null ? AddrID.hashCode() : 0);
        result = 31 * result + (LogTime != null ? LogTime.hashCode() : 0);
        result = 31 * result + (AddrName != null ? AddrName.hashCode() : 0);
        result = 31 * result + (LogDate != null ? LogDate.hashCode() : 0);
        result = 31 * result + (Xgnum != null ? Xgnum.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "XunGeng{" +
                "RID=" + RID +
                ", LineID='" + LineID + '\'' +
                ", BeginTime=" + BeginTime +
                ", EndTime=" + EndTime +
                ", AddrID='" + AddrID + '\'' +
                ", LogTime=" + LogTime +
                ", AddrName='" + AddrName + '\'' +
                ", LogDate=" + LogDate +
                ", Xgnum=" + Xgnum +
                '}';
    }
}
