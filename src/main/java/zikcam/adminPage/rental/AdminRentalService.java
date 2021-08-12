package zikcam.adminPage.rental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminRentalService")
public class AdminRentalService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminRentalDAO")
	private AdminRentalDAO adminRentalDAO;
}