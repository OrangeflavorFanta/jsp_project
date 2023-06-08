package mycar.data;


import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
//자동으로  mysql에 mycar라는 테이블이 만들어진다..변수가 변경될 경우는 자동수정
@Table(name = "mycar")
@Data
public class MycarDto {
   
   //sql문 설정 안하니까 여기서 해줌 나머지는 메서드에서
   
   @Id //각 엔티티를 구별할 수 있는 식별 아이디를 갖도록 설계(시퀀스)
   @GeneratedValue(strategy = GenerationType.AUTO)
   private long num;//같은 숫자인데 jpa는 long을 많이 쓴다...?
   @Column(name="carname")
   private String carname;
   @Column//이름이 같으면 생략
   private int carprice;
   @Column
   private String carcolor;
   @Column
   private String carguip;
   @CreationTimestamp //엔티티가 생성되는 시점에 시간 자동등록
   @Column(updatable = false) //수정시 이 컬럼은 수정하지 않겠다는 의미 안주면 수정시 null이 된다
   private Timestamp guipday;
   
   

}