package com.csi.service.impl;

import com.csi.mapper.LoginMapper;
import com.csi.pojo.Login;
import com.csi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Service("LoginMapper")
@Transactional
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public Login findByName(String name, String password) {
        return loginMapper.findByName(name, password);
    }
}
