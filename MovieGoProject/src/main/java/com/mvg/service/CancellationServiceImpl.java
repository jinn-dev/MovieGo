package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.CancellationDao;
import com.mvg.entity.Cancellation;

@Service
public class CancellationServiceImpl implements CancellationService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(CancellationServiceImpl.class);
	}
	
	@Autowired
	CancellationDao dao;
	
	@Override
	public List<Cancellation> getCancelByUserIdService(String userId) {
		List<Cancellation> clist = dao.getCancellationByUserId(userId);
		return clist;
	}

	@Override
	public int insertCancelService(Cancellation cancellation) {
		int result = dao.insertCancellation(cancellation);
		return result;
	}

}
