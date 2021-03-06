package com.mvg.service;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.NowMovieDao;
import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

@Service
public class NowMovieServiceImpl implements NowMovieService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(NowMovieServiceImpl.class);
	}
	
	@Autowired
	NowMovieDao dao;
	
	@Override
	public int getAllNMovieCntService() {
		int result = dao.getAllNowMovieCnt();
		return result;
	}

	@Override
	public List<NowMovie> getAllNMoviesService() {
		List<NowMovie> nmovies = dao.getAllNowMovies();
		return nmovies;
	}

	@Override
	public List<NowMovie> getNMovieByMCodeService(String movieCode) {
		List<NowMovie> nmovies = dao.getNowMovieByMovieCode(movieCode);
		return nmovies;
	}

	@Override
	public int insertNMovieService(Movie movie) {
		int result = dao.insertNowMovie(movie);
		return result;
	}

	@Override
	public int updateNMovieService(Movie movie) {
		int result = dao.updateNowMovie(movie);
		return result;
	}

	@Override
	public int deleteNMovieService(String movieCode) {
		int result = dao.deleteNowMovie(movieCode);
		return result;
	}

	@Override
	public Map<String, String> getAllNMovieNamesService(int theaterId) {
		Map<String, String> codesAndNames = dao.getAllNowMovieNames(theaterId);
		return codesAndNames;
	}

	@Override
	public List<String> getNMovieTimeByThAndMovieService(int theaterId, String movieCode) {
		List<String> times = dao.getNMovieTimeByThAndMovie(theaterId, movieCode);
		return times;
	}

	@Override
	public int getNMovieIdByNMovieService(int theaterId, String movieCode,
			String movieTime) {
		int nid = dao.getNMovieIdByNMovie(theaterId, movieCode, movieTime);
		return nid;
	}

	@Override
	public String getMTimeAmPmService(String movieTime) {
		String time = dao.getMovieTimeAmPm(movieTime);
		return time;
	}

	@Override
	public List<NowMovie> getAllDistictNowMovieCodes() {
		List<NowMovie> nmovies = dao.getAllDistictNowMovieCodes();
		return nmovies;
	}

}
