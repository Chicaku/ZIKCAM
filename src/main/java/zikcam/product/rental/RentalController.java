package zikcam.product.rental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zikcam.adminPage.order.AdminOrderService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/prod")
public class RentalController {
	
	@Resource(name="rentalService")
	private RentalService rentalService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	//rental
	@RequestMapping(value="/rentalDate", method = RequestMethod.GET)
	public String rentalDate(Model model) {
		return "/rentalDate";
	}
	
	@RequestMapping(value="/rentalTent", method = RequestMethod.GET)
	public String rentalTent(Model model) {
		return "/rentalTent";
	}
	
	@RequestMapping(value="/rentalMatt", method = RequestMethod.GET)
	public String rentalMatt(Model model) {
		return "/rentalDate";
	}
	
	@RequestMapping(value="/rentalTable", method = RequestMethod.GET)
	public String rentalTable(Model model) {
		return "/rentalDate";
	}
		
	
}
