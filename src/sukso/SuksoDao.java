package sukso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.print.attribute.standard.PresentationDirection;
import javax.sql.DataSource;

public class SuksoDao {
	
	Connection conn ;
	
	private static SuksoDao instance;
		
	public static SuksoDao getInstance(){
		if(instance == null){
			instance = new SuksoDao();
		}
		return instance;
	} 
	
	private SuksoDao(){
		try{		
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;

		}catch( Exception e){
			e.printStackTrace();
		}
	}//SuksoDao()
	
	

	
	public Vector<SuksoBean> getAllSukso() throws Exception{//숙소정보 리스트전부보기
		 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from sukso";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		Vector<SuksoBean> s_lists = new Vector<SuksoBean>();
		while(rs.next()){
			
				SuksoBean s_list = new SuksoBean();
				s_list.setS_num(rs.getInt("s_num"));
				s_list.setS_id(rs.getString("s_id"));
				s_list.setS_name(rs.getString("s_name"));
				s_list.setS_place(rs.getString("s_place"));
				s_list.setS_price(rs.getInt("s_price"));
				s_list.setS_score(rs.getInt("s_score"));
				s_list.setS_images(rs.getString("s_images"));
				s_list.setS_story(rs.getString("s_story"));
				s_lists.add(s_list);
				
				//System.out.println("s_list: "+s_list.getS_num());
		}
		
		System.out.println("s_lists.size() : "+s_lists.size());
		rs.close();		
		pstmt.close();  
		return s_lists; 
	}//getAllSukso()
	
	
	
	
	public SuksoBean getSukso(String s_id) throws Exception{//숙소정호 한개만 가져오기
		SuksoBean s_list=null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		String sql = "select * from sukso where s_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,s_id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			s_list = new SuksoBean();
			
			s_list.setS_num(rs.getInt("s_num"));
			s_list.setS_id(rs.getString("s_id"));
			s_list.setS_name(rs.getString("s_name"));
			s_list.setS_place(rs.getString("s_place"));
			s_list.setS_price(rs.getInt("s_price"));
			s_list.setS_score(rs.getInt("s_score"));
			s_list.setS_images(rs.getString("s_images"));
			s_list.setS_story(rs.getString("s_story"));
		}
		return s_list;
	}//getSukso()
	
	
	public Vector<SuksoBean> getInfo(Vector<Reservation_SuksoBean> r_s_list) throws Exception{// 예약된 숙소정보를 받아오는거
		Vector<SuksoBean> lists = new Vector<SuksoBean>();
		SuksoBean list = null;
		
		for(Reservation_SuksoBean r_s : r_s_list){ 
			
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			String sql = "select * from sukso where s_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,r_s.getRs_id());
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				list = new SuksoBean();
				
				list.setS_num(rs.getInt("s_num"));
				list.setS_id(rs.getString("s_id"));
				list.setS_name(rs.getString("s_name"));
				list.setS_place(rs.getString("s_place"));
				list.setS_price(rs.getInt("s_price"));
				list.setS_score(rs.getInt("s_score"));
				list.setS_images(rs.getString("s_images"));
				list.setS_story(rs.getString("s_story"));
				
				lists.addElement(list);
			}
		}
		return lists;
	}//getInfo()
	
}
