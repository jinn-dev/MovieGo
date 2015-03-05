package com.mvg.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.ReservationByUserDao;
import com.mvg.entity.Reservation;
import com.mvg.entity.ReservationByUser;

@Service
public class ReservationByUserServiceImpl implements ReservationByUserService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(ReservationByUserServiceImpl.class);
	}
	
	@Autowired
	ReservationByUserDao dao;

	@Override
	public List<ReservationByUser> getAllRByUIdService(String userId) {
		List<ReservationByUser> rlist = dao.getAllRByUserId(userId);
		return rlist;
	}

	@Override
	public int cancelYNService(String movieTime) {
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-mm-dd hh:MM:ss");
		Date mTime = null;
		try {
			mTime = dateFormate.parse(movieTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date currTime = new Date();
		int result = (int) (mTime.getTime() - currTime.getTime());
		logger.trace("mylog: " + mTime);
		
//		int result = dao.cancelYN(movieTime);
		return result;
	}

	@Override
	public ReservationByUser getAllRByRIdService(int reservationId) {
		ReservationByUser ru = dao.getAllRByRId(reservationId);
		return ru;
	}

}
