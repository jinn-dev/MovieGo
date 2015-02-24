package com.mvg.service;

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
		int result = dao.cancelYN(movieTime);
		return result;
	}

}
