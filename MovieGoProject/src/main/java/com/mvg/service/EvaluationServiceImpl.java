package com.mvg.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.controller.RatingController;
import com.mvg.dao.EvaluationDao;
import com.mvg.entity.Evaluation;
@Service
public class EvaluationServiceImpl implements EvaluationService {
	private static final Logger logger = LoggerFactory
			.getLogger(EvaluationServiceImpl.class);
	@Autowired
	EvaluationDao dao;
	
	@Override
	public int insertEvaluation(Evaluation evaluation) {
		int result = dao.insertEvaluation(evaluation);
		return result;
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		int result = dao.updateEvaluation(evaluation);
		return result;
	}


	@Override
	public int selectEvaluationByMovieCode(String movieCode, String userId) {		
		int result = dao.selectEvaluationByMovieCode(movieCode, userId);
		return result;
	}

	@Override
	public int updateRating(Evaluation evaluation) {
		int result = dao.updateRating(evaluation);
		return result;
	}

	@Override
	public int selectEvId(String movieCode, String userId) {
		int result = dao.selectEvId(movieCode, userId);
		return result;
	}


}
