package com.jsplec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.jsplec.bbs.dto.BDto;

public class BDao {
	DataSource datasource;
	
	public BDao() {
		try {
			Context context = new InitialContext();
			datasource=(DataSource) context.lookup("java:comp/env/jdbc/mvc");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BDto> list(){
		ArrayList<BDto> dtos=new ArrayList<BDto>();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		
		try {
			connection=datasource.getConnection();
			
			String query="select bId,bName,bTitle,bContent,bDate from mvc_board";
			preparedStatement=connection.prepareStatement(query);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int bId=resultSet.getInt("bId");
				String bName=resultSet.getString("bName");
				String bTitle=resultSet.getString("bTitle");
				String bContent=resultSet.getString("bContent");
				Timestamp bDate=resultSet.getTimestamp("bDate");
				
				BDto dto=new BDto(bId, bName,bTitle, bContent, bDate);
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) resultSet.close();
				if(preparedStatement!=null) preparedStatement.close();
				if(connection!=null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return dtos;
	}
	
	public void write(String bName,String bTitle,String bContent) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection=datasource.getConnection();
			
			String query="insert into mvc_board (bName,bTitle,bContent,bDate) values (?,?,?,now())";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement!=null) preparedStatement.close();
				if(connection!=null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public BDto contentView(String strID) {
		BDto dto=null;
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		
		try {
			connection=datasource.getConnection();
			
			String query="select * from mvc_board where bId=?";
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(strID));
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int bId=resultSet.getInt("bId");
				String bName=resultSet.getString("bName");
				String bTitle=resultSet.getString("bTitle");
				String bContent=resultSet.getString("bContent");
				Timestamp bDate=resultSet.getTimestamp("bDate");
				
				dto=new BDto(bId, bName,bTitle, bContent, bDate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet!=null) resultSet.close();
				if(preparedStatement!=null) preparedStatement.close();
				if(connection!=null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}	
		return dto;
	}
	
	public void update(String bName,String bTitle,String bContent,String bId) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection=datasource.getConnection();
			
			String query="update mvc_board set bName=?,bTitle=?,bContent=?,bDate=now() where bId=?";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setString(4, bId);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement!=null) preparedStatement.close();
				if(connection!=null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void delete(String bId) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection=datasource.getConnection();
			
			String query="delete from mvc_board where bId=?";
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, bId);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement!=null) preparedStatement.close();
				if(connection!=null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
}
