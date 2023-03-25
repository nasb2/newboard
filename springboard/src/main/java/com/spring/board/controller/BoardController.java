package com.spring.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.domain.BoardDto;
import com.spring.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam Map<String, Object> map, Integer bno) throws Exception {
//		System.out.println("map="+map);
		
		String writer = (String) map.get("writer");
		/* modelAndView.addObject("result", "success"); */
		
		boardService.delete(bno, writer);
		
		return "success";
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView update(@RequestBody BoardDto boardDto, Integer bno) throws Exception {
//		System.out.println(boardDto);
	
		ModelAndView modelAndView = new ModelAndView("jsonView");
		modelAndView.addObject("result", "success");
		
		boardService.update(boardDto);
			
		return modelAndView;
		
	}

	@RequestMapping(value = "/read.do", method = RequestMethod.GET)
	public ModelAndView read(Integer bno, Integer page, Integer pageSize) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		BoardDto boardDto = boardService.read(bno);
		
		modelAndView.addObject(boardDto);
		modelAndView.addObject(page);
		modelAndView.addObject(pageSize);
		modelAndView.addObject("mode", "read");
		modelAndView.setViewName("board");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView doPost(@RequestParam Map<String, Object> map, BoardDto boardDto) throws Exception {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("jsonView");
		
		boardService.insert(boardDto);
		modelAndView.addObject("result", "success");
			
		return modelAndView;
	}
	
	@RequestMapping(value = "/write.go", method = RequestMethod.GET)
	public ModelAndView write() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("mode", "write");
		modelAndView.setViewName("board");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView list(Integer page, Integer pageSize, Model model, Integer bno) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		List<BoardDto> list;
		page = (page == null ? 1 : page);
		pageSize = 10;
		int totalCnt = boardService.getCount();
		PageHandler ph = new PageHandler(totalCnt, page, pageSize);
		
		list = boardService.selectPage((page - 1) * pageSize, pageSize);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("ph", ph);
		modelAndView.setViewName("boardList");
		
		model.addAttribute("bno", bno);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public void ParameterTest(HttpServletRequest request) {
		System.out.println("request = " + request.getParameter("test"));
		
	}
	
}
