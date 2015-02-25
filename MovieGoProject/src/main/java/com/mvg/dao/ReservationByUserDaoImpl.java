package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.ReservationByUser;

@Repository
public class ReservationByUserDaoImpl implements ReservationByUserDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationByUserDaoImpl.class);
	}
	
	private final String namespace = "com.mvg.mappers.reservationByUserMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReservationByUser> getAllRByUserId(String userId) {
		String stmt = namespace + "getAllRByUserId";
		List<ReservationByUser> rlist = sqlSession.selectList(stmt, userId);
		return rlist;
	}

	@Override
	public int cancelYN(String movieTime) {
		String stmt = namespace + "cancelYN";
		int result = sqlSession.selectOne(stmt, movieTime);
		return result;
	}

	@Override
	public ReservationByUser getAllRByRId(int reservationId) {
		String stmt = namespace + "getAllRByRId";
		ReservationByUser ru = sqlSession.selectOne(stmt, reservationId);
		return ru;
	}

}
