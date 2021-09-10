package zikcam.myPage.myAccount;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/myPage")
public class MyAccountController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "myAccountService")
	private MyAccountService myAccountService;
	
	//myAccount
	
	@RequestMapping(value = "/myAccount")
	public ModelAndView openmyAccount(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myAccount");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(log.isDebugEnabled());
		log.debug("인터셉터");
		List<Map<String, Object>> list = myAccountService.selectAccount(commandMap);
		mv.addObject("list", list);
		return mv;
	}
	
	
	@RequestMapping(value="/myAccountModifyForm", method = RequestMethod.GET)
	public ModelAndView myAccountModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myAccountModify");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = myAccountService.selectAccountModify(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/myAccountModify", method = RequestMethod.POST)
	public ModelAndView myAccountModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myAccount");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		myAccountService.updateAccount(commandMap.getMap());
//		mv.addObject("MEMBER_NUM", commandMap.get("MEMBER_NUM"));

		return mv;
	}
	
	@RequestMapping(value="/myAccountPwCheck")
	public ModelAndView myAccountPwCheck(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myAccountPwCheck");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = myAccountService.selectAccountModify(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	
}
