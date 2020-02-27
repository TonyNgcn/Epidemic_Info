package com.tonyng.epidemic.service;

import com.tonyng.epidemic.beans.UserInfo;

public interface UserService {
    /**
     * 根据用户账号获取用户信息
     *
     * @param account
     * @return 用户信息
     */
    UserInfo findByAccount(String account);
}
