package com.mvg.service;

import java.util.List;

import com.mvg.entity.Wishlist;


public interface WishlistService {
	public int insertWishlist(Wishlist wishlist);
	public List<Wishlist> getWishlistByUserId(String userId);
	public int getWishlistCntByUM(String movieCode, String userId); 
	public int deleteWishlist(int wishId);
/*	public int deleteWishlistByUserId(String userId);
*/	
}
