package com.css.entity;

import java.io.Serializable;

/**
 * Created by yhc on 2017/4/25.
 */
public class DMNumCount implements Serializable {

    private  Integer ydNum;
    private Integer sdNum;

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

    public DMNumCount(Integer ydNum, Integer sdNum) {

        this.ydNum = ydNum;
        this.sdNum = sdNum;
    }
}
