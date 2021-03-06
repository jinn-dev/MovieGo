package com.mvg.dao;

import java.util.List;

import com.mvg.entity.User;


public interface UserDao {
	//전체 user의 수 얻어오기
	int getUserCount();
	
	//회원가입
	int insertUser(User user);
	
	//회원탈퇴
	int deleteUser(String userId);
	
	//개인정보 수정
	int updateUser(User user);
	
	//한명의 정보 불러오기
	User getUserByUserId(User user);
	
	String selectUserById(String userId);
	
	String selectUserByEmail(String userEmail);
	
	String selectUserByIdAndEmail(String userId, String userEmail);
	
	List<User> selectAllUser();
	
}
