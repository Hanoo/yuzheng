package com.css.service;

import com.css.dao.DAO;
import com.css.datasource.DataSourceTypeManager;
import com.css.datasource.DataSources;
import com.css.entity.DeptJL;
import com.css.entity.EmpInfo;
import com.css.entity.ZhiBan;
import com.css.util.JSON;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by wugaofeng on 4/20 0020.
 */
@Service("deptJLService")
public class DeptJLServiceImpl implements DeptJLService {

    @Resource
    private DAO dao;

    @Value("${sjjg}")
    private String sjjg;//是否启用配置的时间间隔

    @Value("${jlsxsj}")
    private String jlsxsj;//警力刷新时间间隔

  /*
  获取部门应到人数
  例如：{DeptID=31, DeptNo='0031', DeptName='一监区', EmpCount=18}
  */
    public List<DeptJL> getYDDeptJLCount() throws Exception {
        //获取数据源
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数
        Map map = new HashMap();
        //map.put("params"," AND 1=1");//可自定义条件 加入人员类型限制
        map.put("params"," AND yingdao.DeptType=1 ORDER BY yingdao.DeptID");//可自定义条件 加入部门类型限制

        List deptJLlList =(List) dao.findForList("DeptJLMapper.getYDDeptJLCount",map);

        return deptJLlList;
    }

    public List<DeptJL> getYDDeptJLCountHJ() throws Exception {
        //获取数据源
        DataSourceTypeManager.set(DataSources.IMSDB);
       /* //设置sql时间段参数
        String startTime = "";
        String endTime = "";
        Map map = new HashMap();
        if(sjjg!=null && sjjg.equals("999")){
            //map.put("startTime","2017-03-09 08:00:00");
            //map.put("endTime","2017-03-10 22:15:25");
            startTime = "2017-03-09 08:00:00";
            endTime = "2017-03-10 22:15:25";
        }else{
            Map m = getSETime(jlsxsj);
            startTime = m.get("startTime").toString();
            endTime = m.get("endTime").toString();
        }*/

        //设置sql参数
        Map map = new HashMap();
        //map.put("params"," AND 1=1");//可自定义条件 加入人员类型限制
        map.put("params"," AND 1=1");//可自定义条件 加入部门类型限制

        List deptJLlList =(List) dao.findForList("DeptJLMapper.getYDDeptJLCountHJ",map);

        return deptJLlList;
    }

    /*获取未到人员列表*/
    public List<EmpInfo> getAbsentEmpList(String deptId) throws Exception {
        //获取数据源
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数
        Map map = new HashMap();

        map.put("params"," AND DeptID=" + deptId +" AND IoDoorB=0");

        List empInfoList =(List) dao.findForList("DeptJLMapper.getEmpIoList",map);

//

        return empInfoList;

    }

    /*获取出勤人员列表*/
    public List<EmpInfo> getWorkEmpList(String deptId) throws Exception {
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数
        Map map = new HashMap();

        map.put("params"," AND DeptID=" + deptId +" AND IoDoorB=1");

        List empInfoList =(List) dao.findForList("DeptJLMapper.getEmpIoList",map);

        return empInfoList;
    }

    /*获取未出勤人员列表 根据部门名称*/
    public List<EmpInfo> getAbsentEmpListByDeptName(String deptName) throws Exception {
        //获取数据源
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数
        Map map = new HashMap();

        map.put("params"," AND DeptType=1 AND DeptName LIKE '" + deptName.trim() +"' AND IoDoorB=0");

        List empInfoList =(List) dao.findForList("DeptJLMapper.getEmpIoList",map);


        return empInfoList;
    }

    /*获取出勤人员列表 根据部门名称*/
    public List<EmpInfo> getWorkEmpListByDeptName(String deptName) throws Exception {
        //获取数据源
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数
        Map map = new HashMap();

        map.put("params"," AND DeptType=1 AND DeptName LIKE '" + deptName.trim() +"' AND IoDoorB=1");

        List empInfoList =(List) dao.findForList("DeptJLMapper.getEmpIoList",map);


        return empInfoList;
    }

    public List<DeptJL> getEmpTypeHJList() throws Exception {
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数

        List <DeptJL> empTypeHJList =(List) dao.findForList("DeptJLMapper.getEmpTypeHJ",null);

        return empTypeHJList;
    }

    //查询时间的方法
    public Map getSETime(String s) {
        Map map = new HashMap();
        if(s!=null && s.equals("0.5")){

            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
            String hehe = dateFormat.format(now);

            Calendar c = Calendar.getInstance();//可以对每个时间域单独修改

            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH)+1;
            int date = c.get(Calendar.DATE);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int minute = c.get(Calendar.MINUTE);
            int second = c.get(Calendar.SECOND);
           // System.out.println(year + "/" + month + "/" + date + " " + hour + ":" + minute + ":" + second);

            String Starttime = "A";
            String Endtime = "B";
            if (0 <= minute && minute <= 29) {
                int shour = hour - 1;
                String sminute = "30";
                String eminute = "00";
                String secondstr = "00";
                Starttime = (year + "-" + month + "-" + date + " " + shour + ":" + sminute + ":" + secondstr);
                Endtime = (year + "-" + month + "-" + date + " " + hour + ":" + eminute + ":" + secondstr);
            } else if (30 <= minute && minute <= 59) {

                String sminute = "00";
                String eminute = "30";
                String secondstr = "00";
                Starttime = (year + "-" + month + "-" + date + " " + hour + ":" + sminute + ":" + secondstr);
                Endtime = (year + "-" + month + "-" + date + " " + hour + ":" + eminute + ":" + secondstr);
            }


            map.put("startTime", Starttime);
            map.put("endTime", Endtime);

        }else{
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - Integer.parseInt(s));
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");

            map.put("startTime", df.format(calendar.getTime()));
            map.put("endTime", df.format(new Date()));
        }

        return map;

    }

    /*按小时导出前一天统计数据*/
    public List<DeptJL> getYesterdayTjData() throws Exception {
        DataSourceTypeManager.set(DataSources.IMSDB);

        //设置sql参数

        List <DeptJL> list =(List) dao.findForList("DeptJLMapper.getYesterdayTjData",null);

        return list;
    }

    /*根据历史时间统计各部门当时进出情况*/
    public List<DeptJL> getHistoryTjDeptJl(Map map) throws Exception {

            DataSourceTypeManager.set(DataSources.IMSDB);
            //map.put("endTime","2017-07-27 13:59:59");
            String endTime = (String)map.get("endTime");
            Map params = new HashMap();
            params.put("params"," AND opptime<='" + endTime + "'");
            List <DeptJL> list =(List) dao.findForList("DeptJLMapper.getHistoryTjDeptJl",params);

            return list;

    }

    /*获取各监区值班以及总值班情况*/
    public List<DeptJL> getDeptZBAndHeadZBInfo() throws Exception {
        DataSourceTypeManager.set(DataSources.IMSDB);
        //map.put("endTime","2017-07-27 13:59:59");
        //String endTime = (String)map.get("endTime");
        Map params = new HashMap();
        params.put("params"," AND 1=1");
        //各监区值班以及总值班情况
        List <ZhiBan> zbList =(List) dao.findForList("DeptJLMapper.getDeptZBInfo",params);
        //各监区出勤情况
        List<DeptJL> deptJLList = getYDDeptJLCount();

        //Map<String,Object> map = new HashMap<String, Object>();

        List<DeptJL> deptZBList = new ArrayList<DeptJL>();

        for(ZhiBan zb: zbList){

            if(zb.getAid()==null||zb.getAid().equals("")||zb.getZbflag().equals("2")){
                //Map mapHead = (Map) zb;
                //mapHead.put("",zb.getAid())
                DeptJL dept1 = new DeptJL();
                dept1.setTypeName(zb.getZbname());
                dept1.setZbtel(zb.getZbtel());
               // deptZBList.add(dept1);
                deptZBList.add(0,dept1);
                continue;
            }

            for(DeptJL dept: deptJLList){
                if(zb.getAid().equals(dept.getDeptID().toString())){
                    dept.setZbname(zb.getZbname());
                    dept.setZbflag(zb.getZbflag());
                    dept.setZbtel(zb.getZbtel());
                    dept.setZbtemp1(zb.getZbtemp1());
                    dept.setZbtemp2(zb.getZbtemp2());
                    deptZBList.add(dept);
                    break;
                }
            }

        }

        //map.put("DEPTZB",deptZBList);
        return deptZBList;
    }
}
