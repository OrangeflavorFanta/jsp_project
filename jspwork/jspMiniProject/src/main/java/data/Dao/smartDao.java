package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.Dto.smartDto;
import mysql.db.DbConnect;

public class smartDao {

	
	DbConnect db=new DbConnect();
	
	//insert
	public void insertSmart(smartDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into smartboard (writer,subject,content,writeday) values(?,?,?,num()";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
		
	}
	
	
	
	//페이징 처리 list
	public List<smartDto>getAllSmart(String num){
		List<smartDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from smart where num=? order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				smartDto dto=new smartDto();
				
				dto.setNum(rs.getString("num"));
				dto.set
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	
	
	//전체 갯수
	
	
	
	
	
	
	//하나 조회
	
	
	
	
	
	
	
	//num에 대한 하나의 dto
	
	
	
}
