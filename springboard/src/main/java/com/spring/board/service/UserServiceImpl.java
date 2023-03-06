package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.domain.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
	
	@Override
	public UserDto select(String id) throws Exception {
		return userDao.select(id);
	}
	
	@Override
	public List<UserDto> selectAll() throws Exception {
		return userDao.selectAll();
	}
	
	@Override
	public int deleteAll() throws Exception {
		return userDao.deleteAll();
	}
	
	@Override
	public int delete(String id, String pwd) throws Exception {
		return userDao.delete(id, pwd);
	}
	
	@Override
	public int insert(UserDto userDto) throws Exception {
		return userDao.insert(userDto);
	}
	
	@Override
	public int update(UserDto userDto) throws Exception {
		return userDao.update(userDto);
	}
}
