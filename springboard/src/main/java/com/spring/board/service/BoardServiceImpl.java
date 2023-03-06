package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.domain.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao boardDao;
	
	@Override
	public int getCount() throws Exception {
		return boardDao.getCount();
	}
	
	@Override
    public BoardDto read(Integer bno) throws Exception {
        return boardDao.select(bno);
    }

    @Override
    public List<BoardDto> selectAll() throws Exception {
        return boardDao.selectAll();
    }

    @Override
    public List<BoardDto> selectPage(Integer offset, Integer pageSize) throws Exception {
        return boardDao.selectPage(offset, pageSize);
    }

    @Override
    public int delete(Integer bno, String writer) throws Exception {
        return boardDao.delete(bno, writer);
    }

    @Override
    public int deleteAll() throws Exception {
        return boardDao.deleteAll();
    }

    @Override
    public int insert(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
    public int update(BoardDto boardDto) throws Exception {
        return boardDao.update(boardDto);
    }
}
