package zikcam.adminPage.rental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminRentalController {
	
	@Resource(name="adminRentalService")
	private AdminRentalService adminRentalService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//rental
	
	
}
