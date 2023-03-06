package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.domain.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
    @Autowired
    SqlSession session;
	private static String namespace = "com.spring.board.dao.BoardMapper.";
	
	@Override
	public int getCount() throws Exception {
		return session.selectOne(namespace + "getCount");
	}
	
	@Override
    public BoardDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "select", bno);
    }

    @Override
    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<BoardDto> selectPage(Integer offset, Integer pageSize) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", offset);
        map.put("pageSize", pageSize);
        return session.selectList(namespace + "selectPage", map);
    }

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace + "delete", map);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int insert(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "insert", boardDto);
    }

    @Override
    public int update(BoardDto boardDto) throws Exception {
        return session.update(namespace + "update", boardDto);
    }
}
