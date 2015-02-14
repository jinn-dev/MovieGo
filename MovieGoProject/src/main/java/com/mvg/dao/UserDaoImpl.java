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
		int result = -1;
		String stmt = namespace + "deleteUser";
		result= sqlSession.delete(stmt, userId);
		return result;
	}

	@Override
	public int updateUser(User user) {
		int result = -1;
		String stmt = namespace + "updateUser";
		result = sqlSession.update(stmt, user);
		return result;
	}

	@Override
	public User getUserByUserId(User user) {
		String stmt = namespace + "selectUser";
		User result = sqlSession.selectOne(stmt, user);
		if (result == null) {
			logger.error("없습니다");
		} else if(!result.getUserPwd().equals(user.getUserPwd())) {
			logger.error("패스워드가 틀립니다");
		}
		return result;
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method st76ub
		return null;
	}

	@Override
	public String selectUserById(String userId) {
		String stmt = namespace + "selectUserById";
		String result = sqlSession.selectOne(stmt, userId);
	
		return result;
	}

}
