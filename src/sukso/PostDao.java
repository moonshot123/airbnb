package sukso;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PostDao {
	Connection conn ;
	
	private static PostDao instance;
		
	public static PostDao getInstance(){
		if(instance == null){
			instance = new PostDao();
		}
		return instance;
	} 
	
	private PostDao(){
		try{		
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;

		}catch( Exception e){
			e.printStackTrace();
		}
	}//PostDao()
	
	
	public Vector<PostBean> selectPostBySukso(String s_id) throws Exception{ // 숙소번호
		Vector<PostBean> postList =new Vector<PostBean>();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = "select * from post where ps_id=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, s_id);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			PostBean post =new PostBean();
			
			post.setP_num(rs.getInt("p_num"));
			post.setPh_id(rs.getString("ph_id"));
			post.setPs_id(rs.getString("ps_id"));
			post.setP_time(rs.getString("p_time"));
			post.setP_post(rs.getString("p_post"));
			
			postList.add(post);
		}
		return postList;
	}//selectPostBySukso()
	
	
	
	public int insertpost(String ph_id,String ps_id,String p_post,String mTime) throws Exception{//후기쓰기
		int cnt=-1;
		PreparedStatement pstmt= null;
		String sql ="insert into post(p_num,ph_id,ps_id,p_time,p_post)values(postseq.nextval,? ,?, to_date(?),?)" ;
		pstmt=conn.prepareStatement(sql);
		conn.setAutoCommit(false);
		pstmt.setString(1, ph_id);
		pstmt.setString(2, ps_id);
		pstmt.setString(3, mTime);
		pstmt.setString(4, p_post);
		
		cnt = pstmt.executeUpdate();
		conn.commit();
		
		return cnt;
	}//insertpost()
	
}
