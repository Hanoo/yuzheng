package com.css;

import com.css.entity.DutyInfo;
import org.junit.Test;


import java.security.NoSuchAlgorithmException;
import java.util.Calendar;

import javax.crypto.SecretKeyFactory;
public class GenTest {

    @Test
    public void testJSON() {
        DutyInfo dutyInfo = new DutyInfo();
    }

    @Test
    public void testDate() {
        Calendar c = Calendar.getInstance();
        System.out.println(c.get(Calendar.HOUR_OF_DAY));
        System.out.println(c.get(Calendar.MINUTE));
        System.out.println(c.getTime());
        c.set(Calendar.HOUR_OF_DAY, c.get(Calendar.HOUR_OF_DAY)-1);
        System.out.println(c.getTime());
    }

}
