package com.css.service;

import com.css.entity.YuzhengUser;
import net.sf.json.JSONObject;

public interface YuzhengUserService {

    /**
     * 根据用户名密码验证登陆
     * @param userJson
     * @return
     * @throws Exception
     */
    YuzhengUser verifyLogin(JSONObject userJson) throws Exception;

    /**
     * 修改用户密码并返回结果
     * @param userName
     * @param oPwd
     * @param nPwd
     * @return 1=成功，0=失败，-1=原密码错误
     * @throws Exception
     */
    int updateUserPassword(String userName, String oPwd, String nPwd) throws Exception;
}
