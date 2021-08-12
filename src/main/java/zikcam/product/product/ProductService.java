//package zikcam.product.product;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Service;
//
//@Service("productService")
//public class ProductService {
//	Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="productDAO")
//	private ProductDAO productDAO;
////
////	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
////		return purchaseDAO.selectMainProductList(param);
////	}
////
////	public List<Map<String, Object>> allProductList(Map<String, Object> param) {
////		return purchaseDAO.selectAllProductList(param);
////	}
//}


package zikcam.product.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="productDAO")
	private ProductDAO productDAO;
//
//	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
//		return purchaseDAO.selectMainProductList(param);
//	}
//
//	public List<Map<String, Object>> allProductList(Map<String, Object> param) {
//		return purchaseDAO.selectAllProductList(param);
//	}
	
	public Map<String, Object> selectProductInform(Map<String, Object> map) throws Exception {
		return productDAO.selectProductInform(map);
	}
	
	public List<Map<String, Object>> selectProductReview(Map<String, Object> map) throws Exception {
		return productDAO.selectProductReview(map);
	}
	
	public List<Map<String, Object>> selectProductQuestion(Map<String, Object> map) throws Exception {
		return productDAO.selectProductQuestion(map);
	}
	
	public void insertCart(Map<String, Object> map)  throws Exception {
		productDAO.insertCart(map);
	}
	
	public Map<String, Object> selectCart(Map<String, Object> map) throws Exception {
		return productDAO.selectCart(map);
	}
	
	public void updateCart(Map<String, Object> map) throws Exception {
		productDAO.updateCart(map);
	}
	
	public Map<String, Object> selectDayStock(Map<String, Object> map) throws Exception {
		return productDAO.selectDayStock(map);
	}
	
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception {
		productDAO.updateHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = productDAO.selectProductDetail(map);
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
}