package com.gym.ssm.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gym.ssm.base.PageBean;
import com.gym.ssm.entity.vip;
import com.gym.ssm.service.vipBiz;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @authorリバティの風
 * @site
 * @company
 * @create 2019-02-26-21:20
 */
@Controller

@RequestMapping("/vip")
public class vipController {
    @Autowired
    private vipBiz vipBiz;

    /**
     * 会员个人信息
     * @param request
     * @param hid
     * @return
     */
    @RequestMapping("/vip/{hid}")
    public String vipselectbyid(HttpServletRequest request,@PathVariable(value = "hid") Integer hid){
//        hid=Integer.parseInt(request.getParameter("hid"));
        vip vipselectbyhid = vipBiz.vipselectbyhid(1);
        request.setAttribute("vipselectbyhid",vipselectbyhid);
        System.out.println(vipselectbyhid);
        return "vip";
    }

    /**
     * 修改头像
     * @param request
     * @param xxx
     * @return
     */
    @RequestMapping("/upload")
    public String up(HttpServletRequest request, MultipartFile xxx) {
        try {
            FileUtils.copyInputStreamToFile(xxx.getInputStream(), new File("D://3/" + xxx.getOriginalFilename()));

        } catch (IOException e) {
            e.printStackTrace();
        }
        vip v=new vip();
        v.setHid(Integer.parseInt(request.getParameter("hid")));
        v.setImg(xxx.getOriginalFilename());
        vipBiz.uploadimg(v);
       return "redirect:/vip/vip";
    }

    /**
     * 修改会员个人信息
     * @param request
     * @param vip
     * @return
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request,vip vip){
        vipBiz.update(vip);
        return "redirect:/vip/vip";
    }

    @RequestMapping("/mycum")
    @ResponseBody
    public Map<Object,Object> mycum(HttpServletRequest request,vip vip){
        PageBean pageBea = new PageBean();
        pageBea.setPageBean(request);
        //前段传过来的page和limit的值  放入到pagehelper中
        Page<Object> objects = PageHelper.startPage(pageBea.getPage(), pageBea.getRows());
        vip.setHid(1);
        List<Map> listcum = vipBiz.listcum(vip);
        PageInfo pageInfo = new PageInfo(listcum);
        Map<Object,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg", "");
        map.put("count",pageInfo.getTotal());
        map.put("data",pageInfo.getList());
        return map;
    }
}