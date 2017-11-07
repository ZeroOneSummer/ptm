package controller.backend;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
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
	
	/**
	 * 导出excel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/write.html")
	public void export(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<Info_statis> list=info_statisService.getInfo_statis();
		String[] title = {"编号", "月统计时间", "本月交易金额（元）","累计交易金额（元）","累计用户数","累计收益（元）"};

		try {
			//String templateFileName = request.getSession().getServletContext().getRealPath(累计收益（元）"/") + "templates/user.xls";
			
			response.reset();
			response.setContentType("application/msexcel");
			response.setContentType("application/octet-stream");
			String dateStr = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			response.setHeader("Content-disposition","attachment;  filename=\""  + URLEncoder.encode(dateStr + ".xls", "utf-8") + "\"");
			
			// 创建一个工作簿
			OutputStream os=response.getOutputStream();
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			// 创建工作表
			WritableSheet sheet = wwb.createSheet("产品信息表", 0);

			// 设置行号
			sheet.setRowView(0, 600);

			for (int i = 0; i < title.length; i++) {
				// 没有样式的单元格
				WritableCellFormat wctitle  = new WritableCellFormat();
				wctitle.setBorder(Border.ALL, BorderLineStyle.THIN);
				Label label = new Label(i, 0, title[i], wctitle);
				sheet.addCell(label);
			}

			// 加入数据
			for (int i = 0; i < list.size(); i++) {
				Info_statis info_statis = list.get(i);
				int r = 1 + i;
				// 有边框
				WritableCellFormat wcCell = new WritableCellFormat();
				wcCell.setAlignment(Alignment.CENTRE);
				wcCell.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcCell.setBorder(Border.ALL, BorderLineStyle.THIN);
				//转换时间格式
				SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
				String monthStatis =simpleDateFormat.format(info_statis.getMonthStatis());
				Label label1 = new Label(0, r, info_statis.getId() + "", wcCell);
				Label label2 = new Label(1, r, monthStatis, wcCell);
				//数字过长，转换显示
				DecimalFormat   df1=new DecimalFormat("###############0");//15位
				DecimalFormat   df=new DecimalFormat("###############0.00");//15位 小数点后两位
				String tradeAmount=df.format(info_statis.getTradeAmount());//本月交易金额
				String totalAmount=df.format(info_statis.getTotalAmount());//累计交易金额（元）
				String totalIncome=df.format(info_statis.getTotalIncome());//累计收益（元）
				String userAmount=df1.format(info_statis.getUserAmount());//用户数量
				Label label3 = new Label(2, r, tradeAmount, wcCell);
				Label label4 = new Label(3, r, totalAmount, wcCell);
				Label label5 = new Label(4, r, userAmount, wcCell);
				Label label6 = new Label(5, r, totalIncome, wcCell);

				sheet.addCell(label1);
				sheet.addCell(label2);
				sheet.addCell(label3);
				sheet.addCell(label4);
				sheet.addCell(label5);
				sheet.addCell(label6);
				
			}
			// 写入数据
			wwb.write();
			wwb.close();
		} catch (Exception e) {
		}
	 }

	
}
