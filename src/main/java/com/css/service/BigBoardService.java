package com.css.service;

import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import net.sf.json.JSONObject;

public interface BigBoardService {

    boolean verifyAdmin(String userName, String passwordHash);

    /**
     * 查询值班信息
     * @return
     */
    DutyInfo getDutyInfo();

    /**
     * 修改值班信息
     * @param dutyInfo
     * @return
     */
    boolean updateDutyInfo(DutyInfo dutyInfo);

    /**
     * 修改值班信息并修改JSON格式的传入参数
     * @param dutyInfo
     * @return
     */
    boolean saveDutyInfo(JSONObject dutyInfo);

    /**
     * 获取管理信息
     * @return
     */
    ManageInfo getManageInfo();

    /**
     * 修改管理信息并将结果存入JSON格式的传入参数
     * @param manageInfo
     * @return
     */
    boolean saveManageInfo(JSONObject manageInfo);
}
