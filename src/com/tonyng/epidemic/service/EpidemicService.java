package com.tonyng.epidemic.service;

import com.tonyng.epidemic.beans.DailyEpidemicInfo;
import com.tonyng.epidemic.beans.ProvinceInfo;

import java.util.List;


public interface EpidemicService {
    /**
     * 保存当日疫情数据，返回还没录入数据的省份列表
     * @param dailyEpidemicInfo
     * @return
     */
    List<ProvinceInfo> saveData(DailyEpidemicInfo dailyEpidemicInfo, Integer userId);
}
