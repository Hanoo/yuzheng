package com.css.service.impl;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.YuzhengUser;
import com.css.service.YuzhengUserService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class YuzhengServiceImpl implements YuzhengUserService {
    @Resource
    DAO dao;

    public YuzhengUser verifyLogin(JSONObject userJson) throws Exception {
        DataSourceTypeManager.set(DataSources.JIANYU);

        String userName = userJson.getString("userName");
        String passwd = userJson.getString("password");
        YuzhengUser user = (YuzhengUser) dao.findForObject("YuzhengUserMapper.getByUserName", userName);
        if(null!=user && passwd.equals(user.getUserPassword())) {
            userJson.put("msg", "success");
            return user;
        }
        userJson.put("msg", "failed");
        return null;
    }

    public int updateUserPassword(String userName, String oPwd, String nPwd) throws Exception {
        DataSourceTypeManager.set(DataSources.JIANYU);
        YuzhengUser user = (YuzhengUser) dao.findForObject("YuzhengUserMapper.getByUserName", userName);
        if(oPwd.equals(user.getUserPassword())) {
            user.setUserPassword(nPwd);
            Integer i = (Integer) dao.save("YuzhengUserMapper.updateByPrimaryKeySelective", user);
            return i;
        } else {
            return -1;
        }
    }
}
