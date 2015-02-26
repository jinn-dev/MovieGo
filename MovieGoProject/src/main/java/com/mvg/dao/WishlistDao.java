package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Wishlist;

public interface WishlistDao {
	
	//위시리스트 추가
	int insertWishlist(Wishlist wishlist);
	
	//위시리스트 삭제
	int deleteWishlist(int wishId);

	//사용자별 위시리스트
	List<Wishlist> getWishlistByUserId(String userId);
	
	//위시리스트 중복을 확인하기 위한 카운트
	int getWishlistCntByUM(String movieCode, String userId);
	
}
