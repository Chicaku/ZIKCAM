package zikcam.adminPage.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Resource(name="adminUserService")
	private AdminUserService adminUserService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//userInfo
	
	@RequestMapping(value="/userList")
	public ModelAndView userList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword,
			@RequestParam(value = "searchType", defaultValue="") String searchType,
			HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("/userList");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		
		return mv;
	}
	
	@RequestMapping(value="/selectUserList") 
	public ModelAndView selectUserList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword,
			@RequestParam(value = "searchType", defaultValue="") String searchType,
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		
		List<Map<String,Object>> list = adminUserService.adUserList(commandMap.getMap(), keyword, searchType); 
		mv.addObject("list", list); 
		
		//작업이 끝난 후 삭제할 것
		System.out.println("검색어: " + keyword); 
		System.out.println("검색타입: " + searchType); 
		System.out.println(commandMap.getMap());
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}

	@RequestMapping(value="/userDetail")
	public ModelAndView userDetail(CommandMap commandMap)throws Exception {
		ModelAndView mv = new ModelAndView("/userDetail");
		Map<String, Object> map = adminUserService.adUserDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/userModify")
	public ModelAndView updateUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/userList");
		adminUserService.adUserModify(commandMap.getMap());
		return mv;
	}
}
