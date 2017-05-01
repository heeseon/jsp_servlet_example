package org.olc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.olc.dto.CustUserDto;

public class CustUserManager extends CustUserDataBase implements ICustUser {

	public CustUserManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<CustUserDto> getCustLists() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " SELECT ID, NAME, ADDRESS FROM CUSTUSER ";
		List<CustUserDto> lists = new ArrayList<CustUserDto>();
		
		try {
			conn = super.getConnection();
			log("2/6 getCustLists");
			psmt = conn.prepareStatement(sql);
			log("3/6 getCustLists");
			rs = psmt.executeQuery();
			log("4/6 getCustLists");
			
			while(rs.next()){
				int i = 1;
				CustUserDto dto = new CustUserDto(
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++)
						);
				lists.add(dto);
			}
			log("5/6 getCustLists");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("getCustLists", e);
		} finally{
			close(conn, psmt, rs);
			log("6/6 getCustLists");
		}
		
		return lists;
	}

	@Override
	public CustUserDto getCustUser(String id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " SELECT ID, NAME, ADDRESS FROM CUSTUSER "
					+ " WHERE ID = ? ";
		CustUserDto dto = null;
		
		try {
			conn = super.getConnection();
			log("2/6 getCustUser");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			log("3/6 getCustUser");
			rs = psmt.executeQuery();
			log("4/6 getCustUser");
			
			while(rs.next()){
				int i = 1;
				dto = new CustUserDto(
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++)
						);
			}
			log("5/6 getCustUser");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("getCustUser", e);
		} finally{
			close(conn, psmt, rs);
			log("6/6 getCustUser");
		}
		
		return dto;

	}

	@Override
	public boolean addCustUser(CustUserDto dto) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " INSERT INTO CUSTUSER(ID, NAME, ADDRESS)"
				+ " VALUES(?, ?, ?) ";
		int count = 0;
		
		try {
			conn = super.getConnection();
			log("2/6 addCustUser");
			psmt = conn.prepareStatement(sql);
			int i = 1;
			psmt.setString(i++, dto.getId());
			psmt.setString(i++, dto.getName());
			psmt.setString(i++, dto.getAddress());
			log("3/6 getCustLists");
			count = psmt.executeUpdate();
			log("4/6 addCustUser");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("addCustUser", e);
		} finally{
			close(conn, psmt, rs);
			log("6/6 addCustUser");
		}
		
		return count>0?true:false;
	}

	@Override
	public boolean updateCustUser(CustUserDto dto) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " UPDATE CUSTUSER SET NAME=?, ADDRESS=? WHERE ID=?";
				
		int count = 0;
		
		try {
			conn = super.getConnection();
			log("2/6 updateCustUser");
			psmt = conn.prepareStatement(sql);
			int i = 1;
			psmt.setString(i++, dto.getName());
			psmt.setString(i++, dto.getAddress());
			psmt.setString(i++, dto.getId());
			log("3/6 updateCustUser");
			count = psmt.executeUpdate();
			log("4/6 updateCustUser");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("updateCustUser", e);
		} finally{
			close(conn, psmt, rs);
			log("6/6 updateCustUser");
		}
		
		return count>0?true:false;
	}

	@Override
	public boolean deleteCustUser(String id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = " DELETE FROM CUSTUSER WHERE ID=?";
		int count = 0;
		
		try {
			conn = super.getConnection();
			log("2/6 deleteCustUser");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			log("3/6 deleteCustUser");
			count = psmt.executeUpdate();
			log("4/6 deleteCustUser");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("deleteCustUser", e);
		} finally{
			close(conn, psmt, rs);
			log("6/6 deleteCustUser");
		}
		
		return count>0?true:false;
	}

	@Override
	public boolean muldelCustUser(String[] id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int[] count = new int[id.length]; 
		
		String sql = " DELETE FROM CUSTUSER WHERE ID=?";
				
		try {
			conn = super.getConnection();
			conn.setAutoCommit(false);
			log("2/6 muldelCustUser");
			psmt = conn.prepareStatement(sql);
			
			for(int i = 0; i <id.length ; ++ i){
				psmt.setString(1, id[i].trim());
				psmt.addBatch();
			}

			log("3/6 muldelCustUser");
			count = psmt.executeBatch();
			conn.commit();
			log("4/6 muldelCustUser");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log("muldelCustUser", e);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			return false;
			
		} finally{
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			close(conn, psmt, rs);
			log("6/6 muldelCustUser");
		}
		
		boolean isS = true;
		for(int i = 0 ; i < count.length ; ++ i){
			if(count[i] != 1){
				isS=false;
				break;
			}
		}
		
		return isS;

	}

}
