package zikcam.product.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	public List<Map<String, Object>> selectPurchaseList(Map<String, Object> map) throws Exception {
		return orderDAO.selectPurchaseList(map);
	}
	
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception {
		return orderDAO.selectRentalList(map);
	}
	
	public void deleteCartProduct(Map<String, Object> map) throws Exception {
		orderDAO.deleteCartProduct(map);
	}
	
	public void updateProdCount(Map<String, Object> map) throws Exception {
		orderDAO.updateProdCount(map);
	}
	
	public void updateCartDel(Map<String, Object> map) throws Exception {
		orderDAO.updateCartDel(map);
	}
	
	public Map<String, Object> selectMemberInform(Map<String, Object> map) throws Exception {
		return orderDAO.selectMemberInform(map);
	}
	
	public void insertBorder(Map<String, Object> map)  throws Exception {
		orderDAO.insertBorder(map);
	}
	
	public Map<String, Object> selectLastOrderNum(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastOrderNum(map);
	}
	
	public void insertDorder(Map<String, Object> map)  throws Exception {
		orderDAO.insertDorder(map);
	}
	
	public void insertDorderWithNull(Map<String, Object> map)  throws Exception {
		orderDAO.insertDorderWithNull(map);
	}
	
	public List<Map<String, Object>> selectCartWithoutDel(Map<String, Object> map) throws Exception {
		return orderDAO.selectCartWithoutDel(map);
	}
}