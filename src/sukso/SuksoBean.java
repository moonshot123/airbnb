package sukso;

public class SuksoBean {
	private int s_num;//숙소번호
	private String s_id;//숙소 아이디
	private String s_name;// 숙소 이름
	private String s_place;//숙소위치
	private int s_price;//숙소 가격
	private int s_score;//숙소평점
	private String s_images;//숙소 사진
	private String s_story; //상세 설명
	//private Timestamp s_reservated;//예약된 날짜 (이건 자료형도 바꺼야 될수도 있으니 감안해서 만들자)
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_place() {
		return s_place;
	}
	public void setS_place(String s_place) {
		this.s_place = s_place;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getS_score() {
		return s_score;
	}
	public void setS_score(int s_score) {
		this.s_score = s_score;
	}
	public String getS_images() {
		return s_images;
	}
	public void setS_images(String s_images) {
		this.s_images = s_images;
	}
	public String getS_story() {
		return s_story;
	}
	public void setS_story(String s_story) {
		this.s_story = s_story;
	}
	
}
