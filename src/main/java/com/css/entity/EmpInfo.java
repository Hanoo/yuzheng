package com.css.entity;

import java.io.Serializable;

/**
 * Created by wugaofeng on 4/21 0021.
 */
public class EmpInfo implements Serializable {
    private String empId;
    private String empNo;
    private String empName;
    private String empType;
    private String typeName;

    private Integer deptID;
    private String deptNo;
    private String deptName;

    private String ioState;

    public EmpInfo() {
    }


    public EmpInfo(String empId, String empNo, String empName, String empType, String typeName, Integer deptID, String deptNo, String deptName, String ioState) {
        this.empId = empId;
        this.empNo = empNo;
        this.empName = empName;
        this.empType = empType;
        this.typeName = typeName;
        this.deptID = deptID;
        this.deptNo = deptNo;
        this.deptName = deptName;
        this.ioState = ioState;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public void setEmpType(String empType) {
        this.empType = empType;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setDeptID(Integer deptID) {
        this.deptID = deptID;
    }

    public void setDeptNo(String deptNo) {
        this.deptNo = deptNo;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setIoState(String ioState) {
        this.ioState = ioState;
    }


    public String getEmpId() {
        return empId;
    }

    public String getEmpNo() {
        return empNo;
    }

    public String getEmpName() {
        return empName;
    }

    public String getEmpType() {
        return empType;
    }

    public String getTypeName() {
        return typeName;
    }

    public Integer getDeptID() {
        return deptID;
    }

    public String getDeptNo() {
        return deptNo;
    }

    public String getDeptName() {
        return deptName;
    }

    public String getIoState() {
        return ioState;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmpInfo empInfo = (EmpInfo) o;

        if (empId != null ? !empId.equals(empInfo.empId) : empInfo.empId != null) return false;
        if (empNo != null ? !empNo.equals(empInfo.empNo) : empInfo.empNo != null) return false;
        if (empName != null ? !empName.equals(empInfo.empName) : empInfo.empName != null) return false;
        if (empType != null ? !empType.equals(empInfo.empType) : empInfo.empType != null) return false;
        if (typeName != null ? !typeName.equals(empInfo.typeName) : empInfo.typeName != null) return false;
        if (deptID != null ? !deptID.equals(empInfo.deptID) : empInfo.deptID != null) return false;
        if (deptNo != null ? !deptNo.equals(empInfo.deptNo) : empInfo.deptNo != null) return false;
        if (deptName != null ? !deptName.equals(empInfo.deptName) : empInfo.deptName != null) return false;
        return ioState != null ? ioState.equals(empInfo.ioState) : empInfo.ioState == null;
    }

    @Override
    public int hashCode() {
        int result = empId != null ? empId.hashCode() : 0;
        result = 31 * result + (empNo != null ? empNo.hashCode() : 0);
        result = 31 * result + (empName != null ? empName.hashCode() : 0);
        result = 31 * result + (empType != null ? empType.hashCode() : 0);
        result = 31 * result + (typeName != null ? typeName.hashCode() : 0);
        result = 31 * result + (deptID != null ? deptID.hashCode() : 0);
        result = 31 * result + (deptNo != null ? deptNo.hashCode() : 0);
        result = 31 * result + (deptName != null ? deptName.hashCode() : 0);
        result = 31 * result + (ioState != null ? ioState.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "EmpInfo{" +
                "empId='" + empId + '\'' +
                ", empNo='" + empNo + '\'' +
                ", empName='" + empName + '\'' +
                ", empType='" + empType + '\'' +
                ", typeName='" + typeName + '\'' +
                ", deptID=" + deptID +
                ", deptNo='" + deptNo + '\'' +
                ", deptName='" + deptName + '\'' +
                ", ioState='" + ioState + '\'' +
                '}';
    }
}
