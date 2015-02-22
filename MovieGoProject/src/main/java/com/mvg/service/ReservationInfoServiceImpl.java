package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.ReservationInfoDao;
import com.mvg.entity.ReservationInfo;

@Service
public class ReservationInfoServiceImpl implements ReservationInfoService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationInfoServiceImpl.class);
	}
	
	@Autowired
	ReservationInfoDao dao;
	
	@Override
	public int getAllRInfoCntService() {
		int result = dao.getAllReservationInfoCount();
		return result;
	}

	@Override
	public List<ReservationInfo> getAllRInfoService() {
		List<ReservationInfo> rinfo = dao.getAllReservationInfo();
		return rinfo;
	}

	@Override
	public List<ReservationInfo> getRInfoByRIdService(int reservationId) {
		 List<ReservationInfo> rinfo = dao.getReservationInfoByRId(reservationId);
		 return rinfo;
	}

	@Override
	public ReservationInfo getRInfoBySeatIdService(int seatId) {
		 ReservationInfo rinfo = dao.getReservationInfoBySeatId(seatId);
		 return rinfo;
	}

	@Override
	public List<ReservationInfo> getRInfoByNMIdService(int nowmovieId) {
		 List<ReservationInfo> rinfo = dao.getReservationInfoByNMId(nowmovieId);
		 return rinfo;
	}

	@Override
	public int insertRInfoService(ReservationInfo reservationInfo) {
		int result =  dao.insertReservationInfo(reservationInfo);
		return result;
	}

	@Override
	public int deleteRInfoService(int reservationId) {
		int result = dao.deleteReservationInfo(reservationId);
		return result;
	}

}
