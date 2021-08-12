package zikcam.product.order;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPurchaseList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectPurchaseList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectRentalList",map);
	}
	
	public void deleteCartProduct(Map<String, Object> map) throws Exception{
		delete("order.deleteCartProduct",map);
	}
	
	public void updateProdCount(Map<String, Object> map) throws Exception{
		update("order.updateProdCount",map);
	}
	
	public void updateCartDel(Map<String, Object> map) throws Exception{
		update("order.updateCartDel",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInform(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectMemberInform",map);
	}
	
	public void insertBorder(Map<String, Object> map) throws Exception {
		insert("order.insertBorder",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLastOrderNum(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectLastOrderNum",map);
	}
	
	public void insertDorder(Map<String, Object> map) throws Exception {
		insert("order.insertDorder",map);
		
	}public void insertDorderWithNull(Map<String, Object> map) throws Exception {
		insert("order.insertDorderWithNull",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartWithoutDel(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectCartWithoutDel",map);
	}
}