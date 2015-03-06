package com.mvg.dao;

import java.util.HashMap;
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
		String stmt1 = "com.mvg.mappers.wishlistMapper.deleteWishlistByUserId";
		sqlSession.delete(stmt1, userId);
		String stmt2 = "com.mvg.mappers.evaluationMapper.deleteEvaluationByUserId";
		sqlSession.delete(stmt2, userId);
		String stmt3 = "com.mvg.mappers.customerBoardMapper.deleteCommentByUserId";
		sqlSession.delete(stmt3, userId);
		String stmt4 = "com.mvg.mappers.customerBoardMapper.deleteBoardByUserId";
		sqlSession.delete(stmt4, userId);
		String stmt5 = namespace + "deleteUser";
		result= sqlSession.delete(stmt5, userId);
		
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
			result = null;
		}
		return result;
	}

	@Override
	public String selectUserById(String userId) {
		String stmt = namespace + "selectUserById";
		String result = sqlSession.selectOne(stmt, userId);
	
		return result;
	}

	@Override
	public String selectUserByEmail(String userEmail) {
		String stmt = namespace + "selectUserByEmail";
		String result = sqlSession.selectOne(stmt, userEmail);

		return result;
	}

	@Override
	public String selectUserByIdAndEmail(String userId, String userEmail) {
		String stmt = namespace + "selectUserByIdAndEmail";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userEmail", userEmail);

		String result = sqlSession.selectOne(stmt, map);

		return result;
	}

	@Override
	public List<User> selectAllUser() {
		String stmt = namespace + "selectAllUser";
		List<User> result = sqlSession.selectList(stmt);
		return result;
	}


}
