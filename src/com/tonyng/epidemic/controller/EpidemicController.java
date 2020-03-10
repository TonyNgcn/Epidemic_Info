package com.tonyng.epidemic.controller;

import com.tonyng.epidemic.beans.*;
import com.tonyng.epidemic.service.EpidemicService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {

    private Logger logger=Logger.getLogger(EpidemicController.class);

    @Autowired
    private EpidemicService epidemicService;

    @PostMapping("/ajax/input")
    @ResponseBody
    public AjaxResponseInfo inputData(@RequestBody DailyEpidemicInfo dailyEpidemicInfo, Model model, HttpSession session){
        logger.debug(dailyEpidemicInfo);
        AjaxResponseInfo responseInfo=new AjaxResponseInfo();
        //从Session中取得当前登录用户的信息
        UserInfo user=(UserInfo)session.getAttribute("loginedUser");
        if(user==null){
            responseInfo.setCode(-2);
            responseInfo.setMsg("你还没有登录！");
        }else{
            //将用户信息写入疫情信息中
            //将输入的数据保存，返回为录入的省份列表
            List<ProvinceInfo> list=epidemicService.saveData(dailyEpidemicInfo,user.getUserId());
            responseInfo.setData(list);
            responseInfo.setMsg("success");
            responseInfo.setCode(0);
        }

        return responseInfo;
    }

    @GetMapping("/ajax/latestData")
    @ResponseBody
    public AjaxResponseInfo findLatestData(){
        AjaxResponseInfo responseInfo=new AjaxResponseInfo();

        List<EpidemicDetailInfo> list=epidemicService.findLatestData();

        responseInfo.setData(list);
        responseInfo.setCode(0);
        responseInfo.setMsg("success");

        return responseInfo;
    }


}
