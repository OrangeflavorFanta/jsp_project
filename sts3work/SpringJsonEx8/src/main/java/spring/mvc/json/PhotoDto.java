package spring.mvc.json;

public class PhotoDto {

	private String name;
	private String photo;
	
	//명시적 생성자(이거 만들면 디폴트 생성자 없음)
	public PhotoDto(String name, String photo) {
		
		this.name=name;
		this.photo=photo;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	
	
}
