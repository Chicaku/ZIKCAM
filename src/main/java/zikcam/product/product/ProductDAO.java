//package zikcam.product.product;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Repository;
//
//import zikcam.common.dao.AbstractDAO;
//
//@Repository("productDAO")
//public class ProductDAO extends AbstractDAO {
//	Logger log = Logger.getLogger(this.getClass());
////
////	public List<Map<String, Object>> selectMainProductList(Map<String, Object> param) {
////		return (List<Map<String, Object>>) selectList("purchaseProductList.selectMainProductList", param);
////	}
////
////	public List<Map<String, Object>> selectAllProductList(Map<String, Object> param) {
////		return (List<Map<String, Object>>) selectList("purchaseProductList.selectAllProductList", param);
////		// null값은 파라미터 값.
////	}
//
//}


package zikcam.product.product;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("productDAO")
public class ProductDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
//
//	public List<Map<String, Object>> selectMainProductList(Map<String, Object> param) {
//		return (List<Map<String, Object>>) selectList("purchaseProductList.selectMainProductList", param);
//	}
//
//	public List<Map<String, Object>> selectAllProductList(Map<String, Object> param) {
//		return (List<Map<String, Object>>) selectList("purchaseProductList.selectAllProductList", param);
//		// null값은 파라미터 값.
//	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProductInform(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("product.selectProductInform",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductReview(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectProductReview",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductQuestion(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("product.selectProductQuestion",map);
	}
	
	public void insertCart(Map<String, Object> map) throws Exception {
		insert("product.insertCart",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCart(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("product.selectCart",map);
	}
	
	public void updateCart(Map<String, Object> map) throws Exception{
		update("product.updateCart",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDayStock(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("product.selectDayStock",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("product.selectProductDetail", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("product.updateHitCount", map);
	}
}