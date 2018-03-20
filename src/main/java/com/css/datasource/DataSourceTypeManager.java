package com.css.datasource;

/**
 * Created by wang on 4/20 0020.
 */
public class DataSourceTypeManager {

    private static final ThreadLocal<DataSources> dataSourceTypes = new ThreadLocal<DataSources>(){
        @Override
        protected DataSources initialValue(){
            return DataSources.JIANYU;
        }
    };

    public static DataSources get(){
        return dataSourceTypes.get();
    }

    public static void set(DataSources dataSourceType){
        dataSourceTypes.set(dataSourceType);
    }

    public static void reset(){
        dataSourceTypes.set(DataSources.JIANYU);
    }

}
