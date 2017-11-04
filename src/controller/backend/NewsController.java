package controller.backend;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.News;
import service.backend.NewsService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class NewsController {
	@Resource
	private NewsService newsService;
	
	/**
	 * 信息列表
	 * @return
	 */
	@RequestMapping("/Information.html")
	public String informationlist(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<News> news=null;
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
				totalCount = newsService.count();
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
				news =newsService.getNewsList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("pages", pages);
			model.addAttribute("news", news);
		
		return "backend/infoCenter/Informationlist";
	}
	
	/**
	 * 根据Id查询单个信息详情
	 * @throws Exception 
	 * @throws NumberFormatException 
	 */
	 @RequestMapping(value="/getNews",method=RequestMethod.GET)  
  		public String getnew( String id,Model model) throws NumberFormatException, Exception{  
		 List<News> list= newsService.findNewsById(Integer.parseInt(id));
		  /*News news=null;
		  for (News news2 : list) {
			  if (news2.getId() == news.getId()) {
					news=news2;
				}
		}*/
		 
		 model.addAttribute("news", list.get(0));
        return "/backend/infoCenter/showInfo";  
    } 
	
	/**
	 * 根据id删除
	 */
	 @RequestMapping(value="/delNews.json")
		public void delNews(@RequestParam String id,HttpServletResponse response) throws Exception{
			boolean flag = newsService.deleteNewsById(Integer.parseInt(id));			
			PrintWriter writer=response.getWriter();
			writer.println(flag);
			writer.flush();
			writer.close();
		}
	 
	 /**
	  * 修改跳转到修改页面
	  */
	 @RequestMapping(value="/modifyNews",method=RequestMethod.GET)
		public String updateMews(String id,Model model) throws Exception{
		 System.err.println("进入信息修改页面");
		  	News news=newsService.getNewsById(Integer.parseInt(id));
			model.addAttribute("news",news);
			return "backend/infoCenter/updateInfomation";
		}
	 
	 /**
	  * 修改并保存跳转到信息列表
	  */
	 @RequestMapping(value="/updateNews",method=RequestMethod.POST)  
	    public String updateNews(News news,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		 news.setReleaseDate(new Date());
		 int num = newsService.modifyNews(news); 
		  if (num > 0) {
	    		List<News> list = newsService.getNewsList(1, 5);
	    		request.setAttribute("news", list);  	
	    		System.out.println("yes");
			} else {
				System.out.println("no");
				request.getRequestDispatcher("500.jsp").forward(request, response);
				
			}
	      return "redirect:Information.html";  	        
	    }

}
