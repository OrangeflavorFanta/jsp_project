package spring.di.ex2;

public class Person {
	
	String schoolName;
	Myinfo info;
	
	public Person(Myinfo info ) {
		// TODO Auto-generated constructor stub
		super();
		this.info=info;
		
	
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	//출력
	public void write()
	{
		System.out.println("***학생정보 출력***");
		
		System.out.println("학교명: "+schoolName);
		System.out.println("이름: "+info.name);
		System.out.println("나이: "+info.age);
		System.out.println("주소: "+info.addr);
		
	}
}
