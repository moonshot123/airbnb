package member;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null; 
	
	
	private static MemberDao member =new MemberDao();
	
	private MemberDao(){
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
			System.out.println("conn="+conn);
		}catch(SQLException e){
			e.printStackTrace();

		}catch(ClassNotFoundException e){
			e.printStackTrace();

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static MemberDao getInstance(){
		return member;
	}
	
	//
	private Connection getConnection() throws Exception {
		
		Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
        conn = ds.getConnection();
        return conn;
        
	}
	
	
/*===============================*/	

	public boolean searchID(String h_id) throws Exception{ // 아이디 찾기 메소드
		boolean ch=false;
		System.out.println("searchID로 넘어온값:"+h_id);
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql ="select h_id from members where h_id=?";
		
		conn=getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,h_id);
		rs=pstmt.executeQuery();
		
		
		while (rs.next()) {
			ch=true;
		}
		System.out.println("아이디확인 :"+ch);
		return ch;
	}//searchID
	
	
	
	
	
	public int insertMember(MemberBean member) throws Exception{ //회원가입  
		PreparedStatement pstmt= null;
		int cnt=-1;
		String sql = "insert into members (h_num,h_id, h_name, h_password, h_password_check, h_email) "
				+ "values(memseq.nextval,?,?,?,?,?)";
		
		conn = getConnection();
		
		pstmt = conn.prepareStatement(sql);
		conn.setAutoCommit(false);
		pstmt.setString(1,member.getH_id());
		pstmt.setString(2,member.getH_name());
		pstmt.setString(3,member.getH_password());
		pstmt.setString(4,member.getH_password_check());
		pstmt.setString(5,member.getH_email());
		
		cnt = pstmt.executeUpdate();
		conn.commit();
		return cnt;
		
	}//insertMember()
	
	
	
	public MemberBean getMemberInfo(String id,String password) throws Exception{
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			System.out.println("dao: h_id: "+id);
			System.out.println("dao: h_password: "+password);
			
			String sql = "select * from members where h_id=? and h_password=?";
			
			conn =getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			MemberBean member = new MemberBean(); 
			
			if( rs.next() ){
				member.setH_num(rs.getInt("h_num"));
				member.setH_id("h_id");
				member.setH_name(rs.getString("h_name"));
				member.setH_password("h_password");
				member.setH_password_check(rs.getString("h_password_check"));
				member.setH_email(rs.getString("h_email"));
			}
			
		return member;
	}//getMemberInfo()
	
	
	
	public MemberBean getMemberById(String h_id) throws Exception{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from members where h_id=?";
		
		conn =getConnection();
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, h_id);
		
		rs = pstmt.executeQuery();
		
		MemberBean member = new MemberBean(); 
		
		if( rs.next() ){
			member.setH_num(rs.getInt("h_num"));
			member.setH_id("h_id");
			member.setH_name(rs.getString("h_name"));
			member.setH_password("h_password");
			member.setH_password_check(rs.getString("h_password_check"));
			member.setH_email(rs.getString("h_email"));
		}
		
	return member;
	}//getMemberById()
	
	
}
