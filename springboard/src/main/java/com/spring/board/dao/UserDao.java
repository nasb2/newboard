package com.spring.board.dao;

import java.util.List;

import com.spring.board.domain.UserDto;

public interface UserDao {

	UserDto select(String id) throws Exception;

	List<UserDto> selectAll() throws Exception;

	int deleteAll() throws Exception;

	int delete(String id, String pwd) throws Exception;

	int insert(UserDto userDto) throws Exception;

	int update(UserDto userDto) throws Exception;

}