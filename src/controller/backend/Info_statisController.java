package controller.backend;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Info_statis;
import service.backend.Info_statisService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class Info_statisController {
	@Resource
	private Info_statisService info_statisService;
	
	/**
	 * 累计统计表
	 * @return
	 */
	@RequestMapping("/statistics.html")
	public String statisticsList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<Info_statis> info=null;
		//页面容量
		int pageSize = Constants.pageSize;
		//当前页码
		Integer currentPageNo = 1;		
		if(pageIndex != null){
			try{
				currentPageNo = Integer.valueOf(pageIndex);
			}catch (NumberFormatException e) {
			e.printStackTrace();
			}
		}//if
			//总数量（表）
			int totalCount = 0;
			try {
				totalCount =info_statisService.count();
				System.out.println("数量："+totalCount);
			} catch (Exception e) {

				e.printStackTrace();
			}
			//总页数
			PageSupport pages = new PageSupport();
			pages.setCurrentPageNo(currentPageNo);
			pages.setPageSize(pageSize);
			pages.setTotalCount(totalCount);
			int totalPageCount = pages.getTotalPageCount();
			//控制首页和尾页
			if(currentPageNo < 1){
				currentPageNo = 1;
			}else if(currentPageNo > totalPageCount){
				currentPageNo = totalPageCount;	
			}//if
			try {
				info =info_statisService.getStatisList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pages", pages);
			model.addAttribute("info", info);
		
		return "backend/helpCenter/Statistics";
	}
	
}
