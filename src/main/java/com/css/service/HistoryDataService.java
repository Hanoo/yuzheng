package com.css.service;

import com.css.entity.Jingli;

import java.util.List;

public interface HistoryDataService {
    boolean saveJingli(List<Jingli> data) throws Exception;
}
