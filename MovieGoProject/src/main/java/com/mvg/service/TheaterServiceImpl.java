package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.TheaterDao;
import com.mvg.entity.Theater;

@Service
public class TheaterServiceImpl implements TheaterService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(TheaterService.class);
	}
	
	@Autowired
	TheaterDao dao;
	
	@Override
	public Integer getTheaterCntService() {
		int result = dao.getTheaterCount();
		return result;
	}

	@Override
	public List<Theater> getAllTheatersService() {
		List<Theater> theaters = dao.getAllTheaters();
		return theaters;
	}

	@Override
	public int insertTheaterService(Theater theater) {
		int result = dao.insertTheater(theater);
		return result;
	}

	@Override
	public int updateTheaterService(Theater theater) {
		int result = dao.updateTheater(theater);
		return result;
	}

	@Override
	public int deleteTheaterService(int theaterId) {
		int result = dao.deleteTheater(theaterId);
		return result;
	}

	@Override
	public Theater getTheaterByIdService(int theaterId) {
		Theater theater = dao.getTheaterById(theaterId);
		return theater;
	}

	@Override
	public Theater getTheaterByNameService(String theaterName) {
		Theater theater = dao.getTheaterByName(theaterName);
		return theater;
	}

}
