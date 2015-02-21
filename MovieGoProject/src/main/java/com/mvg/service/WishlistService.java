package com.mvg.service;

import java.util.List;

import com.mvg.entity.Wishlist;


public interface WishlistService {
	public int insertWishlist(Wishlist wishlist);
	List<Wishlist> getWishlistByUserId(String userId);
	int getWishlistCntByUM(String movieCode, String userId); 
	
	
}
