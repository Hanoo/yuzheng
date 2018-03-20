package com.css.service;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DMinfo;
import com.css.entity.DeptJL;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailParseException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;


@Service("dianMingService")
public class DianMingServiceImpl implements IDianMingService {


    @Resource
    private DAO dao;


    @Resource
    private DeptJLService deptJLService;


    @Value("${fxsxsj}")
    private String fxsxsj;

    @Value("${sjjg}")
    private String sjjg;

    @Value("#{configProperties['addr1']}")
    private String addr1;

    @Value("#{configProperties['addr2']}")
    private String addr2;

    @Value("#{configProperties['addr3']}")
    private String addr3;

    @Value("#{configProperties['addr4']}")
    private String addr4;

    @Value("#{configProperties['addr5']}")
    private String addr5;

    @Value("#{configProperties['addr6']}")
    private String addr6;
    @Value("#{configProperties['addr7']}")
    private String addr7;

    @Value("#{configProperties['addr8']}")
    private String addr8;

    @Value("#{configProperties['addr9']}")
    private String addr9;
    @Value("#{configProperties['addr10']}")
    private String addr10;
    @Value("#{configProperties['addr11']}")
    private String addr11;
    @Value("#{configProperties['addr12']}")
    private String addr12;
    @Value("#{configProperties['addr13']}")
    private String addr13;

    @Value("#{configProperties['addr14']}")
    private String addr14;

    @Value("#{configProperties['addr15']}")
    private String addr15;

    /**
     * 获取首页各个监区信息
     *
     * @return
     * @throws Exception
     */
    @Transactional
    public List getDianMingInfo() throws Exception {

        Map map = getCxTime();

        //切换到点名系统数据源
        DataSourceTypeManager.set(DataSources.ZKESERVER);

        String cxTime = "";
        String nowTime = "";
        cxTime = map.get("cxTime").toString();
        nowTime = map.get("nowTime").toString();
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        Map m = new HashMap();
        m.put("params", params);
        List dianMingList = (List) dao.findForList("DianMingMapper.getDianMingInfo", m);

        List jlList = deptJLService.getYDDeptJLCount();

        List<DMinfo> dmList = new ArrayList<DMinfo>();

        //将警力部署和点名相结合
        for (int i = 0; i < dianMingList.size(); i++) {

            DMinfo dmInfo = (DMinfo) dianMingList.get(i);
            for (int j = 0; j < jlList.size(); j++) {
                String perc = "";
                DeptJL dl = (DeptJL) jlList.get(j);
                if (dmInfo.getName().equals(dl.getDeptName())) {

                    //因到警察数
                    dmInfo.setPlanCount(dl.getPlanCount());

                    //实到警察数
                    dmInfo.setRealCount(dl.getRealCount());

                    //实际到的服刑人数和警力人数


                    if (dmInfo.getValue() == 0) {
                        perc = "0%";
                    } else {

                        String fx = dmInfo.getValue().toString();
                        String jl = dl.getRealCount().toString();
                        double percent = Float.parseFloat(jl) / Float.parseFloat(fx);

                        //获取格式化对象
                        NumberFormat nt = NumberFormat.getPercentInstance();

                        //设置百分数精确度2即保留两位小数
                        nt.setMinimumFractionDigits(2);
                        perc = nt.format(percent);
                    }

//百分比
                    dmInfo.setPerc(perc);

                    dmList.add(dmInfo);
                }
            }
        }

        List<DMinfo> dataResult = new ArrayList<DMinfo>();

        // n 代表地点
        dataResult.add(setPoValue(addr1.split(","), dmList, "1"));
        dataResult.add(setPoValue(addr2.split(","), dmList, "2"));
        dataResult.add(setPoValue(addr3.split(","), dmList, "3"));
        dataResult.add(setPoValue(addr4.split(","), dmList, "4"));
        dataResult.add(setPoValue(addr5.split(","), dmList, "5"));
        dataResult.add(setPoValue(addr6.split(","), dmList, "6"));
        dataResult.add(setPoValue(addr7.split(","), dmList, "7"));
        dataResult.add(setPoValue(addr8.split(","), dmList, "8"));
        dataResult.add(setPoValue(addr9.split(","), dmList, "9"));
        dataResult.add(setPoValue(addr10.split(","), dmList, "10"));
        dataResult.add(setPoValue(addr11.split(","), dmList, "11"));
        dataResult.add(setPoValue(addr12.split(","), dmList, "12"));
        dataResult.add(setPoValue(addr13.split(","), dmList, "13"));
        dataResult.add(setPoValue(addr14.split(","), dmList, "14"));
        dataResult.add(setPoValue(addr15.split(","), dmList, "15"));
        return dataResult;
    }


    private DMinfo setPoValue(String[] arrAddr, List<DMinfo> dmList, String name) {
        DMinfo result = new DMinfo();

        if (arrAddr[0].length() == 0) {
            result.setQxyy("false");
            return result;
        }

        int jlreal = 0;
        int jlplan = 0;
        int fxreal = 0;
        int fxplan = 0;

        for (int i = 0; i < arrAddr.length; i++) {
            for (DMinfo po : dmList) {
                if (po.getXh().equals(arrAddr[i])) {
                    jlplan += po.getPlanCount();
                    jlreal += po.getRealCount();
                    fxplan += po.getPcount();
                    fxreal += po.getValue();
                    break;
                }
            }
        }
        result.setPlanCount(jlplan);
        result.setRealCount(jlreal);
        result.setValue(fxreal);
        result.setPcount(fxplan);
        result.setCode(name);
        result.setQxyy("true");
        return result;
    }

    @Transactional
    public List getDMInfo() throws Exception {
        Map map = getCxTime();

        //切换到点名系统数据源
        DataSourceTypeManager.set(DataSources.ZKESERVER);
//定义开始时间
        String cxTime = "";
        //定义结束时间
        String nowTime = "";
        //将时间进行格式化处理
        cxTime = map.get("cxTime").toString();
        nowTime = map.get("nowTime").toString();
        //定义查询参数
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        //实例化一个Map
        Map m = new HashMap();
        //给Map赋值
        m.put("params", params);

        //查询所有所有监区点名情况
        List dianMingList = (List) dao.findForList("DianMingMapper.getDMInfo", m);

        //获取警力分布情况
        List jlList = deptJLService.getYDDeptJLCount();


        List dmList = new ArrayList();


        //将警力部署和点名相结合
        for (int i = 0; i < dianMingList.size(); i++) {

            DMinfo dmInfo = (DMinfo) dianMingList.get(i);
            for (int j = 0; j < jlList.size(); j++) {
                DeptJL dl = (DeptJL) jlList.get(j);
                String perc;
                if (dmInfo.getName().equals(dl.getDeptName())) {

                    //因到警察数
                    dmInfo.setPlanCount(dl.getPlanCount());

                    //实到警察数
                    dmInfo.setRealCount(dl.getRealCount());

                    //实际到的服刑人数和警力人数


                    if (dmInfo.getValue() == 0) {
                        perc = "0%";
                    } else {

                        String fx = dmInfo.getValue().toString();
                        String jl = dl.getRealCount().toString();
                        double percent = Float.parseFloat(jl) / Float.parseFloat(fx);

                        //获取格式化对象
                        NumberFormat nt = NumberFormat.getPercentInstance();

                        //设置百分数精确度2即保留两位小数
                        nt.setMinimumFractionDigits(2);
                        perc = nt.format(percent);
                    }


                    //百分比
                    dmInfo.setPerc(perc);

                    dmList.add(dmInfo);
                }


            }
        }

        return dmList;
    }

    @Transactional
    //获取所有没有点名人员的明细情况
    public List getWdDmInfo(Map reqMap) throws Exception {
        //切换到点名系统数据源
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        //查询没有点名人员的详细情况
        List wdDmList = (List) dao.findForList("DianMingMapper.getWdDMInfo", reqMap);

        return wdDmList;
    }


//    /**
//     * 获取监区列表
//     *
//     * @return
//     * @throws Exception
//     */
//    public List getAreaList() throws Exception {
//        DataSourceTypeManager.set(DataSources.ZKESERVER);
//        List dataList = (List) dao.findForList("getAreaList", "");
//        return dataList;
//    }

//    /**
//     * 获取监区点名的想想情况
//     *
//     * @return
//     * @throws Exception
//     */
//    public List getDmXxqkList(Map reqMap) throws Exception {
//        DataSourceTypeManager.set(DataSources.ZKESERVER);
//        List dataList = new ArrayList();
////                (List) dao.findForList("getDmXxqk", "");
//        return dataList;
//    }


    /**
     * 获取监区指定时间点名次数
     *
     * @return
     * @throws Exception
     */
    public List getDmNum(Map reqMap) throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);

        Integer pdsj = Integer.parseInt(sjjg);
        String stTime = "";
        String endTime = "";
        if (pdsj == 999) {
            stTime = "2017-02-05 00:00:00";
            endTime = "2017-02-05 23:59:59.493";
        } else {

            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            date = calendar.getTime();
            String nowTime = f.format(date);
            stTime = nowTime + " 00:00:00";
            endTime = nowTime + " 23:59:59";
        }


        String params = " AND endtime >='" + stTime + "' AND endtime <'" + endTime + "'";
        //实例化一个Map
        Map m = new HashMap();
        //给Map赋值
        m.put("params", params);

        List dmNumList = (List) dao.findForList("getDmNum", m);

        return dmNumList;
    }


    //获取所有监区没有点名监区的情况
    public List getAllDianMingInfo(Map reqMap) throws Exception {
//        Map map = getCxTime();
        //切换到点名系统数据源
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        //实例化一个List用来存放结果集
        List resList = new ArrayList();
        String cxTime = "";
        String nowTime = "";
        cxTime = reqMap.get("stTime").toString();
        nowTime = reqMap.get("endTime").toString();
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        Map m = new HashMap();
        m.put("params", params);
        List dianMingList = (List) dao.findForList("DianMingMapper.getAllDMInfo", m);
        for (int i = 0; i < dianMingList.size(); i++) {
            Map resMap = new HashMap();
            DMinfo dmInfo = (DMinfo) dianMingList.get(i);
            String fx = dmInfo.getValue().toString();
            String jqmc = dmInfo.getName();
            if (fx != null && fx.equals("0")) {
                resMap.put("name", "点名预警");
                resMap.put("info", jqmc + cxTime + "到" + nowTime + "未按要求点名");
                resMap.put("time", nowTime);
                resList.add(resMap);
            }
        }

        //获取警力分布情况
        List jlList = deptJLService.getHistoryTjDeptJl(reqMap);

        //查询所有监区点名情况


        List dmList = new ArrayList();


        //将警力部署和点名相结合
        for (int i = 0; i < dianMingList.size(); i++) {

            DMinfo dmInfo = (DMinfo) dianMingList.get(i);
            for (int j = 0; j < jlList.size(); j++) {
                DeptJL dl = (DeptJL) jlList.get(j);
                String perc;
                if (dmInfo.getName().equals(dl.getDeptName())) {

                    Map jlMap = new HashMap();
                    //因到警察数
                    dmInfo.setPlanCount(dl.getPlanCount());

                    //实到警察数
                    dmInfo.setRealCount(dl.getRealCount());

                    //实际到的服刑人数和警力人数


                    String jqmc = dl.getDeptName();
                    if (dmInfo.getValue() == 0) {
                        perc = "0%";
                        jlMap.put("name", "警力预警");
                        jlMap.put("info", jqmc + cxTime + "到" + nowTime + "警力预警");
                        jlMap.put("time", nowTime);
                        resList.add(jlMap);
                    } else {

                        String fx = dmInfo.getValue().toString();
                        String jl = dl.getRealCount().toString();
                        double percent = Float.parseFloat(jl) / Float.parseFloat(fx);

                        //获取格式化对象
                        NumberFormat nt = NumberFormat.getPercentInstance();

                        //设置百分数精确度2即保留两位小数
                        nt.setMinimumFractionDigits(2);
                        perc = nt.format(percent);


                        if (percent < 0.1) {
                            jlMap.put("name", "警力预警");
                            jlMap.put("info", jqmc + cxTime + "到" + nowTime + "警力预警");
                            jlMap.put("time", nowTime);
                            resList.add(jlMap);
                        }

                    }


                    //百分比
                    dmInfo.setPerc(perc);

                    dmList.add(dmInfo);
                }


            }
        }


        return resList;
    }


    public int getAreaNum() throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        //查询所有所有监区点名情况
        Object i = dao.findForObject("DianMingMapper.getAreaNum", null);
        return (Integer) i;
    }

    public int getAreaLog() throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        Map map = getCxTime();

        //切换到点名系统数据源
        //定义开始时间
        String cxTime = "";
        //定义结束时间
        String nowTime = "";
        //将时间进行格式化处理
        cxTime = map.get("cxTime").toString();
        nowTime = map.get("nowTime").toString();
        //定义查询参数
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        //实例化一个Map
        Map m = new HashMap();
        //给Map赋值
        m.put("params", params);
        Object i = dao.findForObject("DianMingMapper.getAreaLog", m);
        return (Integer) i;
    }

    @Transactional
    //实现系统前一小时所有点名总
    public Map getDmSum() throws Exception {
        /* 获取查询时间 */
        Map map = getCxTime();
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        String cxTime = "";
        String nowTime = "";
        cxTime = map.get("cxTime").toString();
        nowTime = map.get("nowTime").toString();
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        Map m = new HashMap();
        m.put("params", params);
        List yd = (List) dao.findForList("DianMingMapper.getDmYdNum", null);
        List sd = (List) dao.findForList("DianMingMapper.getsdSum", m);

        Map reqMap = new HashMap();
        reqMap.put("ydNum", yd.get(0) == null ? "0" : yd.get(0));
        reqMap.put("sdNum", sd.get(0) == null ? "0" : sd.get(0));
        int num = Integer.parseInt(String.valueOf(reqMap.get("ydNum"))) - Integer.parseInt(String.valueOf(reqMap.get("sdNum")));
        reqMap.put("wdNum", num + "");

        return reqMap;
    }


    @Transactional
    //查询汇总时间的方法
    public Map getHzsj() {
        Map reqmap = new HashMap();
        Integer pdsj = Integer.parseInt(sjjg);
        if (pdsj == 999) {
            reqmap.put("stTime", "2017-03-09 10:00:00");
            reqmap.put("endTime", "2017-03-09 11:00:00");
        } else {
//            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
//            Date date = new Date();
//            Calendar calendar = Calendar.getInstance();
//            calendar.setTime(date);
//            calendar.add(Calendar.DAY_OF_MONTH, -1);
//            date = calendar.getTime();
//            String endTime = f.format(date);
//            System.out.print(endTime);
//            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);
//            date = calendar.getTime();
//            String stTime = f.format(date);
//            System.out.println("提前一小时 的时间是：" + stTime);
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
            System.out.println("一个小时前的时间：" + df.format(calendar.getTime()));
            String stTime=df.format(calendar.getTime());
            System.out.println("当前的时间：" + df.format(new Date()));
            String endTime= df.format(new Date());

            reqmap.put("stTime", stTime);
            reqmap.put("endTime", endTime);
        }

        return reqmap;

    }

    //获取所有监区监控信息
    public List getAllJkInfo(Map reqMap) throws Exception {

        Map map = getCxTime();

        Map resMap = new HashMap();
        //切换到点名系统数据源
        DataSourceTypeManager.set(DataSources.ZKESERVER);
//定义开始时间
        String cxTime = "";
        //定义结束时间
        String nowTime = "";
        //将时间进行格式化处理
        cxTime = map.get("cxTime").toString();
        nowTime = map.get("nowTime").toString();
        //定义查询参数
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        //实例化一个Map
        Map m = new HashMap();
        //给Map赋值
        m.put("params", params);

        //查询所有所有监区点名情况
        List dianMingList = (List) dao.findForList("DianMingMapper.getAllDianMingInfo", m);

        //获取警力分布情况
        List jlList = deptJLService.getDeptZBAndHeadZBInfo();

//        Map zzbrMap = (Map) jlMap.get("HQZB");

//        String zzbr = (String) zzbrMap.get("zbname");

        List dmList = new ArrayList();


        //将警力部署和点名相结合
        for (int i = 0; i < dianMingList.size(); i++) {

            DMinfo dmInfo = (DMinfo) dianMingList.get(i);
            for (int j = 0; j < jlList.size(); j++) {
                DeptJL dl = (DeptJL) jlList.get(j);
                String perc;
                if (dmInfo.getName().equals(dl.getDeptName())) {

                    //因到警察数
                    dmInfo.setPlanCount(dl.getPlanCount());

                    //实到警察数
                    dmInfo.setRealCount(dl.getRealCount());

                    dmInfo.setCaption(dl.getZbname());
                    dmInfo.setPerc(dl.getTypeName());
                    dmInfo.setXh(dl.getZbtel());

                    //实际到的服刑人数和警力人数


                    dmList.add(dmInfo);
                }


            }
        }

        return dianMingList;


    }

    public List getAllDianMingReduceInfo(Map reqMap) throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);
        //实例化一个List用来存放结果集
        List resList = new ArrayList();
        String cxTime = reqMap.get("stTime").toString();
        String nowTime = reqMap.get("endTime").toString();
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        Map param = new HashMap();
        param.put("params", params);
        List dianMingList = (List) dao.findForList("DianMingMapper.getAllDMInfo", param);

        SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date cxDate = sformat.parse(cxTime);
        Date now = sformat.parse(nowTime);
        Calendar calNow = Calendar.getInstance();
        calNow.setTime(now);
        SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        //获取警力分布情况
        List jlList = deptJLService.getHistoryTjDeptJl(reqMap);

        //查询所有监区点名情况
        List dmList = new ArrayList();
        for (Object object : dianMingList) {
            Map resMap = new HashMap();
            DMinfo dmInfo = (DMinfo) object;
            String fx = dmInfo.getValue().toString();
            String jqmc = dmInfo.getName();
            if (fx != null && fx.equals("0")) {
                resMap.put("name", "点名预警");
                resMap.put("info", jqmc + dformat.format(cxDate) + "到" +
                        calNow.get(Calendar.HOUR_OF_DAY) + ":" + calNow.get(Calendar.MINUTE) + "未按要求点名");
                resMap.put("time", nowTime);
                resList.add(resMap);
            }
            for (Object jlOb : jlList) {
                DeptJL dl = (DeptJL) jlOb;
                String perc;
                if (dmInfo.getName().equals(dl.getDeptName())) {
                    Map jlMap = new HashMap();
                    //因到警察数
                    dmInfo.setPlanCount(dl.getPlanCount());

                    //实到警察数
                    dmInfo.setRealCount(dl.getRealCount());

                    //实际到的服刑人数和警力人数
                    String deptName = dl.getDeptName();
                    if (dmInfo.getValue() == 0) {
                        perc = "0%";
                        jlMap.put("name", "警力预警");
                        jlMap.put("info", deptName + dformat.format(cxDate) + "到"
                                + calNow.get(Calendar.HOUR_OF_DAY) + ":" + calNow.get(Calendar.MINUTE) + "警力预警");
                        jlMap.put("time", nowTime);
                        resList.add(jlMap);
                    } else {
                        double percent = dl.getRealCount() / dmInfo.getValue();

                        //获取格式化对象
                        NumberFormat nt = NumberFormat.getPercentInstance();
                        //设置百分数精确度2即保留两位小数
                        nt.setMinimumFractionDigits(2);
                        perc = nt.format(percent);

                        if (percent < 0.1) {
                            jlMap.put("name", "警力预警");
                            jlMap.put("info", deptName + dformat.format(cxDate) + "到" + calNow.get(Calendar.HOUR_OF_DAY) + "警力预警");
                            jlMap.put("time", nowTime);
                            resList.add(jlMap);
                        }
                    }
                    //百分比
                    dmInfo.setPerc(perc);
                    dmList.add(dmInfo);
                }
            }
        }

        return resList;
    }

    public List getJQPCGCount(Map reqMap) throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);

        String cxTime = reqMap.get("stTime").toString();
        String nowTime = reqMap.get("endTime").toString();
        String params = " AND endtime >='" + cxTime + "' AND endtime <='" + nowTime + "'";
        Map param = new HashMap();
        param.put("params", params);

        List realList = (List) dao.findForList("DianMingMapper.getJQRealCGPcount", param);

        return realList;
    }

    public List getPCountByArea(Map reqMap) throws Exception {
        DataSourceTypeManager.set(DataSources.ZKESERVER);

        List realList = (List) dao.findForList("DianMingMapper.getPCountByArea", null);

        return realList;
    }

    @Transactional
    //查询时间的方法
    public Map getCxTime() {
        Map map = new HashMap();
        Integer sj = Integer.parseInt(fxsxsj);
        Integer pdsj = Integer.parseInt(sjjg);
        if (pdsj == 999) {
            map.put("cxTime", "2017-03-09 10:00:00.540");
            map.put("nowTime", "2017-03-09 11:00:00.540");
        } else {
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - sj);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
            map.put("cxTime", df.format(calendar.getTime()));
            map.put("nowTime", df.format(new Date()));


        }

        return map;

    }


}