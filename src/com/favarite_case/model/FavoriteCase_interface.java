package com.favarite_case.model;

import java.util.List;


public interface FavoriteCase_interface {

	
	public void insert(FavoriteCaseVO favoriteCaseVO);
//	public void update(FavoriteCaseVO favoriteCaseVO);
	public void delete(String csNo, String mbNo);
	public List<FavoriteCaseVO> getAll();
	public FavoriteCaseVO findByPrimaryKey(String csNo, String mbNo);
	
}
