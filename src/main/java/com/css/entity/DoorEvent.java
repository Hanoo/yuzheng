package com.css.entity;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

/**
 * Created by wang on 4/21 0021.
 */
public class DoorEvent implements Serializable{
    private int DoorId;
    private String DoorNo;
    private String DoorName;
    private String RecTime;
    private int EventId;
    private String EventName;
    private int IoState;
    private String EmpId;

    public int getDoorId() {
        return DoorId;
    }

    public void setDoorId(int doorId) {
        DoorId = doorId;
    }

    public String getDoorNo() {
        return DoorNo;
    }

    public void setDoorNo(String doorNo) {
        DoorNo = doorNo;
    }

    public String getDoorName() {
        return DoorName;
    }

    public void setDoorName(String doorName) {
        DoorName = doorName;
    }

    public String getRecTime() {
        return RecTime;
    }

    public void setRecTime(String recTime) {
        RecTime = recTime;
    }

    public int getEventId() {
        return EventId;
    }

    public void setEventId(int eventId) {
        EventId = eventId;
    }

    public String getEventName() {
        return EventName;
    }

    public void setEventName(String eventName) {
        EventName = eventName;
    }

    public int getIoState() {
        return IoState;
    }

    public void setIoState(int ioState) {
        IoState = ioState;
    }

    public String getEmpId() {
        return EmpId;
    }

    public void setEmpId(String empId) {
        EmpId = empId;
    }

    public DoorEvent() {

    }

    public DoorEvent(int doorId, String doorNo, String doorName, String recTime, int eventId, String eventName, int ioState, String empId) {
        DoorId = doorId;
        DoorNo = doorNo;
        DoorName = doorName;
        RecTime = recTime;
        EventId = eventId;
        EventName = eventName;
        IoState = ioState;
        EmpId = empId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof DoorEvent)) return false;

        DoorEvent doorEvent = (DoorEvent) o;

        if (DoorId != doorEvent.DoorId) return false;
        if (EventId != doorEvent.EventId) return false;
        if (IoState != doorEvent.IoState) return false;
        if (DoorNo != null ? !DoorNo.equals(doorEvent.DoorNo) : doorEvent.DoorNo != null) return false;
        if (DoorName != null ? !DoorName.equals(doorEvent.DoorName) : doorEvent.DoorName != null) return false;
        if (RecTime != null ? !RecTime.equals(doorEvent.RecTime) : doorEvent.RecTime != null) return false;
        if (EventName != null ? !EventName.equals(doorEvent.EventName) : doorEvent.EventName != null) return false;
        return EmpId != null ? EmpId.equals(doorEvent.EmpId) : doorEvent.EmpId == null;

    }

    @Override
    public int hashCode() {
        int result = DoorId;
        result = 31 * result + (DoorNo != null ? DoorNo.hashCode() : 0);
        result = 31 * result + (DoorName != null ? DoorName.hashCode() : 0);
        result = 31 * result + (RecTime != null ? RecTime.hashCode() : 0);
        result = 31 * result + EventId;
        result = 31 * result + (EventName != null ? EventName.hashCode() : 0);
        result = 31 * result + IoState;
        result = 31 * result + (EmpId != null ? EmpId.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "DoorEvent{" +
                "DoorId=" + DoorId +
                ", DoorNo='" + DoorNo + '\'' +
                ", DoorName='" + DoorName + '\'' +
                ", RecTime='" + RecTime + '\'' +
                ", EventId=" + EventId +
                ", EventName='" + EventName + '\'' +
                ", IoState=" + IoState +
                ", EmpId='" + EmpId + '\'' +
                '}';
    }
}
