package com.spring.board;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.board.controller.PageHandler;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PageHandlerTest {
	
    @Test // 1 2 3 4 5 6 7 8 9 10 
    public void test1() throws Exception {
        PageHandler ph = new PageHandler(100, 10, 10);
        assertTrue(ph.getBeginPage() == 1);
        ph.printNavi();
    }

    @Test // 1
    public void test2() throws Exception {
        PageHandler ph = new PageHandler(9, 1, 10);
        assertTrue(ph.getEndPage() == ph.getBeginPage());
        ph.printNavi();
    }

    @Test // 21
    public void test3() throws Exception {
        PageHandler ph = new PageHandler(201, 21, 10);
        assertTrue(ph.getBeginPage() == 21);
        ph.printNavi();
    }

    @Test // [이전페이지] 21 22 23 24 25 26 27 28 29 30 [다음페이지]
    	  // [이전페이지] 41 42 43 
    public void test4() throws Exception {
        PageHandler ph = new PageHandler(421, 27, 10);
        ph.printNavi();
        assertTrue(ph.getTotalPageCnt() == 43);
        ph = new PageHandler(421, 42, 10);
        System.out.println();
        ph.printNavi();
    }

    @Test // [이전페이지] 11 
    public void test5() throws Exception {
        PageHandler ph = new PageHandler(110, 11, 10);
        ph.printNavi();
    }

    @Test // [이전페이지] 11 12 13 14 15 16 17 18 19 20 
    public void test6() throws Exception {
        PageHandler ph = new PageHandler(200, 20, 10);
        ph.printNavi();
    }

    @Test // 1 2 
    public void test7() throws Exception {
        PageHandler ph = new PageHandler(11, 1, 10);
        ph.printNavi();
    }

    @Test // 1 2 3 4 5 
    public void test8() throws Exception {
        PageHandler ph = new PageHandler(31, 1, 5);
        int endPage = ph.getEndPage();
        ph.setEndPage(Math.min(ph.getTotalPageCnt(), ph.getBeginPage() + 4));
        ph.setShowNext(endPage % 5 == 0 && endPage < ph.getTotalPageCnt());
        ph.printNavi();
    }
}