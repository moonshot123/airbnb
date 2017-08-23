package sukso;

import java.util.Vector;

public class SuksoManager {
	
	private static SuksoManager instance;
	
	public static SuksoManager getInstance(){
		if(instance == null){
			instance = new SuksoManager();
		}
		return instance;
	} 
	private SuksoManager() {}
	
	
	
	//숙소 지역이랑 가격 필터
	public Vector<SuksoBean> selectsukso(Vector<SuksoBean> s_lists,String[] checkb,String min_price,String max_price){
		Vector<SuksoBean> c_list =new Vector<SuksoBean>();//체크박스 리스트 담기
		Vector<SuksoBean> p_list =new Vector<SuksoBean>();//가격리스트담기(최종)
		
		
		for(SuksoBean sukso : s_lists){
			for(String ch : checkb){
				if(sukso.getS_place().trim().equals(ch)){
					c_list.add(sukso);
				}else{
				}//if
			}//for
		}//for
		
		
		for(SuksoBean sukso : c_list){
			if(sukso.getS_price() >= Integer.parseInt(min_price.trim()) && sukso.getS_price() <= Integer.parseInt(max_price.trim())){
				p_list.add(sukso);
			}
		}
		return p_list;
		
		
	}//selectsukso()
	
	
	
	
}
