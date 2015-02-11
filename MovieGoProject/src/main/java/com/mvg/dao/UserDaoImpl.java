package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.User;

@Repository
public class UserDaoImpl implements UserDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.userMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getUserCount() {
		String stmt = namespace + "getUserCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public int insertUser(User user) {
		int result = -1;
		String stmt = namespace + "insertUser";
		result = sqlSession.insert(stmt, user);
		return result;
	}

	@Override
	public int deleteUser(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User getUserByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method st76ub
		return null;
	}

}
