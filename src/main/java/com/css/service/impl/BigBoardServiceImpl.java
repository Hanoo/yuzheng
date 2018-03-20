package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DutyInfo;
import com.css.entity.ManageInfo;
import com.css.service.BigBoardService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("bigBoardService")
public class BigBoardServiceImpl implements BigBoardService {
    @Resource
    DAO dao;

    public static final String onlyRecordId = "theOnlyRec";

    @Value("${admin.userName}")
    private String userName;

    @Value("${admin.passWordHash}")
    private String passWordHash;

    public boolean verifyAdmin(String userName, String passwordHash) {
        return this.userName.equals(userName)&&this.passWordHash.equals(passwordHash);
    }

    public DutyInfo getDutyInfo() {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i = null;
        try {
            i = dao.findForObject("DutyInfoMapper.selectByPrimaryKey", onlyRecordId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (DutyInfo)i;
    }

    public boolean updateDutyInfo(DutyInfo dutyInfo) {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i;
        try {
            i = dao.save("DutyInfoMapper.updateByPrimaryKeySelective", dutyInfo);
        } catch (Exception e) {
            e.printStackTrace();
            i = 0;
        }
        return (Integer)i>0;
    }

    public boolean saveDutyInfo(JSONObject dutyInfoJSON) {
        DutyInfo dutyInfo = (DutyInfo) JSONObject.toBean(dutyInfoJSON, DutyInfo.class);
        dutyInfo.setId(onlyRecordId);
        return updateDutyInfo(dutyInfo);
    }

    public ManageInfo getManageInfo() {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i = null;
        try {
            i = dao.findForObject("ManageInfoMapper.selectByPrimaryKey", onlyRecordId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (ManageInfo)i;
    }

    public boolean saveManageInfo(JSONObject manageInfoJSON) {
        ManageInfo manageInfo = (ManageInfo) JSONObject.toBean(manageInfoJSON, ManageInfo.class);
        manageInfo.setId(onlyRecordId);
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i;
        try {
            i = dao.save("ManageInfoMapper.updateByPrimaryKeySelective", manageInfo);
        } catch (Exception e) {
            e.printStackTrace();
            i = 0;
        }
        return (Integer)i>0;
    }

}
