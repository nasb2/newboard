package com.spring.board.dao;

import java.util.List;

import com.spring.board.domain.BoardDto;

public interface BoardDao {
	int getCount() throws Exception;
	
	BoardDto select(Integer bno) throws Exception;

    List<BoardDto> selectAll() throws Exception;

    List<BoardDto> selectPage(Integer offset, Integer pageSize) throws Exception;

    int delete(Integer bno, String writer) throws Exception;

    int deleteAll() throws Exception;

    int insert(BoardDto boardDto) throws Exception;

    int update(BoardDto boardDto) throws Exception;
}
