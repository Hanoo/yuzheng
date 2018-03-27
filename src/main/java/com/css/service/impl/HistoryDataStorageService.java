package com.css.service.impl;

import com.css.entity.DeptJL;
import com.css.entity.Jingli;
import com.css.service.DeptJLService;
import com.css.service.HistoryDataService;
import com.css.util.IdGen;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Component
@PropertySource(value="classpath:param.properties")
public class HistoryDataStorageService {

    @Resource
    private DeptJLService deptJLService;
    @Resource
    private HistoryDataService hDataService;
    /**
     * 记录日志类
     */
    public Log logger = LogFactory.getLog(this.getClass());

    /**
     * 定时任务方法
     */
    @Scheduled(cron = "${jobs.RollCall}")
    public void dianMing(){
        logger.info("RollCall now.");
    }

    @Scheduled(cron = "${jobs.Patrol}")
    public void xunGeng(){
        logger.info("Patrol now.");
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
        hDataService.saveJingli(jingLiDatas);
    }
}
