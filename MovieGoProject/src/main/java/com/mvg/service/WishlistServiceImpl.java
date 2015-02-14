package com.mvg.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvg.dao.WishlistDao;
import com.mvg.entity.Wishlist;

public class WishlistServiceImpl implements WishlistService {
	@Autowired
	WishlistDao dao;
	@Override
	public int insertWishlist(Wishlist wishlist) {
		int result = dao.insertWishlist(wishlist);
		return result;
	}

}
