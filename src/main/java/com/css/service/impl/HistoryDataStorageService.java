package com.css.service.impl;

import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DMHistory;
import com.css.entity.DeptJL;
import com.css.entity.Jingli;
import com.css.service.DeptJLService;
import com.css.service.HistoryDataService;
import com.css.service.IDianMingService;
import com.css.service.XunGengService;
import com.css.util.IdGen;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Component
@PropertySource(value="classpath:param.properties")
public class HistoryDataStorageService {

    @Resource
    private DeptJLService deptJLService;
    @Resource
    private HistoryDataService hDataService;
    @Resource
    private IDianMingService dianMingService;
    @Resource
    private XunGengService xunGengService;
    /**
     * 记录日志类
     */
    public Log logger = LogFactory.getLog(this.getClass());

    /**
     * 抓取昨天的全部点名数据
     */
    @Scheduled(cron = "${jobs.RollCall}")
    public void dianMing() throws Exception {
        logger.info("抓取点名数据。");
        List data = dianMingService.getJQPCGCountHistory(getQuerySETime());
        DataSourceTypeManager.set(DataSources.JIANYU);
        hDataService.saveDMHistroy(data);
    }

    @Scheduled(cron = "${jobs.Patrol}")
    public void xunGeng() throws Exception {
        logger.info("抓取巡更历史数据。");
        List data = xunGengService.getXunGengHistory(getQuerySETime());
        DataSourceTypeManager.set(DataSources.JIANYU);
        hDataService.saveXGHistory(data);
    }

    @Scheduled(cron = "${jobs.Attendance}")
    public void jingLi() throws Exception{
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        logger.info("保存警力历史数据。保存时间："+sdf.format(now));
        List deptJLList = deptJLService.getYDDeptJLCount();
        List<Jingli> jingLiDatas = new LinkedList<Jingli>();
        for(Object deptJlOb : deptJLList) {
            DeptJL deptJL = (DeptJL)deptJlOb;

            Jingli jl = new Jingli();
            jl.setId(IdGen.getUUID());
            jl.setDeptId(String.valueOf(deptJL.getDeptID()));
            jl.setDeptNo(deptJL.getDeptNo());
            jl.setDeptName(deptJL.getDeptName());
            jl.setPlanCount(deptJL.getPlanCount());
            jl.setRealCount(deptJL.getRealCount());
            jl.setPercent(deptJL.getPerc());
            jl.setRecordTime(now);

            jingLiDatas.add(jl);
        }
        DataSourceTypeManager.set(DataSources.JIANYU);
        hDataService.saveJingli(jingLiDatas);
    }

    private Map<String, String> getQuerySETime(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        Calendar timeInstance = Calendar.getInstance();
        timeInstance.set(Calendar.DAY_OF_MONTH, timeInstance.get(Calendar.DAY_OF_MONTH)-1);
        timeInstance.set(Calendar.HOUR_OF_DAY, 0);
        timeInstance.set(Calendar.MINUTE, 0);
        timeInstance.set(Calendar.SECOND, 0);
        String stTime = sdf.format(timeInstance.getTime());// "2017-03-09 00:00:00"
        logger.info("本次抓取的开始时间：" + stTime);

        timeInstance.set(Calendar.HOUR_OF_DAY, 23);
        timeInstance.set(Calendar.MINUTE, 59);
        timeInstance.set(Calendar.SECOND, 59);
        String endTime = sdf.format(timeInstance.getTime());// "2017-03-09 23:59:59"
        logger.info("本次抓取的截至时间：" + stTime);

        Map<String, String> params = new HashMap();
        params.put("stTime", stTime);
        params.put("endTime", endTime);

        return params;
    }
}
