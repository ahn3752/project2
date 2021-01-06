package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.connector.Request;






public class boardDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//기본생성자에서 DBCP(커넥션풀)을 통해 DB연결
	public boardDAO() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc_mariadb");
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}
		catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			//연결을 해제하는것이 아니고 풀에 다시 반납한다.
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch (Exception e) {
			System.out.println("자원반납시 예외발생");
		}
}
	
	public int getTotalRecordCount(Map map)
	{	
		String flag = (String) map.get("flag");
		int totalCount = 0;
		try {
			String sql = "SELECT COUNT(*) FROM multi_board Where flag="+"'"+flag+"'"+"";
			if(map.get("Word")!=null) {
				sql +=" AND "+map.get("Column")+" "
						+ " LIKE '%"+map.get("Word")+"%' ";
			}
			System.out.println("쿼리문:"+ sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {}
		return totalCount;
	}
	
	public List<boardDTO> freeList(Map map){
		String flag = (String) map.get("flag");

		//리턴타입 선언
		List<boardDTO> list = new Vector<boardDTO>();
	
		
		String sql = " "
				+" SELECT * FROM multi_board Where flag="+"'"+flag+"'"+"";
			if(map.get("Word")!=null)
			{
				sql +=" AND "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' "; 
			}
			sql += "  ORDER BY idx DESC LIMIT ?, ?";
			System.out.println("쿼리문:"+ sql);
		

		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2,Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
		
			while(rs.next()) {
				
				boardDTO bdto = new boardDTO();
				
				
				
				bdto.setIdx(rs.getString("idx"));
				bdto.setId(rs.getString("id"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setAttachedfile(rs.getString("attachedfile"));
				bdto.setPostdate(rs.getDate("postdate"));
				bdto.setDowncount(rs.getString("downcount"));
				bdto.setVisitcount(rs.getString("visitcount"));
				

				list.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<boardDTO> selectList(Map map)
	{
		String flag = (String) map.get("flag");
		List<boardDTO> list = new Vector<boardDTO>();
		
		String sql = "SELECT * FROM multi_board Where flag="+"'"+flag+"'"+"";
		if(map.get("Word")!=null) {
			sql +=" AND "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";
		}
		sql += " ORDER BY idx DESC";
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				boardDTO bdto = new boardDTO();
				
				bdto.setIdx(rs.getString("idx"));
				bdto.setId(rs.getString("id"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setAttachedfile(rs.getString("attachedfile"));
				bdto.setPostdate(rs.getDate("postdate"));
				bdto.setDowncount(rs.getString("downcount"));
				bdto.setVisitcount(rs.getString("visitcount"));
				System.out.println(bdto.toString());

				
				list.add(bdto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertboard(boardDTO bdto) {
		int affected = 0;
		String sql = "INSERT INTO multi_board (" + " id,pass,title,content,attachedfile,flag,downcount) "
				+ " VALUES ("
				+ " ?,?,?,?,?,?,0)";
		try {
			

			psmt = con.prepareStatement(sql);

			psmt.setString(1, bdto.getId());
			psmt.setString(2, bdto.getPass());
			psmt.setString(3, bdto.getTitle());
			psmt.setString(4, bdto.getContent());
			psmt.setString(5, bdto.getAttachedfile());
			psmt.setString(6, bdto.getFlag());


			affected = psmt.executeUpdate();
			con.close();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return affected;
		
	}
	
	public void updateVisitCount(String idx) {
		String sql = "UPDATE multi_board SET "
				+ " visitcount=visitcount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch(Exception e) {}
		close();
	}
public void downCountPlus(String idx) {
		
		String sql = "UPDATE multi_board SET "
				+ " downcount=downcount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch(Exception e) {}
	}
	
	
	public boolean isCorrectPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM multi_board "
					+ " WHERE pass=? AND idx=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				//패스워드 검증 실패(해당하는 게시물이 없음)
				isCorr = false;
			}
		}
		catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		close();
		return isCorr;
	}
	public boardDTO selectView(String idx) {
	
		boardDTO bdto = null;
		String sql = "SELECT * FROM multi_board "
				+ " WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				bdto = new boardDTO();
				
				bdto.setIdx(rs.getString("idx"));
				bdto.setId(rs.getString("id"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setPostdate(rs.getDate("postdate"));
				bdto.setVisitcount(rs.getString("visitcount"));
				bdto.setAttachedfile(rs.getString("attachedfile"));
				bdto.setDowncount(rs.getString("downcount"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bdto;
	}
	
	public int boardupdate(boardDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE multi_board SET"
					+ " title=?, id=?, content=? "
					+ " , attachedfile=?, pass=? "
					+ " WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			//게시물 수정을 위한 추가부분
			psmt.setString(6, dto.getIdx());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}
		close();
		return affected;
	}
	
	public int boardDelete(String idx) {
		int affected = 0;
		try {
			String query = "DELETE FROM multi_board " + " WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<boardDTO> mainBoard(){
		//리턴타입 선언
		List<boardDTO> list = new ArrayList<boardDTO>();

		boardDTO bdto = null;
		String sql = "select * from multi_board where flag='notice' or flag='free' or flag='image' ORDER BY idx desc";
		try {
	
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
		
			while(rs.next()) {
				
				bdto = new boardDTO();
				
				bdto.setTitle(rs.getString("title"));
				bdto.setPostdate(rs.getDate("postdate"));
				bdto.setAttachedfile(rs.getString("attachedfile"));
				bdto.setFlag(rs.getString("flag"));
			
				System.out.println(bdto.toString());
				//벡터에 빈클래스 저장
				list.add(bdto);
	
			}
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}


















