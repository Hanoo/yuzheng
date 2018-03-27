package com.css.util;

import java.util.UUID;

public class IdGen {

    /**
     *
     * @return 32位字母数字字符串
     */
    public static String getUUID(){
        String uuid = UUID.randomUUID().toString();
        return uuid.replaceAll("-","");
    }
}
