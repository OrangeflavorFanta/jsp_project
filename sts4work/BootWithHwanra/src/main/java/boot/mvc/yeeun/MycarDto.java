package boot.mvc.yeeun;


import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MycarDto")
public class MycarDto {

	private String num;
	private String carname;
	private int carprice;
	private String carcolor;
	private String carguip;
	private Timestamp guipday;
}
