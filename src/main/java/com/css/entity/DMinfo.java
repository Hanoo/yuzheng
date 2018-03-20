package com.css.entity;

import java.io.Serializable;

/**
 * Created by yhc on 2017/6/26.
 */
public class DMinfo  implements Serializable {
    /**
     * 序号，作为主键使用
     */
    private String xh;
    /**
     * 监区名称
     */
    private String name;
    private String qxyy;
    private Integer value;
    private Integer pcount;
    private Integer ydNum;
    private String code;
    private String caption;
    private Integer planCount;
    private Integer realCount;
    private String perc;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public Integer getPlanCount() {
        return planCount;
    }

    public void setPlanCount(Integer planCount) {
        this.planCount = planCount;
    }

    public Integer getRealCount() {
        return realCount;
    }

    public void setRealCount(Integer realCount) {
        this.realCount = realCount;
    }

    public String getPerc() {
        return perc;
    }

    public void setPerc(String perc) {
        this.perc = perc;
    }


    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    public String getQxyy() {
        return qxyy;
    }

    public void setQxyy(String qxyy) {
        this.qxyy = qxyy;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public Integer getPcount() {
        return pcount;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public Integer getYdNum() {
        return ydNum;
    }

    public void setYdNum(Integer ydNum) {
        this.ydNum = ydNum;
    }

    public Integer getSdNum() {
        return sdNum;
    }

    public void setSdNum(Integer sdNum) {
        this.sdNum = sdNum;
    }

    public String getName() {
        return name;

    }

    public void setName(String name) {
        this.name = name;
    }

    private Integer sdNum;
}
