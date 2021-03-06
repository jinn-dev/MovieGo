package com.mvg.service;

import java.util.List;

import com.mvg.entity.User;

public interface UserService {
	public int getUserCntService();

	public int insertUser(User user);

	public User getUserByUserId(User user);

	public int updateUser(User user);

	public int deleteUser(String userId);

	public String selectUserById(String userId);

	public String selectUserByEmail(String userEmail);

	public String selectUserByIdAndEmail(String userId, String userEmail);
	
	public List<User> selectAllUser();
}
