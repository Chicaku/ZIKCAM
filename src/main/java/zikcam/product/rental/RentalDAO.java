package zikcam.product.rental;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("rentalDAO")
public class RentalDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

}