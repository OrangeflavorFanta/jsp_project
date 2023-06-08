package boot.mvc.alone;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.mybatis.spring.annotation.MapperScan;

import lombok.Data;

@Data
@Alias("bdto")
public class MemberDto {
	
	private String num;
	private String name;
	private String id;
	private String pass;
	private String hp;
	private String addr;
	private String email;
	private Timestamp gaipday;

}
