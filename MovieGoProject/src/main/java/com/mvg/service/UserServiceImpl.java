package com.mvg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.UserDao;
import com.mvg.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public int getUserCntService() {
		int result = dao.getUserCount();
		return result;
	}

	@Override
	public int insertUserService(User user) {
		int result = dao.insertUser(user);
		return result;
	}

}
