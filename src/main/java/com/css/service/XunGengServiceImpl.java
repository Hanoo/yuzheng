package com.css.service;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.XunGeng;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by July on 2017/4/24.
 */

@Service("xunGengService")
public class XunGengServiceImpl implements XunGengService {
    @Resource
    private DAO dao;

    @Value("${xgsxsj}")
    private String xgsxsj;

    @Value("${sjjg}")
    private String sjjg;


    public List<XunGeng> getXunGengInfo() throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);
        Map map = new HashMap();
        String startTime = "";
        String endTime = "";
        if (sjjg != null && sjjg.equals("999")) {

//            map.put("startTime", "2016-07-13 22:00:00");
//            map.put("endTime", "2016-07-13 22:30:00");
            startTime = "2017-07-09 03:00:00";
            endTime = "2017-07-09 03:30:00";

        } else {
            Map m = getSETime(xgsxsj);
//            map.put("startTime",m.get("startTime"));
//            map.put("endTime",m.get("endTime"));
            startTime = m.get("startTime").toString();
            endTime = m.get("endTime").toString();
        }

        String params = " AND Log.LogDate >= CONVERT(datetime,'" + startTime + "',20) AND Log.LogDate <= CONVERT(datetime,'" + endTime + "',20) ";
        map.put("params", params);

        List xunGengList = (List) dao.findForList("XunGeng.getXunGengInfo", map);

        return xunGengList;
    }

    public List<XunGeng> getXGfenxiInfo() throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);

        Map map = new HashMap();
        String startTime = "";
        String endTime = "";

        if (sjjg != null && sjjg.equals("999")) {

//            map.put("startTime", "2016-07-13 22:00:00");
//            map.put("endTime", "2016-07-13 22:30:00");
            startTime = "2016-07-13 22:00:00";
            endTime = "2016-07-13 22:30:00";

        } else {
//            Map m =   getSETime(xgsxsj);
            Map m = getSETime2();
//            map.put("startTime",m.get("startTime"));
//            map.put("endTime",m.get("endTime"));
            startTime = m.get("startTime").toString();
            endTime = m.get("endTime").toString();
        }

        String params = " AND Log.LogDate >= CONVERT(datetime,'" + startTime + "',20) AND Log.LogDate <= CONVERT(datetime,'" + endTime + "',20) ";
        map.put("params", params);

        List xgfenxiList = (List) dao.findForList("XunGeng.getXGfenxiInfo", map);

        return xgfenxiList;

    }

    public Map getXgsj() {
        Map m = getSETime(xgsxsj);
//        Map m = null;
//        try {
//            m = getSETime2();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return m;
    }

    //查询时间的方法
    public Map getSETime(String s) {
        Map map = new HashMap();
        String startTime = "";
        String endTime = "";
        String Stime = "";
        String Etime = "";
        if (s != null && s.equals("0.5")) {

            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);
            System.out.println(hehe);
            Calendar c = Calendar.getInstance();//可以对每个时间域单独修改

            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH) + 1;
            int date = c.get(Calendar.DATE);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int minute = c.get(Calendar.MINUTE);
            int second = c.get(Calendar.SECOND);
//            System.out.println(year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second);

            String Starttime = "A";
            String Endtime = "B";

            if (0 <= minute && minute <= 29) {

                int shour = hour - 1;
                String sminute = "30";
                String eminute = "00";
                String secondstr = "00";
                Starttime = (year + "-" + month + "-" + date + " " + shour + ":" + sminute + ":" + secondstr);
                Endtime = (year + "-" + month + "-" + date + " " + hour + ":" + eminute + ":" + secondstr);
                Stime = (shour + ":" + sminute);
                Etime = (hour + ":" + eminute);
            } else if (30 <= minute && minute <= 59) {

                String sminute = "00";
                String eminute = "30";
                String secondstr = "00";
                Starttime = (year + "-" + month + "-" + date + " " + hour + ":" + sminute + ":" + secondstr);
                Endtime = (year + "-" + month + "-" + date + " " + hour + ":" + eminute + ":" + secondstr);
                Stime = (hour + ":" + sminute);
                Etime = (hour + ":" + eminute);
            }
            //map.put("startTime", Starttime);
            //  map.put("endTime", Endtime);
            startTime = Starttime;
            endTime = Endtime;
            //System.out.println(Starttime);
            // System.out.println(Endtime);
        } else {
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - Integer.parseInt(s));
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");

            //map.put("startTime", df.format(calendar.getTime()));
            // map.put("endTime", df.format(new Date()));

            SimpleDateFormat df1 = new SimpleDateFormat("HH:00");
            Stime = df1.format(calendar.getTime());

            Etime = df1.format(new Date());
            startTime = df.format(calendar.getTime());
            endTime = df.format(new Date());

        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");//可以方便地修改日期格式

        map.put("startTime", startTime);
        map.put("endTime", endTime);
        map.put("startHHMM", Stime);
        map.put("endHHMM", Etime);
        //  map.put("kstime" ,)
        return map;

    }

    //查询时间的方法
    public Map getSETime2() throws Exception {
        HashMap map = new HashMap();
        HashMap resmap = new HashMap();
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String time = dateFormat.format(now);
//        String time="2017-3-10";
        String startTime = time + " 00:00:00";
        String endTime = time + " 23:59:59";
        String params = " AND Log.LogDate >= CONVERT(datetime,'" + startTime + "',20) AND Log.LogDate <= CONVERT(datetime,'" + endTime + "',20) ";
        map.put("params", params);

        List xgTimeList = (List) dao.findForList("XunGeng.getXGfenxiToday", map);
        if (xgTimeList.size() > 0) {
            XunGeng xungeng = (XunGeng) xgTimeList.get(0);
            Date lateTime = xungeng.getLogDate();
            Long currenTime = lateTime.getTime();
            Long earlyTime = currenTime - 30 * 60 * 1000;
            Date d = new Date(earlyTime);
            Date d2 = new Date(currenTime);
            SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            startTime = dateFormat2.format(d);
            endTime = dateFormat2.format(d2);

            resmap.put("startTime", startTime);
            resmap.put("endTime", endTime);
//            long curren = System.currentTimeMillis();
//            curren += 30 * 60 * 1000;
        }

//        Map map = new HashMap();
//        String startTime="";
//        String endTime="";
//        String Stime = "";
//        String Etime="";
//        if(s!=null && s.equals("0.5")){
//
//            Date now = new Date();
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
//            String hehe = dateFormat.format(now);
//            System.out.println(hehe);
//            Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
//
//            int year = c.get(Calendar.YEAR);
//            int month = c.get(Calendar.MONTH)+1;
//            int date = c.get(Calendar.DATE);
//            int hour = c.get(Calendar.HOUR_OF_DAY);
//            int minute = c.get(Calendar.MINUTE);
//            int second = c.get(Calendar.SECOND);
////            System.out.println(year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second);
//
//            String Starttime = "A";
//            String Endtime = "B";
//
//            if ( 0<=minute &&  minute<=29 ){
//
//                int shour = hour -1 ;
//                String sminute = "30";
//                String eminute = "00";
//                String secondstr="00";
//                Starttime = (year + "-" + month + "-" + date + " " +shour + ":" +sminute + ":" + secondstr);
//                Endtime = (year + "-" + month + "-" + date + " " +hour + ":" +eminute + ":" + secondstr);
//                Stime = (shour + ":" +sminute);
//                Etime = (hour + ":" +eminute);
//            }else if (30<=minute &&  minute<=59){
//
//                String sminute = "00";
//                String eminute = "30";
//                String secondstr="00";
//                Starttime = (year + "-" + month + "-" + date + " " +hour + ":" +sminute + ":" + secondstr);
//                Endtime = (year + "-" + month + "-" + date + " " +hour + ":" +eminute + ":" + secondstr);
//                Stime = (hour + ":" +sminute);
//                Etime = (hour + ":" +eminute);
//            }
//            //map.put("startTime", Starttime);
//            //  map.put("endTime", Endtime);
//            startTime=Starttime;
//            endTime=Endtime;
//            //System.out.println(Starttime);
//            // System.out.println(Endtime);
//        }else{
//            Calendar calendar = Calendar.getInstance();
//            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - Integer.parseInt(s));
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");
//
//            //map.put("startTime", df.format(calendar.getTime()));
//            // map.put("endTime", df.format(new Date()));
//
//            SimpleDateFormat df1 = new SimpleDateFormat("HH:00:");
//            Stime = df1.format(calendar.getTime());;
//            Etime=df1.format(new Date());
//            startTime=df.format(calendar.getTime());
//            endTime=df.format(new Date());
//
//        }
//
//        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:");//可以方便地修改日期格式
//
//        map.put("startTime", startTime);
//        map.put("endTime", endTime);
//        map.put("startHHMM",Stime);
//        map.put("endHHMM",Etime);
        //  map.put("kstime" ,)


        return resmap;

    }

    public Map getHHMM() {
        Map m = getSETime(xgsxsj);
        Map map = new HashMap();
        map.put("startHHMM", m.get("startHHMM"));
        map.put("endHHMM", m.get("endHHMM"));
        return map;
    }


//统计前一天各个巡更点的巡更次数

    public List<XunGeng> getXGtongjiInfo() throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);
        Date date = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        date = calendar.getTime();

        String strdate = "";
        String enddate = "";

        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd 00:00:00");//可以方便地修改日期格式
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");//可以方便地修改日期格式

        strdate = dateFormat1.format( date );
        enddate = dateFormat2.format( date );

//        //测试数据 写死
//        strdate = "2016-07-13 00:00:00";
//        enddate = "2016-07-13 23:59:59";

        Map map = new HashMap();

        map.put("strdate",strdate);
        map.put("enddate",enddate);

        List XGtongjiList = (List) dao.findForList("XunGeng.XGtongjiMap", map);

        return XGtongjiList;
    }

    public List<XunGeng> getWXGtongjiInfo(Map map) throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);
        Map map1 = new HashMap();
        String stTime = (String) map.get("stTime");
        String endTime = (String) map.get("endTime");

        //测试 写死
//        String stTime = "2016-07-13 22:00:00";
//        String endTime = "2016-07-13 23:00:00";

        SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:30:00");//可以方便地修改日期格式 ？
        Date date = dateFormat3.parse(stTime);
        String zjTime = dateFormat1.format(date);
        map1.put("strdate",stTime);
        map1.put("enddate",zjTime);



        List<XunGeng> WXGtongjiList1 = (List) dao.findForList("XunGeng.WXGtongjiMap", map1);


        String AddrID ="";
        String AddrName ="";
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
        String hehe = dateFormat.format( now );
        List newList = new ArrayList();
        for (int i = 0;i<WXGtongjiList1.size();i++){
            Map m2 = new HashMap();
            XunGeng xunGeng = WXGtongjiList1.get(i);

            AddrName = xunGeng.getAddrName();
            m2.put("name","巡更异常");
            m2.put("info",AddrName + stTime+"至"+zjTime +"时间段内未准时巡更" );
            m2.put("time",hehe);
            newList.add(m2);
        }
        Map map3 = new HashMap();

        map3.put("strdate",zjTime);
        map3.put("enddate",endTime);




        List<XunGeng> WXGtongjiList2 = (List) dao.findForList("XunGeng.WXGtongjiMap", map3);
        for (int i = 0;i<WXGtongjiList2.size();i++){
            Map m2 = new HashMap();
            XunGeng xunGeng = WXGtongjiList2.get(i);
            AddrName = xunGeng.getAddrName();
            m2.put("name","巡更统计");
            m2.put("info",AddrName + zjTime+"至"+endTime +"时间段内未准时巡更" );
            m2.put("time",hehe);
            newList.add(m2);
        }

        return newList;
    }

    public List<XunGeng> getWXGtongjiReduceInfo(Map map) throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);
        String stTime = (String) map.get("stTime");
        String endTime = (String) map.get("endTime");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = dateFormat.parse(stTime);
        Date ndTime = dateFormat.parse(endTime);
        SimpleDateFormat zjFormat = new SimpleDateFormat("yyyy-MM-dd HH:30:00");
        String zjTime = zjFormat.format(startTime);
        Date halfTime = dateFormat.parse(zjTime);

        // 页面展示的起止时间格式，减小长度以便页面显示
        SimpleDateFormat fstDisplayTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        SimpleDateFormat secDisplayTimeFormat = new SimpleDateFormat("HH:mm");

        // 查询前半小时的数据
        Map<String, String> fstHalfTime = new HashMap();
        fstHalfTime.put("strdate",stTime);
        fstHalfTime.put("enddate",zjTime);
        List<XunGeng> WXGtongjiList1 = (List) dao.findForList("XunGeng.WXGTongji", fstHalfTime);

        String AddrName = "";

        String nowToDis = dateFormat.format(new Date());
        List newList = new ArrayList();
        for (XunGeng xunGeng : WXGtongjiList1){
            Map item = new HashMap();
            AddrName = xunGeng.getAddrName();
            item.put("name","巡更异常");
            item.put("info",AddrName + fstDisplayTimeFormat.format(startTime)+"至"+secDisplayTimeFormat.format(halfTime) +"未准时巡更" );
            item.put("time",nowToDis);
            item.put("LogDate", stTime);
            item.put("RegDate", zjTime);
            item.put("AddrID", xunGeng.getAddrID());
            newList.add(item);
        }

        // 查询后半个小时的数据
        Map secHalfTime = new HashMap();
        secHalfTime.put("strdate",zjTime);
        secHalfTime.put("enddate",endTime);
        List<XunGeng> WXGtongjiList2 = (List) dao.findForList("XunGeng.WXGTongji", secHalfTime);
        for (XunGeng xunGeng : WXGtongjiList2){
            Map item = new HashMap();
            AddrName = xunGeng.getAddrName();
            item.put("name","巡更统计");
            item.put("info",AddrName + fstDisplayTimeFormat.format(halfTime) +"至"+secDisplayTimeFormat.format(ndTime) +"未准时巡更" );
            item.put("time",nowToDis);
            item.put("LogDate", zjTime);
            item.put("RegDate", endTime);
            item.put("AddrID", xunGeng.getAddrID());
            newList.add(item);
        }

        return newList;
    }

    public int insertManualXGInfo(Map xgInfo) throws Exception {
        Object result = dao.save("XunGeng.insertManualXGInfo", xgInfo);
        return (Integer) result;
    }

    public List<XunGeng> getXunGengHistory(String stTime, String endTime) throws Exception {
        DataSourceTypeManager.set(DataSources.EYFINGER);

        Map<String, String> map = new HashMap<String, String>();
        String params = " AND Log.LogDate >= CONVERT(datetime,'" + stTime + "',20) AND Log.LogDate <= CONVERT(datetime,'" + endTime + "',20) ";
        map.put("params", params);

        List xunGengList = (List) dao.findForList("XunGeng.getXunGengInfo", map);

        return xunGengList;
    }

}