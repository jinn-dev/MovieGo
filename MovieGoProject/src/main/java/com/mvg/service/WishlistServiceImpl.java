package com.mvg.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvg.dao.WishlistDao;
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

}
