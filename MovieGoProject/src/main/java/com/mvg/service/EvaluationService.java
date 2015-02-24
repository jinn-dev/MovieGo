package com.mvg.service;

import java.util.List;

import com.mvg.entity.Evaluation;

public interface EvaluationService {
	public int insertEvaluation(Evaluation evaluation);
	public int updateEvaluation(Evaluation evaluation);
	public Evaluation selectEvaluationByMovieCode(String movieCode, String userId);
	public int updateRating(Evaluation evaluation);
	public int selectEvId(String movieCode, String userId);
	public List<Evaluation> getEvaluationByUserId(String userId);
	public List<Evaluation> getEvaluationByMovieCode(String movieCode);
	public int deleteEvaluation(int evId);
/*	public int deleteEvaluationByUserId(String userId);
*/
}
