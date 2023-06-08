package ajaxboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class AjaxBoardDao {

	DbConnect db=new DbConnect();
	
	//insert
	public void insertBoard(AjaxBoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into ajaxboard (writer,subject,content,avata,writeday) values (?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getAvata());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//select
	public ArrayList<AjaxBoardDto> getAllAboardDatas()
	{
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from ajaxboard order by num desc";
		
		ArrayList<AjaxBoardDto> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				AjaxBoardDto dto=new AjaxBoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAvata(rs.getString("avata"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
		
	}
	
	//num을 인자로 받는 dto반환
	public AjaxBoardDto getData(String num) {
		AjaxBoardDto dto = new AjaxBoardDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from ajaxboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(0, sql);
			
			if(rs.next())
		{
			dto.setNum(rs.getString("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setAvata(rs.getString("avata"));
			dto.setWriteday(rs.getTimestamp("writeday"));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
		
	}

	//삭제
	 public void deleteBoard(String num) {
		 Connection conn=db.getConnection();
		 PreparedStatement pstmt=null;
		 
		 String sql="delete from ajaxboard where num=?";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		 
	 }
	
}