package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.SeatInfoDao;
import com.mvg.entity.SeatInfo;

@Service
public class SeatInfoServiceImpl implements SeatInfoService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(SeatInfoServiceImpl.class);
	}
	
	@Autowired
	SeatInfoDao dao;
	
	@Override
	public int getAllSeatInfoCntService() {
		int cnt = dao.getAllSeatInfoCount();
		return cnt;
	}

	@Override
	public List<SeatInfo> getAllSeatInfoService() {
		List<SeatInfo> seats = dao.getAllSeatInfo();
		return seats;
	}

	@Override
	public int insertSeatInfoService(SeatInfo seatInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSeatInfoService(SeatInfo seatInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSeatInfoService(int seatId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SeatInfo getSInfoBySIdService(int seatId) {
		SeatInfo seat = dao.getSeatInfoBySeatId(seatId);
		return seat;
	}

	@Override
	public List<SeatInfo> getSInfoByNMovieIdService(int nowmovieId) {
		List<SeatInfo> seats = dao.getSeatInfoByNMovieId(nowmovieId);
		return seats;
	}

}
