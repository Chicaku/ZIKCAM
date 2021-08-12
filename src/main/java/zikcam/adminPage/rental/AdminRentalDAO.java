package zikcam.adminPage.rental;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminRentalDAO")
public class AdminRentalDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

}