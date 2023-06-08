package boot.quiz.bookstore;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sdto")
public class SeojumDto {
	
	private String num;
	private String bookname;
	private String bookwriter;
	private int bookprice;
	private String bookphoto;
	private String bookcompany;
	private Timestamp ipgoday;

}
