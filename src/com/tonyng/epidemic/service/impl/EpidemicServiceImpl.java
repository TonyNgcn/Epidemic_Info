package com.tonyng.epidemic.service.impl;

import com.tonyng.epidemic.beans.DailyEpidemicInfo;
import com.tonyng.epidemic.beans.EpidemicInfo;
import com.tonyng.epidemic.beans.ProvinceInfo;
import com.tonyng.epidemic.mapper.EpidemicMapper;
import com.tonyng.epidemic.mapper.ProvinceMapper;
import com.tonyng.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.beans.DefaultPersistenceDelegate;
import java.util.Date;
import java.util.List;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicMapper epidemicMapper;
    @Autowired
    private ProvinceMapper provinceMapper;
    @Override
    public List<ProvinceInfo> saveData(DailyEpidemicInfo dailyEpidemicInfo, Integer userId) {
        //获取数据的日期
        String[] ymd=dailyEpidemicInfo.getDate().split("-");
        short year=0,month=0,day=0;
        year=Short.parseShort(ymd[0]);
        month=Short.parseShort(ymd[1]);
        day=Short.parseShort(ymd[2]);
        for(EpidemicInfo epidemicInfo:dailyEpidemicInfo.getArray()){
            //设置录入数据人员编号
            epidemicInfo.setUserId(userId);
            //设置录入数据日期
            epidemicInfo.setInputDate(new Date());
            //设置当前疫情数据的日期
            epidemicInfo.setDataYear(year);
            epidemicInfo.setDataMonth(month);
            epidemicInfo.setDataDay(day);
            //用mapper写入数据库
            epidemicMapper.saveInfo(epidemicInfo);
        }
        //继续用ProvinceMapper找当日未录入数据的省份
        List<ProvinceInfo> provinceInfos=provinceMapper.findNoDataProvinces(year,month,day);
        return provinceInfos;
    }
}
