package org.olc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class CustUserDataBase {
	private boolean isD=true;
	public void log(String msg){
		if(isD){
			System.out.println(this.getClass() + " : " + msg);
		}
	}
	
	public void log(String msg, Exception ee){
		if(isD){
			System.out.println(this.getClass() + " : " + ee.getMessage() + " : " + msg);
		}
	}
//----------로그용
	public Connection getConnection() throws SQLException{
		String url = "jdbc:mysql://192.168.43.215:3306/mysql";
		String user = "system";
		String password = "1qaz2wsx";
		return DriverManager.getConnection(url, user, password);
	}
	
	public void close(Connection conn, Statement psmt, ResultSet rs){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if( psmt != null){
			try {
				psmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public CustUserDataBase(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			log("1/6 success");
		}catch(ClassNotFoundException e){
			log("1/6 success", e);
		}
	}
}
