package com.mvg.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.UserDao;
import com.mvg.entity.User;

@Service
public class UserServiceImpl implements UserService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserServiceImpl.class);
	}
	@Autowired
	UserDao dao;
	
	@Override
	public Integer getUserCntService() {
		int result = dao.getUserCount();
		return result;
	}

	@Override
	public int insertUser(User user) {
		int result = dao.insertUser(user);
		return result;
	}

	@Override
	public User getUserByUserId(String userId) {
		User user = dao.getUserByUserId(userId);
		return user;

	}

}
