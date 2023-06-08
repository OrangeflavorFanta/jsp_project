package board.data;

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
@Data
@Table(name="sboard")
public class BoardDto {
	//num writer subject content writeday

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)//시퀀스 만들어주는 역할
	private Long num;
	@Column(name="writer")
	private String writer;
	@Column
	private String subject;
	@Column
	private String content;
	@Column(name="writeday", updatable=false)
	@CreationTimestamp
	private Timestamp writeday;
}
