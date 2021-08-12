package zikcam.product.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/prod")
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	//Logger log = Logger.getLogger(this.getClass());
	
	
	//order
	@RequestMapping(value="/order")
	public ModelAndView order(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/order");
		/*
		 * Map<String, Object> test = new HashMap<String, Object>();
		 * test.put("MEMBER_ID", "member02"); test.put("RENTAL_START", "2021-06-26");
		 * test.put("RENTAL_END", "2021-07-04");
		 */
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list1 = orderService.selectPurchaseList(commandMap.getMap());
		List<Map<String, Object>> list2 = orderService.selectRentalList(commandMap.getMap());
		Map<String, Object> list3 = orderService.selectMemberInform(commandMap.getMap());
		
		
		
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		
		
		
		System.out.println(commandMap);
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/orderTable", method = RequestMethod.POST)
	public String orderTable(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		orderService.insertBorder(commandMap.getMap());
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));

		List<Map<String, Object>> cartList = orderService.selectCartWithoutDel(commandMap.getMap());
		Map<String, Object> lastOrderNum = orderService.selectLastOrderNum(null);
		
		System.out.println(cartList);
		System.out.println(lastOrderNum);
		
		for(int i = 0; i < cartList.size(); i++) {
			Map<String, Object> borderMap = new HashMap<String, Object>();
			borderMap.putAll(commandMap.getMap());
			borderMap.put("ORDER_NUM", lastOrderNum.get("ORDER_NUM"));
			borderMap.put("PROD_NUM", cartList.get(i).get("PROD_NUM"));
			borderMap.put("PROD_COUNT", cartList.get(i).get("PROD_COUNT"));
			
			String pay = String.valueOf(commandMap.get("ORDER_PAYTYPE"));

			if (pay.equals("무통장 입금")) {
				borderMap.put("ORDER_STATUS", "입금 대기중");
			} else {
				borderMap.put("ORDER_STATUS", "상품 준비중");
			}
			
			String rental = String.valueOf(cartList.get(i).get("CART_RENTAL"));
			
			if (rental.equals("0")) {
				orderService.insertDorderWithNull(borderMap);
			} else {
				orderService.insertDorder(borderMap);
			}
		}
		
		
		return "/orderTable";
	}
	
	@RequestMapping(value="/orderPay", method = RequestMethod.GET)
	public String orderPay(Model model) {
		return "/orderPay";
	}
	
	@RequestMapping(value="/orderPaySuccess", method = RequestMethod.GET)
	public String orderPaySuccess(Model model) {
		return "/orderPaySuccess";
	}
	
	@RequestMapping(value="/orderPayFail", method = RequestMethod.GET)
	public String orderPayFail(Model model) {
		return "/orderPayFail";
	}
}