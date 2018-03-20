package com.css.util;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.PropertyUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.Enumeration;

/**
 * Created by wang on 6/21 0021.
 * form表单数据封装成javaBean
 */
public class ParseHtml {

    /**
     *
     * @param request
     * @param bean
     * @return
     */
    public Object parseRequest(HttpServletRequest request,Object bean){
        Enumeration enumeration = request.getParameterNames();

        while(enumeration.hasMoreElements()){
            Object obj = enumeration.nextElement();
            try {
                Class cls = PropertyUtils.getPropertyType(bean,obj.toString());
                Object beanValue = ConvertUtils.convert(request.getParameter(obj.toString()),cls);
                PropertyUtils.setProperty(bean,obj.toString(),beanValue);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }

        return  bean;
    }
}
