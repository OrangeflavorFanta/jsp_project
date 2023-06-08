package quiz2.fanta;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class fcontroller {

	@GetMapping("/fanta")
	public String fanta() {
		
		return "fanta/red";
	}
	
	@GetMapping("/blue")
	public String fanra2() {
		return "fanta/red";
	}
	
}
