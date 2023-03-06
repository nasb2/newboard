package com.spring.board;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class ConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	 private static final String URL = "jdbc:mysql://127.0.0.1:3306/newboard";
	 private static final String USER = "user";
	 private static final String PW = "0000";
	 
	 @Test
	 public void testConnection() throws Exception{
	  Class.forName(DRIVER);
	  
	  try(Connection con = DriverManager.getConnection(URL, USER, PW)){
	   System.out.println("성공");
	   System.out.println(con);
	  }catch (Exception e) {
	   System.out.println("에러");
	   e.printStackTrace();
	  }
	 
	}
	
//  @Test
//  public void testConnection() throws Exception {
//      Class.forName("com.mysql.cj.jdbc.Driver");
//
//      try (Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/newboard", "user", "0000")) {
//          System.out.println("Connection success");
//      } catch (Exception e) {
//          e.printStackTrace();
//      }
//  }
	
//	@Autowired
//	private DataSource ds;
//	@Test
//	public void testConnection() throws Exception { 
//		try(Connection con = ds.getConnection()) {
//			System.out.println("Connection : " + con + "\n");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
}
