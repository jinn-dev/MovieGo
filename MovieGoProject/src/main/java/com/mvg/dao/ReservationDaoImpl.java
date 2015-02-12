package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvg.entity.Reservation;

public class ReservationDaoImpl implements ReservationDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(UserDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.reservationMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getAllReservationCount() {
		String stmt = namespace + "getAllReservationCount";
		int result = sqlSession.selectOne(stmt);
		return result;
	}

	@Override
	public List<Reservation> getAllReservations() {
		String stmt = namespace + "getAllReservations";
		List<Reservation> reservations = sqlSession.selectList(stmt);
		return reservations;
	}

	//////////////////////////////////고칠부분
	@Override
	public List<Reservation> getAllReservationsWithInfo() {
		String stmt = namespace + "getAllReservationsWithInfo";
		String stmt2 = namespace + "get";
		List<Reservation> reservations = sqlSession.selectList(stmt);
		return reservations;
	}

	@Override
	public Reservation getReservationByRId(int reservationId) {
		String stmt = namespace + "getReservationByRId";
		Reservation reservation = sqlSession.selectOne(stmt);
		return reservation;
	}

	@Override
	public Reservation getReservationByRIdWithInfo(int reservationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> getReservationByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> getReservationByUserIdWithInfo(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation(int reservationId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
