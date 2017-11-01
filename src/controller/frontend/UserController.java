package controller.frontend;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.BankTypeService;
import service.TradeService;
import service.UserService;
import service.backend.Msg_pushMapperService;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import pojo.Bank_Type;
import pojo.Msg_push;
import pojo.Trade_record;
import pojo.User;
import pojo.User_property;
import service.UserService;
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
		User user = this.updateUserSession(request, response);
		User_property user_property = null;
		try {
			user_property = userService.getUserProperty(user.getId());
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		boolean flag = false; // 用来判断充值成功标志
		PrintWriter out = null;
		Object json = null;
		int updateBalanceResult = -1; // 更新余额判断
		int addResult = -1; // 添加充值记录判断
		try {
			out = response.getWriter();
			if (user.getBankName() != bankName || user_property == null) {
				json = JSON.toJSON(flag);
				out.print(json);
			} else {
				double updateBalance = user_property.getBalance() + pay_amount;
				updateBalanceResult = userService.rechange(user.getId(), updateBalance);
				flag = updateBalanceResult > 0 ? true : false;
				if (updateBalanceResult > 0) {
					// 用户余额已发生改变，一并添加充值记录以及消息记录
					// 添加交易记录
					Trade_record trade_record = new Trade_record();
					trade_record.setUserId(user.getId());
					trade_record.setTradeDate(new Date());
					trade_record.setTradeMoney(pay_amount);
					trade_record.setTradeStatus(2); //交易状态(1:未完成2:已完成)
					trade_record.setTradeTypeId(2); //交易类型(1:投资2:充值3:提现)
					addResult = tradeService.addTradeRecord(trade_record);
					flag = addResult > 0 ? true : false;

					// 添加消息
					Msg_push msg_push = new Msg_push();
					String dateTime = DateUtils.dateTimeFormat(new Date());
					Date releaseDate = DateUtils.fDateTime(new Date());
					msg_push.setContent("您在" + dateTime + "成功充值了" + pay_amount + "元！");
					msg_push.setMsgType(1); // msgType 类型(1:充值2:提现3:积分兑现4:公告)
					msg_push.setReleaseDate(releaseDate);
					msg_push.setTitle("用户充值消息");
					msg_push.setUserId(user.getId());
					addResult = msgService.addMsg_push(msg_push);
					flag = addResult > 0 ? true : false;
				}
				json = JSON.toJSON(flag);
				out.print(json);
			}
			System.out.println("用户余额更改情况(1为成功)>>" + updateBalanceResult + ">>用户交易记录添加情况(1为成功)>>" + addResult);
			out.flush();
			out.close();
		} catch (Exception e) {
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
		User user = this.updateUserSession(request, response);
		User_property user_property = null;
		try {
			user_property = userService.getUserProperty(user.getId());
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		boolean flag = false; // 用来判断提现成功标志
		PrintWriter out = null;
		Object json = null;
		int updateBalanceResult = -1; // 更新余额判断
		int addResult = -1; // 添加提现记录判断
		try {
			out = response.getWriter();
			if (!user.getExchangePassword().equals(exchangePassword) || user_property.getBalance()<pay_amount) {
				json = JSON.toJSON(flag);
				out.print(json);
			} else {
				double updateBalance = user_property.getBalance() - pay_amount - user_property.getWithdrawMoney();
				if(updateBalance > 0){
					updateBalanceResult = userService.rechange(user.getId(), updateBalance);
				}else{
					flag = false;
					updateBalanceResult = -1;
				}
				flag = updateBalanceResult > 0 ? true : false;
				if (updateBalanceResult > 0) {
					// 用户余额已发生改变，一并添加提现记录以及消息记录
					// 添加交易记录
					Trade_record trade_record = new Trade_record();
					trade_record.setUserId(user.getId());
					trade_record.setTradeDate(new Date());
					trade_record.setTradeMoney(pay_amount);
					trade_record.setTradeStatus(2); //交易状态(1:未完成2:已完成)
					trade_record.setTradeTypeId(3); //交易类型(1:投资2:充值3:提现)
					addResult = tradeService.addTradeRecord(trade_record);
					flag = addResult > 0 ? true : false;
					System.out.println("用户余额更改情况(1为成功)>>" + updateBalanceResult +"用户交易记录添加情况(1为成功)>>" + addResult);
					// 添加消息
					Msg_push msg_push = new Msg_push();
					String dateTime = DateUtils.dateTimeFormat(new Date());
					Date releaseDate = DateUtils.fDateTime(new Date());
					msg_push.setContent("您在" + dateTime + "成功提现了" + pay_amount + "元！");
					msg_push.setMsgType(2); // msgType 类型(1:充值2:提现3:积分兑现4:公告)
					msg_push.setReleaseDate(releaseDate);
					msg_push.setTitle("用户提现消息");
					msg_push.setUserId(user.getId());
					addResult = msgService.addMsg_push(msg_push);
					flag = addResult > 0 ? true : false;
				}
				json = JSON.toJSON(flag);
				out.print(json);
			}
			System.out.println("用户提现消息添加情况(1为成功)>>" + addResult);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/setExchangePassword.html", method = RequestMethod.POST)
	@ResponseBody
	public void setExchangePassword(@RequestParam int id, @RequestParam String password, HttpServletRequest request,
			HttpServletResponse response) {

		String exchangePassword = H5Utils.Hex5(password);
		System.out.println("进入验证方法" + exchangePassword);
		User user = new User();
		user.setId(id);
		user.setExchangePassword(exchangePassword);
		int i = 0;
		try {
			i = userService.updateExchangePassword(user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			PrintWriter out = response.getWriter();
			String str = JSON.toJSONString(i);
			out.println(str);
			System.out.println("str>>" + str);
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
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
	public String jumpToRecharge(@RequestParam(value = "pageIndex", required = false) Integer pageIndex,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = this.updateUserSession(request, response);
		Trade_record tradeRecord = new Trade_record();
		tradeRecord.setTradeTypeId(2); // 类别为充值
		tradeRecord.setUserId(user.getId());
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}
		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = tradeService.getTradeRecordNums(tradeRecord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 总页数
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		// 控制首页和尾页
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		model.addAttribute("pages", pages);
		try {
			this.getUserPropertyBeforeJump(request, response, model);
			this.getTradeRecords(tradeRecord, currentPageNo, pageSize, request, response, model);
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
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}
		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = tradeService.getTradeRecordNums(tradeRecord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 总页数
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		// 控制首页和尾页
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		model.addAttribute("pages", pages);
		
		Bank_Type bank_Type = null;
		try {
			this.getUserPropertyBeforeJump(request, response, model);
			bank_Type = this.getUserBankNameByUserId(request, response);
			this.getTradeRecords(tradeRecord, currentPageNo, pageSize, request, response, model);
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
	public String jumpToMyInvest(@RequestParam(value = "pageIndex", required = false) Integer pageIndex,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("携带用户资产（余额）/ 持有资产 信息在进入账户中心--我的投资页面>>>>>");
		User user = this.updateUserSession(request, response);
		Trade_record tradeRecord = new Trade_record();
		tradeRecord.setTradeTypeId(1); // 类别为投资
		tradeRecord.setUserId(user.getId());
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}
		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = tradeService.getTradeRecordNums(tradeRecord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 总页数
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		// 控制首页和尾页
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		model.addAttribute("pages", pages);
		
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
			@RequestParam(value = "pageIndex", required = false) Integer pageIndex, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println("携带用户消息列表集合 信息在进入账户中心--消息>>>>>");
		// 页面容量
		int pageSize = Constants.pageSize;
		// 当前页码
		Integer currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}

		// 消息类型
		Integer msgType1 = 0;
		if (msgType != null) {
			msgType1 = Integer.valueOf(msgType);
		}
		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = msgService.count();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 总页数
		PageSupport pages = new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		// 控制首页和尾页
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		model.addAttribute("pages", pages);
		try {
			this.getMessageList(msgType1, currentPageNo, pageSize, request, response, model);
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
		model.addAttribute("msgList", msgList1);
	}

	/**
	 * 通用更新用户的方法
	 * 
	 * @param request
	 */
	public User updateUserSession(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute(Constants.USER_SESSION);
		if (user == null) {
			try {
				request.getRequestDispatcher("500.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return user;
	}
}
