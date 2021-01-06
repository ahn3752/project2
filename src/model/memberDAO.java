package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class memberDAO {

		Connection con;
		PreparedStatement psmt;
		ResultSet rs;
		
		//기본생성자에서 DBCP(커넥션풀)을 통해 DB연결
		public memberDAO() {
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
		
		public Map<String, String> getMemberMap(String id,String pwd){
			
			//회원정보를 저장할 Map컬렉션 생성
			Map<String, String> maps = new HashMap<String, String>();

			String query = "SELECT id, pass, name,grade FROM "
					+ " membership WHERE id=? AND pass=?";
			System.out.println(id+"<>"+pwd);
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				psmt.setString(2, pwd);
				rs = psmt.executeQuery();

				//회원정보가 있다면 put()을 통해 정보를 저장한다.
				if(rs.next()) {
					maps.put("id", rs.getString(1));
					maps.put("pass", rs.getString("pass"));
					maps.put("name", rs.getString("name"));
					maps.put("grade", rs.getString("grade"));
				}
				else {
					System.out.println("결과가 없습니다.");
				}
			}
			catch(Exception e) {
				System.out.println("getMemberDTO오류");
				e.printStackTrace();
			}
			close();
			return maps;
		}
		
		
		public Map<String, String> adminMember(String id,String pw){
			
			//회원정보를 저장할 Map컬렉션 생성
			Map<String, String> maps = new HashMap<String, String>();

			String query = "SELECT id FROM "
					+ " membership WHERE id=? AND pass=? AND grade=0";
			System.out.println(id+"<>"+pw);
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();

				//회원정보가 있다면 put()을 통해 정보를 저장한다.
				if(rs.next()) {
					maps.put("id", rs.getString(1));
				}
				else {
					System.out.println("결과가 없습니다.");
				}
			}
			catch(Exception e) {
				System.out.println("getMemberDTO오류");
				e.printStackTrace();
			}
			close();
			return maps;
		}
		public void insertMember(memberDTO mdto) {
	
			String sql = "INSERT INTO membership (name,id,pass,hcall,phone,email,address) VALUES (?,?,?,?,?,?,?) ";
			try {
				

				psmt = con.prepareStatement(sql);

				psmt.setString(1, mdto.getName());
				psmt.setString(2, mdto.getId());
				psmt.setString(3, mdto.getPass());
				psmt.setString(4, mdto.getHcall());
				psmt.setString(5, mdto.getPhone());
				psmt.setString(6, mdto.getEmail());
				psmt.setString(7, mdto.getAddress());
	
				psmt.executeUpdate();
				con.close();

			}catch(Exception e) {
				System.out.println("오류");
				e.printStackTrace();
			}
			
		}
		
		public int checkId(String id) {
			String sql = "SELECT id FROM membership WHERE id=?";
			
			int result = 0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				if(rs.next()){
					result = 1;
				}
				else {
					result = 0;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			close();
			
			return result;
		}
		
		public Map<String, String> findId(String name, String email) {
			
			Map<String, String> maps = new HashMap<String, String>();
			
			
			try {
				String sql = " SELECT id FROM membership WHERE NAME=? AND email=? ";
				
				System.out.println(name);
				System.out.println(email);
				psmt = con.prepareStatement(sql);
				psmt.setString(1, name);
				psmt.setString(2, email);
				rs = psmt.executeQuery();
				System.out.println("ddadsa");
				if(rs.next()) {
					maps.put("id", rs.getString(1));
					
				}
				else {
					System.out.println("결과셋이 없습니다.");
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			close();
			return maps;	
		}
		
		public memberDTO findPw(String id, String name, String email) {
			
			
			memberDTO mdto = null;
			
			String sql = " SELECT pass FROM membership WHERE id=? AND name=? AND email=? ";
			
			try {
				
				System.out.println(id);
				System.out.println(name);
				System.out.println(email);
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, name);
				psmt.setString(3, email);
				
				rs = psmt.executeQuery();
				System.out.println("ddadsa");
				if(rs.next()) {
					mdto = new memberDTO();
					mdto.setPass(rs.getString(1));
					mdto.setEmail(email);
				
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			close();
			return mdto;	
		}
		
		public List<memberDTO> memberList(){
			
			//리턴타입 선언
			List<memberDTO> list = new ArrayList<memberDTO>();

			memberDTO mdto = null;
			String sql = "select * from membership";
			try {
		
				psmt = con.prepareStatement(sql);

				rs = psmt.executeQuery();
			
				while(rs.next()) {
					
					mdto = new memberDTO();
					
					mdto.setName(rs.getString("name"));
					mdto.setId(rs.getString("id"));
					mdto.setPass(rs.getString("pass"));
					mdto.setHcall(rs.getString("hcall"));
					mdto.setPhone(rs.getString("phone"));
					mdto.setEmail(rs.getString("email"));
					mdto.setAddress(rs.getString("address"));
					mdto.setGrade(rs.getString("grade"));
					System.out.println(mdto.toString());
					//벡터에 빈클래스 저장
					list.add(mdto);
		
				}
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		public memberDTO selectView(String idx) {
			
			memberDTO mdto = null;
			String sql = "SELECT * FROM membership "
					+ " WHERE id=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, idx);
				rs = psmt.executeQuery();
				if(rs.next()) {
					mdto = new memberDTO();
					
					mdto.setName(rs.getString(1));
					mdto.setId(rs.getString(2));
					mdto.setPass(rs.getString(3));
					mdto.setHcall(rs.getString(4));
					mdto.setPhone(rs.getString(5));
					mdto.setEmail(rs.getString(6));
					mdto.setAddress(rs.getString(7));
					mdto.setGrade(rs.getString(8));
		
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			close();
			return mdto;
		}
		
		
		public void updateMember(memberDTO mdto) {
			String sql = "UPDATE membership SET name=?, id=? , pass=?,hcall=?, phone=? ,email=?, address=?, grade=? where id=?";
			
			try {
				psmt = con.prepareStatement(sql);

				psmt.setString(1, mdto.getName());
				psmt.setString(2, mdto.getId());
				psmt.setString(3, mdto.getPass());
				psmt.setString(4, mdto.getHcall());
				psmt.setString(5, mdto.getPhone());
				psmt.setString(6, mdto.getEmail());
				psmt.setString(7, mdto.getAddress());
				psmt.setString(8, mdto.getGrade());
				psmt.setString(9, mdto.getId());
				
				psmt.executeUpdate();
		
			}catch (Exception e) {
				e.printStackTrace();
			}
			close();
		}
		
}


















