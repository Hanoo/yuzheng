package com.css.util;

import java.util.HashMap;
import java.util.Map;

public class NationCodeMapping {
    private static Map<String, String> codeNameMap = new HashMap<String, String>();
    static {
        codeNameMap.put("01","汉族");
        codeNameMap.put("02","蒙古族");
        codeNameMap.put("03","回族");
        codeNameMap.put("04","藏族");
        codeNameMap.put("05","维吾尔族");
        codeNameMap.put("06","苗族");
        codeNameMap.put("07","彝族");
        codeNameMap.put("08","壮族");
        codeNameMap.put("09","布依族");
        codeNameMap.put("10","朝鲜族");
        codeNameMap.put("11","满族");
        codeNameMap.put("12","侗族");
        codeNameMap.put("13","瑶族");
        codeNameMap.put("14","白族");
        codeNameMap.put("15","土家族");
        codeNameMap.put("16","哈尼族");
        codeNameMap.put("17","哈萨克族");
        codeNameMap.put("18","傣族");
        codeNameMap.put("19","黎族");
        codeNameMap.put("20","僳僳族");
        codeNameMap.put("21","佤族");
        codeNameMap.put("22","畲族");
        codeNameMap.put("23","高山族");
        codeNameMap.put("24","拉祜族");
        codeNameMap.put("25","水族");
        codeNameMap.put("26","东乡族");
        codeNameMap.put("27","纳西族");
        codeNameMap.put("28","景颇族");
        codeNameMap.put("29","柯尔克孜族");
        codeNameMap.put("30","土族");
        codeNameMap.put("31","达斡尔族");
        codeNameMap.put("32","仫佬族");
        codeNameMap.put("33","羌族");
        codeNameMap.put("34","布朗族");
        codeNameMap.put("35","撒拉族");
        codeNameMap.put("36","毛难族");
        codeNameMap.put("37","仡佬族");
        codeNameMap.put("38","锡伯族");
        codeNameMap.put("39","阿昌族");
        codeNameMap.put("40","普米族");
        codeNameMap.put("41","塔吉克族");
        codeNameMap.put("42","怒族");
        codeNameMap.put("43","乌孜别克族");
        codeNameMap.put("44","俄罗斯族");
        codeNameMap.put("45","鄂温克族");
        codeNameMap.put("46","崩龙族");
        codeNameMap.put("47","保安族");
        codeNameMap.put("48","裕固族");
        codeNameMap.put("49","京族");
        codeNameMap.put("50","塔塔尔族");
        codeNameMap.put("51","独龙族");
        codeNameMap.put("52","鄂伦春族");
        codeNameMap.put("53","赫哲族");
        codeNameMap.put("54","门巴族");
        codeNameMap.put("55","珞巴族");
        codeNameMap.put("56","基诺族");
    }

    public static String getNameByCode(String code) {
        return codeNameMap.get(code);
    }
}
