package com.mvg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.EvaluationDao;
import com.mvg.entity.Evaluation;
@Service
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	EvaluationDao dao;
	
	@Override
	public int insertEvaluation(Evaluation evaluation) {
		int result = dao.insertEvaluation(evaluation);
		return result;
	}

}
