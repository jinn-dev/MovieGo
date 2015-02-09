package com.mvg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public Integer getUserCntService() {
		int result = dao.getUserCount();
		return result;
	}

}
