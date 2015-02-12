package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvg.entity.ReservationInfo;

public class ReservationInfoDaoImpl implements ReservationInfoDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationInfoDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.reservationInfoMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getAllReservationInfoCount() {
		String stmt = namespace + "getAllReservationInfoCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public List<ReservationInfo> getAllReservationInfo() {
		String stmt = namespace + "getAllReservationInfo";
		List<ReservationInfo> info = sqlSession.selectList(stmt);
		return info;
	}

	@Override
	public List<ReservationInfo> getReservationInfoByRId(int reservationId) {
		String stmt = namespace + "getReservationInfoByRId";
		List<ReservationInfo> info = sqlSession.selectList(stmt, reservationId);
		return info;
	}

	@Override
	public ReservationInfo getReservationInfoBySeatId(int seatId) {
		String stmt = namespace + "getReservationInfoBySeatId";
		ReservationInfo info = sqlSession.selectOne(stmt, seatId);
		return info;
	}

	@Override
	public int insertReservationInfo(ReservationInfo reservationInfo) {
		String stmt = namespace + "insertReservationInfo";
		int result = sqlSession.insert(stmt, reservationInfo);
		return result;
	}

	@Override
	public int deleteReservationInfo(int reservationId) {
		String stmt = namespace + "deleteReservationInfo";
		int result = sqlSession.delete(stmt, reservationId);
		return result;
	}

}