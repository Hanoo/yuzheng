package com.css.service;

import com.css.entity.DMHistory;
import com.css.entity.Jingli;
import com.css.entity.XunGeng;

import java.util.List;

public interface HistoryDataService {
    boolean saveJingli(List<Jingli> data) throws Exception;

    boolean saveDMHistroy(List<DMHistory> datas) throws Exception;

    boolean saveXGHistory(List<XunGeng> datas) throws Exception;
}
