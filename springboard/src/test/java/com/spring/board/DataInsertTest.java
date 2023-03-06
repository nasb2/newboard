package com.spring.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.board.domain.BoardDto;
import com.spring.board.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DataInsertTest {
	@Autowired
	BoardService boardService;
	
	@Test
	public void deleteAllTest() throws Exception {
		boardService.deleteAll();
		int boardCnt = boardService.getCount();
		assertEquals(0, boardCnt);
	}
	
	@Test
	public void dataInsertTest() throws Exception {
		boardService.deleteAll();
		for (int i = 0; i < 50; i++) {
			BoardDto boardDto = new BoardDto("제목없음" + i, "내용없음", "작성자");
			boardService.insert(boardDto);
		}
		assertTrue(boardService.getCount() == 50);
	}
	
	@Test
	public void selectAllTest() throws Exception {
		List<BoardDto> list = boardService.selectAll();
		System.out.println(list);
	}
	
	

}
