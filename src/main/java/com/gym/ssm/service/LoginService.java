package com.gym.ssm.service;

import com.gym.ssm.entity.peng.Admin;
import com.gym.ssm.entity.peng.Coach;
import com.gym.ssm.entity.vip;

import java.util.Map;

/**
 * @ProjectNmae:GYM03
 * @ClassName:UserService
 * @Description: TOOO
 * @Author:peng
 * @Date:2019/2/25 19:27
 * @Version:1.0
 */

public interface LoginService {


    Admin adminLogin(String name, String pword);

      vip vipLogin(String name, String pword);

    Coach coachLogin(String name, String pword);

}