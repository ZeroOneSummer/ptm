package controller.frontend;


import javax.annotation.Resource;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.BankTypeService;
import service.InvestProductService;
import service.TradeService;
import service.UserService;
import service.backend.Msg_pushMapperService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import pojo.Bank_Type;
import pojo.Msg_push;
import pojo.Trade_record;
import pojo.User;
import pojo.User_property;
import pojo.view.Invest_msg;
import utils.Constants;
import utils.DateUtils;
import utils.H5Utils;
import utils.PageSupport;

/**
 * 用户操作
 * 
 * @author Administrator
 *
 */
@Controller
/* @RequestMapping("/user") */
public class UserController {

	@Resource
	private UserService userService;

	@Resource
	private TradeService tradeService;

	@Resource
	private BankTypeService bankTypeService;

	@Resource
	private Msg_pushMapperService msgService;
	
	@Resource
	private InvestProductService investProductService;

	/**
	 * 用户充值（模拟充值，未调用外部接口） 关键点：余额添加，添加充值记录
	 * 
	 * @param pay_amount
	 *            充值金额
	 * @param bankName
	 *            充值银行名称 模拟实现暂时假定充值银行必须和数据库用户绑定银行名称一致！
	 * @param exchangePassword
	 *            银行交易密码
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/doRecharge", method = RequestMethod.POST)
	public void doRecharge(@RequestParam double pay_amount, @RequestParam int bankName,
			@RequestParam(value = "exchangePassword", required = false) String exchangePassword,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("进入充值业务方法，传入参数:pay_amount>>" + pay_amount + ">>" + bankName);
		boolean flag = false; // 用来判断充值成功标志
		PrintWriter out = null;
		Object json = null;
		try {
			out = response.getWriter();
			// 用户余额已发生改变，一并添加充值记录以及消息记录
			int addResult = -1; // 添加充值记录判断
			User user = this.updateUserSession(request, response);
			if(pay_amount <= 0 || bankName <=0){
				flag = false;
			} else {
				//当参数不为空的时候，赋值给对象
				User_property user_property = userService.getUserProperty(user.getId());
				
				if (user.getBankName() != bankName || user_property == null) {
					flag = false;
				} else {
					double updateBalance = user_property.getBalance() + pay_amount;
					user_property.setBalance(updateBalance);
					String dateTime = DateUtils.dateTimeFormat(new Date());
					Date date = DateUtils.fDateTime(new Date());
					
					// 添加交易记录
					Trade_record trade_record = new Trade_record();
					trade_record.setUserId(user.getId());
					trade_record.setTradeDate(date);
					trade_record.setTradeMoney(pay_amount);
					trade_record.setTradeStatus(2); //交易状态(1:未完成2:已完成)
					trade_record.setTradeTypeId(2); //交易类型(1:投资2:充值3:提现)
					
					// 添加消息
					Msg_push msg_push = new Msg_push();
					msg_push.setContent("您在" + dateTime + "成功充值了" + pay_amount + "元！");
					msg_push.setMsgType(1); // msgType 类型(1:充值2:提现3:积分兑现4:公告)
					msg_push.setReleaseDate(date);
					msg_push.setTitle("用户充值消息");
					msg_push.setUserId(user.getId());
					
					addResult = userService.addRechangeAndWithdrawDeposit(user_property, msg_push, trade_record);
					flag = addResult > 0 ? true : false;
					
				}
			}
			System.out.println("充值最后执行结果flag>>"+flag);
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}finally {
			System.out.println("（模拟充值，未调用外部接口）发生异常");
			json = JSON.toJSON(flag);
			out.print(json);
			out.flush();
			out.close();
		}
	}
	
	
	
	/**
	 * 修改登录密码
	 * @param id
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/updateLoginPassword.html",method=RequestMethod.POST)
	@ResponseBody
    public void updateLoginPassword(@RequestParam int id,
    		@RequestParam String password,
    		HttpServletRequest request,
    		HttpServletResponse response){
		
		String loginPassword= H5Utils.Hex5(password);
    	User user=new User();
    	user.setId(id);
    	user.setPassword(loginPassword);
    	int i=0;
    	try {
			i=userService.updatePassword(user);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	 try {
			PrintWriter out= response.getWriter();
			String str=JSON.toJSONString(i);
			out.println(str);
			System.out.println("str>>"+str);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

	/**
	 * 设置/修改交易密码
	 * @param id
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/updateExchangePassword.html",method=RequestMethod.POST)
	@ResponseBody
    public void updateExchangePassword(@RequestParam int id,
    		@RequestParam String password,
    		HttpServletRequest request,
    		HttpServletResponse response){
		
		String exchangePassword= H5Utils.Hex5(password);
		System.out.println("进入交易密码设置/修改方法>>>>>>>>>>>>>>"+exchangePassword);
    	User user=new User();
    	user.setId(id);
    	user.setExchangePassword(exchangePassword);
    	int i=0;
    	try {
			i=userService.updateExchangePassword(user);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	 try {
			PrintWriter out= response.getWriter();
			String str=JSON.toJSONString(i);
			out.println(str);
			System.out.println("str>>"+str);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

	/**
	 * 用户提现（模拟提现，未调用外部接口） 关键点：余额减少，添加提现记录
	 * 
	 * @param pay_amount
	 *            充值金额
	 * @param exchangePassword
	 *        银行交易密码
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/doWithdrawDeposit")
	public void doWithdrawDeposit(@RequestParam double pay_amount,
			@RequestParam(value = "exchangePassword", required = false) String exchangePassword,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("进入模拟提现方法，传入参数:pay_amount>>" + pay_amount + ">>exchangePassword>>" + exchangePassword);
		boolean flag = false; // 用来判断提现成功标志
		PrintWriter out = null;
		Object json = null;
		try {
			out = response.getWriter();
			// 用户余额已发生改变，一并添加提现记录以及消息记录
			int addResult = -1; // 添加提现记录判断
			User user = this.updateUserSession(request, response);   //获取当前用户
			if(pay_amount <= 0 || StringUtils.isNullOrEmpty(exchangePassword)){
				flag = false;
			} else {
				//当参数不为空的时候，赋值给对象
				User_property user_property = userService.getUserProperty(user.getId());
				if (!user.getExchangePassword().equals(exchangePassword) || user_property.getBalance()<pay_amount) {
					flag = false;
				} else {
					double updateBalance = user_property.getBalance() - pay_amount;
					user_property.setBalance(updateBalance);
					String dateTime = DateUtils.dateTimeFormat(new Date());
					Date date = DateUtils.fDateTime(new Date());
					
					// 添加交易记录
					Trade_record trade_record = new Trade_record();
					trade_record.setUserId(user.getId());
					trade_record.setTradeDate(date);
					trade_record.setTradeMoney(pay_amount);
					trade_record.setTradeStatus(2); //交易状态(1:未完成2:已完成)
					trade_record.setTradeTypeId(3); //交易类型(1:投资2:充值3:提现)
					
					// 添加消息
					Msg_push msg_push = new Msg_push();
					msg_push.setContent("您在" + dateTime + "成功提现了" + pay_amount + "元！");
					msg_push.setMsgType(2); // msgType 类型(1:充值2:提现3:积分兑现4:公告)
					msg_push.setReleaseDate(date);
					msg_push.setTitle("用户提现消息");
					msg_push.setUserId(user.getId());
					
					addResult = userService.addRechangeAndWithdrawDeposit(user_property, msg_push, trade_record);
					flag = addResult > 0 ? true : false;
					
				}
			}
			System.out.println("提现最后执行结果flag>>"+flag);
		} catch (Exception e2) {
			e2.printStackTrace();
			
		}finally {
			System.out.println("（模拟提现，未调用外部接口）发生异常");
			json = JSON.toJSON(flag);
			out.print(json);
			out.flush();
			out.close();
		}
		
	}

	
	/**
	 * 携带用户资产（余额）/ 充值记录 信息 在进入充值页面
	 * 
	 * @param pageIndex
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpToRecharge.html")
	public String jumpToRecharge(@RequestParam(value = "currentPageNo", required = false) Integer currentPageNo,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("jumpToRecharge.html>>当前页--"+currentPageNo);
		User user = this.updateUserSession(request, response);
		Trade_record tradeRecord = new Trade_record();
		tradeRecord.setTradeTypeId(2); // 类别为充值
		tradeRecord.setUserId(user.getId());
		// 当前页码
		Integer pageIndex = 0;
		if (currentPageNo != null) {
			pageIndex = Integer.valueOf(currentPageNo);
		}
		// 页面容量
		int pageSize = Constants.pageSize+pageIndex;
		try {
			this.getUserPropertyBeforeJump(request, response, model);
			this.getTradeRecords(tradeRecord, 1, pageSize, request, response, model);
		} catch (Exception e) {
			System.out.println("携带用户资产（余额）/ 充值记录 信息 在进入充值页面 发生异常！");
		}
		return "frontend/personalCenter/recharge";
	}

	/**
	 * 携带用户资产（余额）/ 银行账户 / 提现记录 信息在进入提现页面
	 * 
	 * @param pageIndex
	 * @param request
	 * @param response
	 * @param model
	 *            封装用户资产,银行账户信息,提现记录
	 * @return
	 */
	@RequestMapping("/jumpToWithdrawDeposit.html")
	public String jumpToWithdrawDeposit(@RequestParam(value = "pageIndex", required = false) Integer pageIndex,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = this.updateUserSession(request, response);
		Trade_record tradeRecord = new Trade_record();
		tradeRecord.setTradeTypeId(3); // 类别为提现
		tradeRecord.setUserId(user.getId());
		// 当前页码
		Integer currentPageNo = 0;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}
		// 页面容量
		int pageSize = Constants.pageSize + currentPageNo;
		Bank_Type bank_Type = null;
		try {
			this.getUserPropertyBeforeJump(request, response, model);
			bank_Type = this.getUserBankNameByUserId(request, response);
			this.getTradeRecords(tradeRecord,1, pageSize, request, response, model);
		} catch (Exception e1) {
			System.out.println("携带用户资产（余额）/ 银行账户 / 提现记录 信息在进入提现页面 发生异常");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		model.addAttribute(Constants.USER_BANKNAME, bank_Type);
		return "frontend/personalCenter/withdrawDeposit";
	}

	/**
	 * 携带用户资产（余额）/ 持有资产 信息在进入账户中心--我的投资页面
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpToMyInvest.html")
	public String jumpToMyInvest(@RequestParam(value = "currentPageNo", required = false) Integer currentPageNo,
							@RequestParam(value = "invTypeId", required = false) Integer invTypeId,
							HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("携带用户资产（余额）/ 持有资产 信息在进入账户中心--我的投资页面>>>>>");
		System.out.println("jumpToMyInvest.html>>当前页--"+currentPageNo);
		User user = this.updateUserSession(request, response);
		Trade_record tradeRecord = new Trade_record();
		tradeRecord.setTradeTypeId(1); // 类别为投资
		tradeRecord.setUserId(user.getId());
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer pageIndex = 1;
		if (currentPageNo != null) {
			pageIndex = Integer.valueOf(currentPageNo);
		}
		
		//---------------------携带交易记录数据到个人中心---------------------
		PageSupport page1=new PageSupport();
		pageIndex=currentPageNo==null?1:currentPageNo;
		invTypeId=invTypeId==null?1:invTypeId;		
		page1.setCurrentPageNo(pageIndex);
		page1.setPageSize(3);
		int totalCount1 = investProductService.countInvest_msg(invTypeId);//交易表总记录数
		page1.setTotalCount(totalCount1);
		page1.setTotalPageCountByRs();
		List<Invest_msg> list1=investProductService.getInvest_msgList(invTypeId,(pageIndex-1)*page1.getPageSize(),page1.getPageSize());
		if (list1.size() == 0) {
			model.addAttribute(Constants.INVEST_MSG_LIST,null);
		}else {			
			model.addAttribute(Constants.INVEST_MSG_LIST,list1);
		}	
		model.addAttribute("page1",page1);
		model.addAttribute("invTypeId",invTypeId);
		//------------------------------------------------------------
		try {
			this.getUserPropertyBeforeJump(request, response, model);
			this.getNoFinishWithdrawDepositNum(request, response, model);
		} catch (Exception e) {
			System.out.println("携带用户资产（余额）/ 持有资产 信息在进入账户中心--我的投资页面发生异常");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return "frontend/personalCenter/myInvest";
	}

	/**
	 * 携带用户消息列表集合 信息在进入账户中心--消息
	 * 
	 * @param msgType
	 * @param currentPageNo
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpToMessageCenter.html")
	public String jumpToMessageCenter(@RequestParam(value = "msgType", required = false) Integer msgType,
			@RequestParam(value = "currentPageNo", required = false) Integer currentPageNo, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println("携带用户消息列表集合 信息在进入账户中心--消息>>>>>");
		System.out.println("jumpToMessageCenter.html>>当前页--"+currentPageNo);
		Msg_push msg_push = new Msg_push();
		User user = this.updateUserSession(request, response);
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer pageIndex = 1;
		if (currentPageNo != null) {
			pageIndex = Integer.valueOf(currentPageNo);
		}

		// 消息类型
		Integer msgType1 = 0;
		if (msgType != null) {
			msgType1 = Integer.valueOf(msgType);
		}
		
		msg_push.setMsgType(msgType1);   //消息类型
		msg_push.setUserId(user.getId());   //当前用户Id
		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = msgService.count(msg_push);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 总页数
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(pageIndex);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		pages.setTotalPageCountByRs();
		try {
			this.getMessageList(msgType1, pageIndex, pageSize, request, response, model);
		} catch (Exception e) {
			System.out.println("携带用户消息列表集合 信息在进入账户中心--消息 发生异常");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		model.addAttribute(Constants.MSGTYPE, msg_push.getMsgType());
		System.out.println("传送的消息类型"+msg_push.getMsgType());
		model.addAttribute(Constants.PAGE, pages);
		return "frontend/personalCenter/messageCenter";
	}

	/**
	 * 获取用户的财富信息（余额）
	 * 
	 * @param request
	 * @param response
	 * @param model
	 *            封装用户资产
	 * @return
	 * 
	 */
	public void getUserPropertyBeforeJump(HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = this.updateUserSession(request, response);
		User_property user_property = null;
		try {
			user_property = userService.getUserProperty(user.getId());
		} catch (Exception e) {
			System.err.println("获取用户资产表错误");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		model.addAttribute(Constants.USER_PROPERTY, user_property);
	}

	/**
	 * 获得当前用户的银行卡信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * 
	 */
	public Bank_Type getUserBankNameByUserId(HttpServletRequest request, HttpServletResponse response) {
		User user = this.updateUserSession(request, response);
		Bank_Type bank_Type = new Bank_Type();
		bank_Type.setBankCode(user.getBankName());
		try {
			bank_Type = bankTypeService.getUserBankNameByUserId(bank_Type);
		} catch (Exception e) {
			System.err.println("获取用户银行信息失败！");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return bank_Type;
	}

	/**
	 * 获得当前用户的未完成提现的数量
	 * 
	 * @param request
	 * @param response
	 * @param model
	 *            封装当前用户的未完成提现的数量
	 * @return
	 * 
	 */
	public void getNoFinishWithdrawDepositNum(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("获得当前用户的未完成提现的数量>>>>");
		User user = this.updateUserSession(request, response);
		Trade_record trade_record = new Trade_record();
		trade_record.setUserId(user.getId()); // 当前用户Id
		trade_record.setTradeStatus(1); // 交易状态未完成
		trade_record.setTradeTypeId(3); // 交易类型为提现
		System.out.println("trade_record传入参数>>" + trade_record.getUserId() + ">>" + trade_record.getTradeStatus() + ">>"
				+ trade_record.getTradeTypeId());
		int noFinishWithdrawDepositNum = -1;
		try {
			noFinishWithdrawDepositNum = tradeService.getTradeRecordNums(trade_record);
		} catch (Exception e) {
			System.out.println("未获取到用户目前提现交易未完成的数量");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		model.addAttribute("noFinishWithdrawDepositNum", noFinishWithdrawDepositNum);
	}

	/**
	 * 获得当前用户的交易记录情况
	 * 
	 * @param tradeRecord
	 * @param currentPageNo
	 * @param pageSize
	 * @param request
	 * @param response
	 * @param model
	 */
	public void getTradeRecords(Trade_record tradeRecord, Integer currentPageNo, Integer pageSize,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("获得当前用户的交易记录情况>>当前页码>>" + currentPageNo + ">>页面数量>>" + pageSize);
		System.out.println("tradeRecord:用户编号>>" + tradeRecord.getUserId() + ",产品编号>>" + tradeRecord.getProduceId()
				+ ">>交易状态>>" + tradeRecord.getTradeStatus() + ">>交易类型>>" + tradeRecord.getTradeTypeId());
		List<Trade_record> tradeRecords = null;
		try {
			tradeRecords = tradeService.getTradeRecords(tradeRecord, currentPageNo, pageSize);
		} catch (Exception e) {
			System.out.println("未获取到用户交易列表集合");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("查询到的集合长度为：" + tradeRecords.size());
		List<Trade_record> tradeRecords1 = tradeRecords.size() == 0 ? null : tradeRecords;
		model.addAttribute("tradeRecords", tradeRecords1);
	}

	/**
	 * 获得当前用户的消息列表集合
	 * 
	 * @param msgType
	 *            消息类型
	 * @param currentPageNo
	 *            起始位置
	 * @param pageSize
	 *            页面大小
	 * @param request
	 * @param response
	 * @param model
	 */
	public void getMessageList(Integer msgType, Integer currentPageNo, Integer pageSize, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println(
				"获得当前用户的消息列表集合>>>>传递参数msgType>>" + msgType + ">>当前页码>>" + currentPageNo + ">>页面数量>>" + pageSize);
		User user = this.updateUserSession(request, response);
		if(user == null){
			user = new User();
		}
		List<Msg_push> msgList = null;
		try {
			msgList = msgService.getMsgList(user.getId(), msgType, currentPageNo, pageSize);
		} catch (Exception e) {
			System.out.println("未获取到用户消息列表集合");
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		List<Msg_push> msgList1 = msgList.size() == 0 ? null : msgList;
		System.out.println("获取到公告记录共>>"+ msgList.size() + " 条！");
		model.addAttribute("msgList", msgList1);
	}

	/**
	 * 通用更新用户的方法
	 * 
	 * @param request
	 */
	public User updateUserSession(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute(Constants.USER_SESSION);
		return user;
	}
	
	/**
	 * 实名认证（模拟认证）
	 * @param idNumber
	 * @param userName
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/addIdNumber.html")
	public void addIdNumber(@RequestParam(value="id")int id,
			@RequestParam(value="idNumber")String idNumber,
			@RequestParam(value="userName")String userName,
			HttpServletRequest request,HttpServletResponse response){
		System.out.println("进入实名认证方法>>>>"+idNumber+">>>"+id);
		User user=new User();
		user.setId(id);
		user.setIdNumber(idNumber);
		user.setUserName(userName);
		int number=0;
		PrintWriter out=null;
		User user2=null;
		try {
			number=userService.addIdNumber(user);
			
			out=response.getWriter();
			String str=JSON.toJSONString(number);
			out.println(str);
			out.flush();
			out.close();
			System.out.println("验证结果：>>>>>>>>>>>"+number);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("实名认证错误！");
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 模拟绑定银行卡
	 * @param id
	 * @param backNumber
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/addBackNumber.html")
	public void addBackNumber(@RequestParam(value="id")int id,
			@RequestParam(value="backNumber")String bankNumber,
			HttpServletRequest request,HttpServletResponse response){
			//模拟设定银行编号-招商银行
			int backName=3001;
			User user=new User();
			user.setBankName(backName);
			user.setId(id);
			user.setBankNumber(bankNumber);
			int num=0;
			PrintWriter out=null;
			try {
				num=userService.addBackNumber(user);
				
				out=response.getWriter();
				String str=JSON.toJSONString(num);
				out.println(str);
				out.flush();
				out.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}


	/**
	 * 携带公告消息列表集合 信息在进入公告中心
	 * 
	 * @param currentPageNo
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/jumpToPublicNews.html")
	public String jumpToPublicNews(@RequestParam(value = "currentPageNo", required = false) Integer currentPageNo,
			HttpServletRequest request,
			HttpServletResponse response, Model model){
			System.out.println("携带公告消息列表集合 信息在进入公告中心>>>>>");
			System.out.println("jumpToPublicNews.html>>当前页--"+currentPageNo);
			Msg_push msg_push = new Msg_push();
			// 页面容量
			int pageSize = Constants.pageSize;
			// 当前页码
			Integer pageIndex = 1;
			if (currentPageNo != null) {
				pageIndex = Integer.valueOf(currentPageNo);
			}

			// 消息类型
			Integer msgType1 = 4;
			msg_push.setMsgType(msgType1);   //消息类型
			msg_push.setUserId(1);   //当前用户Id
			// 总数量（表）
			int totalCount = 0;
			try {
				totalCount = msgService.count(msg_push);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 总页数
			PageSupport pages = new PageSupport();
			pages.setCurrentPageNo(pageIndex);
			pages.setPageSize(pageSize);
			pages.setTotalCount(totalCount);
			pages.setTotalPageCountByRs();
			try {
				this.getMessageList(msgType1, pageIndex, pageSize, request, response, model);
			} catch (Exception e) {
				System.out.println("获取公告消息列表发生异常！");
				e.printStackTrace();
			}
			model.addAttribute(Constants.PAGE, pages);
			return "frontend/helpCenter/publicNews";//frontend/helpCenter/phoneNews
	}
	
	/**
	 * 进入具体的公告消息
	 * 
	 * @param currentPageNo
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/jumpToPhoneNews.html")
	public String jumpToPhoneNews(@RequestParam(value = "msgId", required = true) Integer msgId,
			HttpServletRequest request,
			HttpServletResponse response, Model model){
		System.out.println("进入具体的公告消息id>>>>>msgId="+ msgId);
		Msg_push tempMsg_push = new Msg_push();
		Msg_push msg_push = null;
		if(msgId == null){
			return "redirect:jumpToPublicNews.html";  //没有具体公告id，则重定向会公告中心
		}else{
			tempMsg_push.setId(msgId);   
		}
		try {
			msg_push = msgService.getMsg_pushById(tempMsg_push);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("根据Id查询到的公告为>>"+msg_push.getTitle());
		model.addAttribute("msg_push", msg_push);
		
		return "frontend/helpCenter/phoneNews";
	}
}
