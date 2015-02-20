package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Evaluation;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {
	private final String namespace = "com.mvg.mappers.evaluationMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int getAllEvaluationCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Evaluation> getAllEvaluations() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Evaluation> getEvaluationByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Evaluation> getEvaluationByMovieCode(String movieCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertEvaluation(Evaluation evaluation) {
		int result = -1;
		String stmt = namespace + "insertEvaluation";
		result = sqlSession.insert(stmt, evaluation);
		return result;
	}

	@Override
	public int deleteEvaluation(int evId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		int result = -1;
		String stmt = namespace + "updateEvaluation";
		result = sqlSession.update(stmt, evaluation);
		return result;
	}

}
