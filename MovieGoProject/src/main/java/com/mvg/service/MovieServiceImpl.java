package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.MovieDao;
import com.mvg.entity.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	}
	
	@Autowired
	MovieDao dao;
	
	@Override
	public Integer getAllMovieCntService() {
		int result = dao.getAllMovieCount();
		return result;
	}

	@Override
	public List<Movie> getAllMoviesService() {
		List<Movie> movies = dao.getAllMovies();
		return movies;
	}
	
	/*@Override
	public List<Movie> randomGetAllMovies() {
	//	List<Movie> movies = dao.randomGetAllMovies();
		return movies;
	}
	 */
	
	@Override
	public Movie getMovieByMCodeService(String movieCode) {
		Movie movie = dao.getMovieByMovieCode(movieCode);
		return movie;
	}

	@Override
	public int insertMovieService(Movie movie) {
		int result = dao.insertMovie(movie);
		return result;
	}

	@Override
	public int updateMovieService(Movie movie) {
		int result = dao.updateMovie(movie);
		return result;
	}

	@Override
	public int deleteMovieService(String movieCode) {
		int result = dao.deleteMovie(movieCode);
		return result;
	}


}
