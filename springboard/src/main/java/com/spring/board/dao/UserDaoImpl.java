package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	SqlSession session;
	private static String namespace = "com.spring.board.dao.UserMapper.";
	
	@Override
	public UserDto select(String id) throws Exception {
		return session.selectOne(namespace + "select", id);
	}
	
	@Override
	public List<UserDto> selectAll() throws Exception {
		return session.selectList(namespace + "selectAll");
	}
	
	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace + "deleteAll");
	}
	
	@Override
	public int delete(String id, String pwd) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		return session.delete(namespace + "delete", map);
	}
	
	@Override
	public int insert(UserDto userDto) throws Exception {
		return session.insert(namespace + "insert", userDto);
	}
	
	@Override
	public int update(UserDto userDto) throws Exception {
		return session.update(namespace + "update", userDto);
	}
}
