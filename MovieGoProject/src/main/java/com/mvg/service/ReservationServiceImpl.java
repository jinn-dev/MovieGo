package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.ReservationDao;
import com.mvg.entity.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationServiceImpl.class);
	}
	
	@Autowired
	ReservationDao dao;

	@Override
	public int getAllRCntService() {
		int result = dao.getAllReservationCount();
		return result;
	}

	@Override
	public List<Reservation> getAllRService() {
		List<Reservation> rs = dao.getAllReservations();
		return rs;
	}

	@Override
	public List<Reservation> getAllRWithInfoService() {
		List<Reservation> rs = dao.getAllReservationsWithInfo();
		return rs;
	}

	@Override
	public Reservation getRByRIdService(int reservationId) {
		Reservation r = dao.getReservationByRId(reservationId);
		return r;
	}

	@Override
	public Reservation getRByRIdWithInfoService(int reservationId) {
		Reservation r = dao.getReservationByRIdWithInfo(reservationId);
		return r;
	}

	@Override
	public List<Reservation> getRByUserIdService(String userId) {
		List<Reservation> rs = dao.getReservationByUserId(userId);
		return rs;
	}

	@Override
	public List<Reservation> getRByUserIdWithInfoService(String userId) {
		List<Reservation> rs = dao.getReservationByUserIdWithInfo(userId);
		return rs;
	}

	@Override
	public int insertRService(Reservation reservation) {
		int result = dao.insertReservation(reservation);
		return result;
	}

	@Override
	public int deleteRService(int reservationId) {
		int result = dao.deleteReservation(reservationId);
		return result;
	}
	
	

}
