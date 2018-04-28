package com.css;

import com.css.entity.DutyInfo;
import org.junit.Test;


import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKeyFactory;
public class GenTest {

    @Test
    public void testJSON() {
        DutyInfo dutyInfo = new DutyInfo();
    }

    @Test
    public void testDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Calendar timeInstance = Calendar.getInstance();
        timeInstance.set(Calendar.DAY_OF_MONTH, timeInstance.get(Calendar.DAY_OF_MONTH)-1);
        timeInstance.set(Calendar.HOUR_OF_DAY, 0);
        timeInstance.set(Calendar.MINUTE, 0);
        timeInstance.set(Calendar.SECOND, 0);
        String stTime = sdf.format(timeInstance.getTime());
        System.out.println(stTime);

        timeInstance.set(Calendar.HOUR_OF_DAY, 23);
        timeInstance.set(Calendar.MINUTE, 59);
        timeInstance.set(Calendar.SECOND, 59);
        String endTime = sdf.format(timeInstance.getTime());
        System.out.println(endTime);
    }

    @Test
    public void testCal() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(sdf.format(calendar.getTime()));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:00:00");

        //map.put("startTime", df.format(calendar.getTime()));
        // map.put("endTime", df.format(new Date()));

        SimpleDateFormat df1 = new SimpleDateFormat("HH:00");
        String Stime = df1.format(calendar.getTime());
        System.out.println(Stime);

        String Etime = df1.format(new Date());
        System.out.println(Etime);
        String startTime = df.format(calendar.getTime());
        System.out.println(startTime);
        String endTime = df.format(new Date());
        System.out.println(endTime);

        SimpleDateFormat sdfNoSec = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println(sdf.format(calendar.getTime()));
    }
}
