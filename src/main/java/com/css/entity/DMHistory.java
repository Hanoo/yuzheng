package com.css.entity;

import java.util.Date;

public class DMHistory {
    private Integer xh;

    private String pname;

    private String aid;

    private Date begintime;

    private Date endtime;

    private Integer pcount;

    private Integer pcountsum;

    private Integer aminute;

    private String jkczy;

    public Integer getXh() {
        return xh;
    }

    public void setXh(Integer xh) {
        this.xh = xh;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid == null ? null : aid.trim();
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getPcount() {
        return pcount;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public Integer getPcountsum() {
        return pcountsum;
    }

    public void setPcountsum(Integer pcountsum) {
        this.pcountsum = pcountsum;
    }

    public Integer getAminute() {
        return aminute;
    }

    public void setAminute(Integer aminute) {
        this.aminute = aminute;
    }

    public String getJkczy() {
        return jkczy;
    }

    public void setJkczy(String jkczy) {
        this.jkczy = jkczy == null ? null : jkczy.trim();
    }
}