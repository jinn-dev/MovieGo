package com.mvg.service;

import com.mvg.entity.User;

public interface UserService {
	public int getUserCntService();
	public int insertUser(User user);
	public User getUserByUserId(User user);
	public int updateUser(User user);

}
