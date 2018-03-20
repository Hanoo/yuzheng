package com.css.service;

import com.css.entity.EasyDemo;

import java.util.List;

/**
 * Created by wang on 6/30 0030.
 */
public interface IConfigService {

    List getAreaList() throws Exception;

    int saveCfg(EasyDemo bean);

    EasyDemo getSelVal(String param);
}
