package com.css.service;

import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import net.sf.json.JSONObject;

public interface BigBoardService {

    /**
     * 查询大屏幕展示的值班信息，即最后一条插入的纪录
     * @return
     */
    DutyInfo getDisplayDutyInfo();

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
     * 查询大屏幕显示的管理信息，即最后一条插入的纪录
     * @return
     */
    ManageInfo getDisplayManageInfo();

    /**
     * 修改管理信息并将结果存入JSON格式的传入参数
     * @param manageInfo
     * @return
     */
    boolean saveManageInfo(JSONObject manageInfo);
}
