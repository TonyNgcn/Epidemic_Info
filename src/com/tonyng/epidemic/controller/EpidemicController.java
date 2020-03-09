package com.tonyng.epidemic.controller;

import com.tonyng.epidemic.beans.AjaxResponseInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {

    private Logger logger=Logger.getLogger(EpidemicController.class);

    @PostMapping("/ajax/input")

    @ResponseBody
    public AjaxResponseInfo inputData(Model model){
        logger.debug(model);
        AjaxResponseInfo responseInfo=new AjaxResponseInfo();
        responseInfo.setCode(-1);
        responseInfo.setMsg("测试");
        return responseInfo;
    }
}
