package zikcam.adminPage.qna;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;
import zikcam.adminPage.pq.*;

@Controller
@RequestMapping("/admin")
public class AdminQnAController {

	@Resource(name = "adminQnAService")
	private AdminQnAService adminQnAService;

	Logger log = Logger.getLogger(this.getClass());

	// QnA

	@RequestMapping(value = "/QnAList")
	public ModelAndView QnAList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/QnAList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}
	
	@RequestMapping(value="/selectQnAList") 
	public ModelAndView selectQnAList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		List<Map<String,Object>> list = adminQnAService.adQnAList(commandMap.getMap(), keyword, searchType); 
		mv.addObject("list", list); 
		
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

	@RequestMapping(value = "/QnADetail")
	public ModelAndView QnADetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/QnADetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = adminQnAService.adQnADetail(commandMap.getMap());
		Map<String, Object> sub = adminQnAService.adQnASubDetail(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("sub", sub);
		return mv;
	}

	@RequestMapping(value = "/QnAReply")
	public ModelAndView insertReply(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/QnAList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminQnAService.adQnAReplyWrite(commandMap.getMap());
		adminQnAService.adQnASwitch(commandMap.getMap());
		System.out.println(commandMap.getMap());
		return mv;
	}

}
