package zikcam.myPage.myOrder;

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
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;
import zikcam.myPage.myOrder.MyOrderService;

@Controller
@RequestMapping("/myPage")
public class MyOrderController {
	
	@Resource(name="myOrderService")
	private MyOrderService myOrderService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	//myOrder
	@RequestMapping(value = "/myOrderList")
	public ModelAndView myOrderList(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myOrderList");

		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		return mv;
	}
	
	@RequestMapping(value = "/selectMyOrderList")
	public ModelAndView selectMyOrderList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));

		List<Map<String, Object>> orderlist = myOrderService.selectOrderList(commandMap.getMap());
		mv.addObject("orderlist", orderlist);
		if(orderlist.size() > 0){ 
			mv.addObject("TOTAL", orderlist.get(0).get("TOTAL_COUNT")); 
			} else{ 
				mv.addObject("TOTAL", 0); 
				}
		return mv;
	}
	
	
	
	@RequestMapping(value = "/myOrderDetail")
	public ModelAndView myOrderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myOrderDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println("detail" +commandMap.getMap());
		Map<String, Object> orderdetailstatus = myOrderService.selectOrderDetailStatus(commandMap.getMap());
		Map<String, Object> rentalDate = myOrderService.rentalDate(commandMap.getMap());
		List<Map<String, Object>> porderdetail = myOrderService.selectPOrderDetail(commandMap.getMap());
		List<Map<String, Object>> rorderdetail = myOrderService.selectROrderDetail(commandMap.getMap());
		
		mv.addObject("orderdetailstatus", orderdetailstatus);
		mv.addObject("rentalDate", rentalDate);
		mv.addObject("porderdetail", porderdetail);
		mv.addObject("rorderdetail", rorderdetail);

		return mv;
	}
	
	@RequestMapping(value = "/myOrderDeletePart")
	public ModelAndView myOrderDeletePart(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myOrderDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myOrderService.deletePart(commandMap.getMap());
		mv.addObject("ORDER_NUM", commandMap.get("ORDER_NUM"));
		return mv;
	}
	@RequestMapping(value = "/myOrderDeleteAll")
	public ModelAndView myOrderDeleteAll(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myOrderList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myOrderService.deleteAll(commandMap.getMap());
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/myOrderRefundForm", method = RequestMethod.GET)
	public String myOrderRefundForm(Model model) {
		return "/myOrderRefundForm";
	}
	
}