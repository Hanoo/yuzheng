package com.css.util;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * JSON解析工具类 <br>
 * Information:
 * <p>
 * <b>Package Name&nbsp;:</b> com.css.sword.platform.web.mvc.util.json<br>
 * <b>File Name&nbsp;&nbsp;&nbsp;&nbsp;:</b> JSON.java<br>
 * Generate : 2009-7-1<br>
 * Copyright &copy; 2009 CS&S All Rights Reserved.<br>
 * </p>
 *
 * @author WJL <br>
 * @since Sword 4.0.0<br>
 */
public class JSON {


    public static Map getJsonObject(String obj) {
        ObjectMapper mapper = JacksonJsonMapper.getInstance();
        Map<String, Object> result = new HashMap();
        try {
            if(obj != null)
                result = mapper.readValue(obj, Map.class);
        } catch(IOException e) {
            throw new RuntimeException("getJsonObject字符串解析出错！",e);
        }
        return result;

    }

    public static List getJsonList(String obj) {
        ObjectMapper mapper = JacksonJsonMapper.getInstance();
        List result = null;
        try {
            if(obj != null)
                result = mapper.readValue(obj, List.class);
        } catch(IOException e) {
            throw new RuntimeException("getJsonObject字符串解析出错！",e);
        }
        return result;

    }

    public static Object getJsonObjectValue(Object jsonObject, Object key) {
        return ((Map) jsonObject).get(key);
    }

    public static String mapToJson(Map<String, Object> map) {
        try {
            return JacksonJsonMapper.getInstance().writeValueAsString(map);
        } catch(IOException e) {
            throw new RuntimeException("JSON字符串解析出错！",e);
        }
    }


    public static String listToJson(List list) {
        try {
            return JacksonJsonMapper.getInstance().writeValueAsString(list);
        } catch(IOException e) {
            throw new RuntimeException("JSON字符串解析出错！");
        }
    }


}
