package com.mvg.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.Wishlist;
@Repository
public class WishlistDaoImpl implements WishlistDao {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(WishlistDaoImpl.class);
	}
	private final String namespace = "com.mvg.mappers.wishlistMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getAllWishlistCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertWishlist(Wishlist wishlist) {
		int result = -1;
		String stmt = namespace + "insertWishlist";
		result = sqlSession.insert(stmt, wishlist);
		logger.trace("위시리스트" + wishlist);

		return result;
	}

	@Override
	public int deleteWishlist(int wishId) {
		int result = -1;
		String stmt = namespace+"deleteWishlist";
		result = sqlSession.delete(stmt, wishId);
		return result;
	}

	@Override
	public List<Wishlist> getWishlistByUserId(String userId) {
		// TODO Auto-generated method stub
		String stmt = namespace + "getWishlistByUserId";
		List<Wishlist> wishlist = sqlSession.selectList(stmt, userId);
		return wishlist;
	}

	@Override
	public List<Wishlist> getAllWishlist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getWishlistCntByUM(String movieCode, String userId) {
		String stmt = namespace + "getWishlistCntByUM";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("movieCode", movieCode);
		map.put("userId", userId);
		int result = sqlSession.selectOne(stmt, map);

		return result;
	}

	@Override
	public int getWishlistCountByMovieCode(String movieCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	



}
