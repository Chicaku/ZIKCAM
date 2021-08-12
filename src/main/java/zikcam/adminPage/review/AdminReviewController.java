package zikcam.adminPage.review;

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
public class AdminReviewController {
	
	@Resource(name="adminReviewService")
	private AdminReviewService adminReviewService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//review
	
	@RequestMapping(value="/reviewList")
	public ModelAndView reviewList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("/reviewList");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		request.setAttribute("formSortType", formSortType);
		
		return mv;
	}
	
	@RequestMapping(value="/selectReviewList") 
	public ModelAndView selectReviewList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		request.setAttribute("formSortType", formSortType);
		
		List<Map<String,Object>> list = adminReviewService.adReviewList(commandMap.getMap(), keyword, searchType, sortType, formSortType); 
		mv.addObject("list", list); 
		mv.addObject("sortType", sortType);
		mv.addObject("formSortType", formSortType);
		
		System.out.println("검색어: " + keyword); 
		System.out.println("검색타입: " + searchType); 
		System.out.println("카테고리: " + sortType); 
		System.out.println("카테고리: " + formSortType); 
		System.out.println(commandMap.getMap());
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}
	
	@RequestMapping(value="/reviewDetail")
	public ModelAndView reviewDetail(CommandMap commandMap, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("/reviewDetail");
		Map<String, Object> map = adminReviewService.adReviewDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
}
