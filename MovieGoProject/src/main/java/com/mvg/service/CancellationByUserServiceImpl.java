package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.CancellationByUserDao;
import com.mvg.entity.CancellationByUser;

@Service
public class CancellationByUserServiceImpl implements CancellationByUserService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(CancellationByUserServiceImpl.class);
	}
	
	@Autowired
	CancellationByUserDao dao;
	
	@Override
	public List<CancellationByUser> getCListByUIdService(String userId) {
		List<CancellationByUser> clist = dao.getCListByUserId(userId);
		return clist;
	}

}
