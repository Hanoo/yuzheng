package com.css.entity;

import java.util.Date;

public class DutyInfo {
    private int id;

    private int pQuantity;

    private int pRealQuantity;

    private int policeQuantity;

    private int policeOnDutyQuantity;

    private String chiefOfficer;

    private String officer;

    private String chiefOfficerTel;

    private String officerTel;

    private String pOnDuty;

    private String pInStation;

    private String pInCommandCenter;

    private Date diInsertTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getpRealQuantity() {
        return pRealQuantity;
    }

    public void setpRealQuantity(int pRealQuantity) {
        this.pRealQuantity = pRealQuantity;
    }

    public int getPoliceQuantity() {
        return policeQuantity;
    }

    public void setPoliceQuantity(int policeQuantity) {
        this.policeQuantity = policeQuantity;
    }

    public int getPoliceOnDutyQuantity() {
        return policeOnDutyQuantity;
    }

    public void setPoliceOnDutyQuantity(int policeOnDutyQuantity) {
        this.policeOnDutyQuantity = policeOnDutyQuantity;
    }

    public String getChiefOfficer() {
        return chiefOfficer;
    }

    public void setChiefOfficer(String chiefOfficer) {
        this.chiefOfficer = chiefOfficer;
    }

    public String getOfficer() {
        return officer;
    }

    public void setOfficer(String officer) {
        this.officer = officer;
    }

    public String getChiefOfficerTel() {
        return chiefOfficerTel;
    }

    public void setChiefOfficerTel(String chiefOfficerTel) {
        this.chiefOfficerTel = chiefOfficerTel;
    }

    public String getOfficerTel() {
        return officerTel;
    }

    public void setOfficerTel(String officerTel) {
        this.officerTel = officerTel;
    }

    public String getpOnDuty() {
        return pOnDuty;
    }

    public void setpOnDuty(String pOnDuty) {
        this.pOnDuty = pOnDuty;
    }

    public String getpInStation() {
        return pInStation;
    }

    public void setpInStation(String pInStation) {
        this.pInStation = pInStation;
    }

    public String getpInCommandCenter() {
        return pInCommandCenter;
    }

    public void setpInCommandCenter(String pInCommandCenter) {
        this.pInCommandCenter = pInCommandCenter;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Date getDiInsertTime() {
        return diInsertTime;
    }

    public void setDiInsertTime(Date diInsertTime) {
        this.diInsertTime = diInsertTime;
    }
}