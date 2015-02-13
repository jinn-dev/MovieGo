package com.mvg.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Reservation;
import com.mvg.entity.ReservationInfo;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationDaoImpl.class);
	}

	private final String namespace = "com.mvg.mappers.reservationMapper.";

	@Autowired
	ReservationInfoDao infoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReservationInfoDao dao;
	
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
		List<Reservation> reservations = sqlSession.selectList(stmt);
		for (int i=0;i<reservations.size();i++) {
			int rid = reservations.get(i).getReservationId();
			dao.getReservationInfoByRId(rid);
		}
		
		
		return reservations;
	}

	@Override
	public Reservation getReservationByRId(int reservationId) {
		String stmt = namespace + "getReservationByRId";
		Reservation reservation = sqlSession.selectOne(stmt, reservationId);
		return reservation;
	}

	//////////안되면 getReservationByRId를 getReservationByRIdWithInfo로 고치기
	@Override
	public Reservation getReservationByRIdWithInfo(int reservationId) {
		Reservation r = this.getReservationByRId(reservationId);
		ArrayList<ReservationInfo> info = (ArrayList<ReservationInfo>) infoDao.getReservationInfoByRId(reservationId);
		r.setReservationInfo(info);
		return r;
	}

	@Override
	public List<Reservation> getReservationByUserId(String userId) {
		String stmt = namespace + "getReservationByUserId";
		List<Reservation> reservations = sqlSession.selectList(stmt, userId);
		return reservations;
	}

	@Override
	public List<Reservation> getReservationByUserIdWithInfo(String userId) {
		//아이디로 reservation 모두 조회
		List<Reservation> reservations = this.getReservationByUserId(userId);
		
		//reservation마다 가지고 있는 reservation_id로 reservationinfo조회함
		//reservation에 붙임
		for (int i=0;i<reservations.size();i++) {
			Reservation r = reservations.get(i);
			int rid = r.getReservationId();
			r.setReservationInfo((ArrayList<ReservationInfo>)infoDao.getReservationInfoByRId(rid));
		}
		return reservations;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		String stmt = namespace + "insertReservation";
		int result = sqlSession.insert(stmt, reservation);
		return result;
	}

	@Override
	public int deleteReservation(int reservationId) {
		String stmt = namespace + "deleteReservation";
		infoDao.deleteReservationInfo(reservationId);
		int result = sqlSession.delete(stmt, reservationId);
		return result;
	}

}
