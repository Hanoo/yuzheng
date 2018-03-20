package com.css.util;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Created by wang on 4/24 0024.
 */
public class JacksonJsonMapper {

    static ObjectMapper objectMapper = null;

    public static ObjectMapper getInstance(){
        if (objectMapper ==null){
            synchronized (ObjectMapper.class){
                if (objectMapper==null){
                    objectMapper = new ObjectMapper();
                }
            }
        }
        return objectMapper;
    }
}
