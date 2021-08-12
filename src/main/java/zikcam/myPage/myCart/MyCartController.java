package zikcam.myPage.myCart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zikcam.common.map.CommandMap;
import zikcam.product.order.OrderService;


@Controller
@RequestMapping("/myPage")
public class MyCartController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//myCart
	@RequestMapping(value="/myCartList")
	public String myCartList(Map<String, Object> commandMap, Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list1 = orderService.selectPurchaseList(test);
		List<Map<String, Object>> list2 = orderService.selectRentalList(test);
		Map<String, Object> list3 = orderService.selectMemberInform(test);
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("temp",test);
		
		return "/myCartList";
	}
	
	@RequestMapping(value="/myCartUpdate", method=RequestMethod.POST)
	public String myCartUpdate(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		orderService.updateProdCount(commandMap.getMap());
		return "redirect:/myPage/myCartList";
	}
	
	@RequestMapping(value="/myCartUpdateDel", method=RequestMethod.POST)
	public String myCartUpdateDel(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		orderService.updateCartDel(commandMap.getMap());
		return "redirect:/myPage/myCartList";
	}
	
	@RequestMapping(value="/myCartOneDelete")
	public String myCartOneDelete(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		orderService.deleteCartProduct(commandMap.getMap());
		return "redirect:/myPage/myCartList";
	}
	
	@ResponseBody
	@RequestMapping(value="/myCartDelete")
	public String myCartDelete(@RequestBody ArrayList<Map<String, Object>> list, Model model, HttpServletRequest request) throws Exception {
		Iterator it = list.iterator();

		while(it.hasNext()) {
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) it.next();
			orderService.deleteCartProduct(map);
		}
		
		return "redirect:/myPage/myCartList";
	}
}
