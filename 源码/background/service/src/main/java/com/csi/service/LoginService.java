package com.csi.service;

import com.csi.pojo.Login;

import java.util.Map;

public interface LoginService {

    Login findByName(String name, String password);
}
