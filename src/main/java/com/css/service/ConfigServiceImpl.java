package com.css.service;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.EasyDemo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wang on 6/30 0030.
 */
@Service("configService")
public class ConfigServiceImpl implements IConfigService {

    @Resource
    DAO dao;

    @Value("#{configProperties['addr1']}")
    private String addr1;

    @Value("#{configProperties['addr2']}")
    private String addr2;

    @Value("#{configProperties['addr3']}")
    private String addr3;

    @Transactional
    public List getAreaList() throws Exception {

        System.out.println(addr1 + "-" + addr2 + "-" + addr3);

        DataSourceTypeManager.set(DataSources.JIANYU);
        return (List) dao.findForList("getAreaList", null);
    }

    @Transactional
    public int saveCfg(EasyDemo bean) {
        DataSourceTypeManager.set(DataSources.JIANYU);
        Object i = 0;
        try {
            i = dao.save("jy_savecfg", bean);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return (Integer) i;
    }

    @Transactional
    public EasyDemo getSelVal(String param) {

        DataSourceTypeManager.set(DataSources.JIANYU);
        EasyDemo bean = null;
        try {
            bean = (EasyDemo) dao.findForObject("getSelVal", param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
