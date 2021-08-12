package zikcam.product.rental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("rentalService")
public class RentalService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="rentalDAO")
	private RentalDAO rentalDAO;
}