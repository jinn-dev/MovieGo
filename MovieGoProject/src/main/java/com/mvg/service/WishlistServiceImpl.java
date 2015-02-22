package com.mvg.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.WishlistDao;
import com.mvg.entity.Movie;
import com.mvg.entity.Wishlist;
@Service
public class WishlistServiceImpl implements WishlistService {
	
	private static final Logger logger = LoggerFactory
			.getLogger(WishlistServiceImpl.class);
	@Autowired
	WishlistDao dao;
	@Override
	public int insertWishlist(Wishlist wishlist) {
		int result = dao.insertWishlist(wishlist);
		return result;
	}
	@Override
	public List<Wishlist> getWishlistByUserId(String userId) {		
		List<Wishlist> wishlist = dao.getWishlistByUserId(userId);
		return wishlist;
	}
	@Override
	public int getWishlistCntByUM(String movieCode, String userId) {
		int result = dao.getWishlistCntByUM(movieCode, userId);
		return result;
	}
	@Override
	public int deleteWishlist(int wishId) {
		int result = dao.deleteWishlist(wishId);
		return result;
	}

}
