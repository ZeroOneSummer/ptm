package controller.backend;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.User;
import service.backend.UserService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class UsersController {

	@Resource
	private UserService userBackendService;
	
	/**
	 * 用户列表查询
	 */
		@RequestMapping("/userList.html")
		public String getUserList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
			System.out.println("请求查询用户列表");
			List<User> userList=null;
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
					totalCount = userBackendService.count();
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
					userList =userBackendService.getUserList(currentPageNo, pageSize);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				model.addAttribute("userList", userList);
				model.addAttribute("pages", pages);
				
			return "backend/investorManager/UserList";
		}
	
	
	
	
	
}
