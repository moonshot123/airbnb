package sukso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Reservation_SuksoDao {
	
Connection conn ;
	
	private static Reservation_SuksoDao instance;
		
	public static Reservation_SuksoDao getInstance(){
		if(instance == null){
			instance = new Reservation_SuksoDao();
		}
		return instance;
	} 
	
	private Reservation_SuksoDao(){
		try{		
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;

		}catch( Exception e){
			e.printStackTrace();
		}
	}//Reservation_SuksoDao()
	
	
	
	
	public int addReservation(String id,String s_id,String checkin_date,String checkout_date) throws Exception{ //예약 데이터 서버저장
		int cnt=-1;
		PreparedStatement pstmt=null;
		String sql = "insert into reservation(r_num,rh_id,rs_id,rs_date,re_date) values(reseq.nextval,? ,?, ?, ?)";
				
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, s_id);
		pstmt.setString(3, checkin_date);
		pstmt.setString(4, checkout_date);
		
		cnt = pstmt.executeUpdate();
		
		
		return cnt;
	}//addReservation
	
	
	
	
	public Vector<Reservation_SuksoBean> getListById(String id) throws Exception{
		Reservation_SuksoBean list = null;
		Vector<Reservation_SuksoBean> lists = new Vector<Reservation_SuksoBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from reservation where rh_id=?";
		
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			list = new Reservation_SuksoBean();
			
			list.setR_num(rs.getInt("r_num"));
			list.setRh_id(rs.getString("rh_id"));
			list.setRs_id(rs.getString("rs_id"));
			list.setRs_date((rs.getString("rs_date")));
			list.setRe_date(rs.getString("re_date"));
			
			lists.addElement(list);
			
		}
		System.out.println("예약정보lists.size():"+lists.size());
		return lists;
	}//getListById
	
	
	
	public int calcleRe(int r_num) throws Exception{
		int cnt = -1;
		PreparedStatement pstmt = null ;
		
		conn.setAutoCommit( false ) ;
		String sql = "delete from reservation where r_num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, r_num);
		
		cnt = pstmt.executeUpdate();
		conn.commit() ;
		pstmt.close() ;
		return cnt;
	}
	
	
}
