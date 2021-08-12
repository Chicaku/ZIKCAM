//package zikcam.product.product;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//@RequestMapping("/prod")
//public class ProductController {
//	
//	@Resource(name="productService")
//	private ProductService productService;
//	
//	Logger log = Logger.getLogger(this.getClass());
//	
//	//purchase
//	@RequestMapping(value="/main", method = RequestMethod.GET)
//	public String main(Model model) {
//		return "/main";
//	}
//	
//	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
//	public String productDetail(Model model) {
//		return "/productDetail";
//	}
//	
//}
//
//
package zikcam.product.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/prod")
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//purchase
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model) {
		return "/main";
	}
	
	// 구매상품 상세보기
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public ModelAndView productDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/productDetail");
		
		Map<String,Object> map = productService.selectProductDetail(commandMap.getMap());
		System.out.println(commandMap.getMap());
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		mv.addObject("map", map.get("map"));
		
		/*
		 * Map<String, Object> list = productService.selectProductInform(test);
		 * List<Map<String, Object>> list2 = productService.selectProductReview(test);
		 * List<Map<String, Object>> list3 = productService.selectProductQuestion(test);
		 */
		
		
		return mv;
	}
	
	// 대여상품 상세보기
	@RequestMapping(value="/productDetail2", method = RequestMethod.GET)
	public String productDetail2(Model model) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		test.put("PROD_NUM", "1");
		test.put("FIRST_DAY", "2021-06-26");
		test.put("LAST_DAY", "2021-07-04");
		
		Map<String, Object> list = productService.selectProductInform(test);
		List<Map<String, Object>> list2 = productService.selectProductReview(test);
		List<Map<String, Object>> list3 = productService.selectProductQuestion(test);
		Map<String, Object> list4 = productService.selectDayStock(test);
		
		model.addAttribute("list",list);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		
		return "/productDetail2";
	}
	
	@ResponseBody
	@RequestMapping(value="/insertCart", method = RequestMethod.POST)
	public String insertCart(CommandMap commandMap, Model model) throws Exception {
		Map<String, Object> map = productService.selectCart(commandMap.getMap());
		
		if (map ==null) {
			productService.insertCart(commandMap.getMap());
		}
		else {
			productService.updateCart(commandMap.getMap());
		}
		return "/insertCart";
	}
	@RequestMapping(value="/purchaseTent", method = RequestMethod.GET)
	public String purchaseTent(Model model) {
		return "/purchaseTent";
	}
	
	@RequestMapping(value="/purchaseMatt", method = RequestMethod.GET)
	public String purchaseMatt(Model model) {
		return "/purchaseMatt";
	}
	
	@RequestMapping(value="/purchaseTable", method = RequestMethod.GET)
	public String purchaseTable(Model model) {
		return "/purchaseTable";
	}
	
	@RequestMapping(value="/purchaseEtc", method = RequestMethod.GET)
	public String purchaseEtc(Model model) {
		return "/purchaseEtc";
	}
}