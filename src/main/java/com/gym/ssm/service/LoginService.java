package com.gym.ssm.service;

import com.gym.ssm.entity.Vip;
import com.gym.ssm.entity.peng.Admin;
import com.gym.ssm.entity.peng.Coach;

import java.util.Map;

/**
 * @ProjectNmae:GYM03
 * @ClassName:UserService
 * @Description: TOOO
 * @Author:peng
 * @Date:2019/2/25 19:27
 * @Version:1.0
 */
/*
3.2
 */
public interface LoginService {


    Admin adminLogin(String name, String pword);

      Vip vipLogin(String name, String pword);

    Coach coachLogin(String name, String pword);

}
