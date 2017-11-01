package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 时间日期对象与字符串互转辅助工具类
 * 
 * @author Administrator
 *
 */
public class DateUtils {
	private static SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public static Date getNowDate() {
		return new Date();
	}

	// ****************************当前时间相关****************************
	/**
	 * 获得以 yyyy-MM-dd 为形式的当前时间字符串
	 * 
	 * @return String
	 */
	public static String getCurrentTimeByDay() {
		String time = date.format(new Date(System.currentTimeMillis()));
		return time;
	}

	/**
	 * 获得以 yyyy-MM-dd HH:mm:ss 为形式的当前时间字符串
	 * 
	 * @return String
	 */
	public static String getCurrentTimeBySecond() {
		String time = datetime.format(new Date(System.currentTimeMillis()));
		return time;
	}

	/**
	 * 获得给定格式的当前时间字符串
	 * 
	 * @param give
	 *            String 给定的时间格式
	 * @return String
	 */
	public static String getCurrentTime(String give) {
		SimpleDateFormat temp = new SimpleDateFormat(give);
		return temp.format(new Date(System.currentTimeMillis()));
	}

	// ****************************String转换为Date****************************
	/**
	 * 将String转化成date 格式为yyyy-MM-dd 
	 * 
	 * @throws ParseException
	 */
	public static Date pStringToDate(String str, String sfgs) throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat(sfgs);
		return sf.parse(str);
	}

	/**
	 * 将String转化成date 格式为yyyy-MM-dd hh:mm:ss
	 * 
	 * @throws ParseException
	 */
	public static Date pStringToDate(String str) throws ParseException {
		return datetime.parse(str);
	}

	// ****************************Date转换为String****************************
	/**
	 * 转换成日期格式的字符串 格式为yyyy-MM-dd
	 * 
	 * @param Object
	 * @return String
	 */
	public static String dateFormat(Date o) {
		if (o == null) {
			return "";
		}
		return date.format(o);
	}

	/**
	 * 转换成时间格式的字符串 格式为yyyy-MM-dd hh:mm:ss
	 * 
	 * @param Date
	 * @return String
	 */
	public static String dateTimeFormat(Date o) {
		if (o == null) {
			return "";
		}
		return datetime.format(o);
	}

	/**
	 * 转换成给定时间格式的字符串
	 * 
	 * @param Date
	 * @param String
	 * @return String
	 */
	public static String getDateFormat(Date d, String format) {
		return new SimpleDateFormat(format).format(d);
	}


	// ****************************Date转换为给定格式的Date****************************
	/**
	 * 日期格式化（yyyy-MM-dd）
	 * 
	 * @param Date
	 * @return Date
	 * @throws ParseException
	 */
	public static Date fDate(Date dat) throws ParseException {
		String dateStr = date.format(dat);
		return date.parse(dateStr);
	}
	
	/**
	 * 日期格式化（yyyy-MM-dd hh:mm:ss）
	 * 
	 * @param Date
	 * @return Date
	 * @throws ParseException
	 */
	public static Date fDateTime(Date dat) throws ParseException {
		String dateStr = datetime.format(dat);
		return date.parse(dateStr);
	}

	/**
	 * 判断是否为空
	 * 
	 * @param String
	 * @return boolean
	 */
	public static boolean isNullOrNone(String src) {
		if (null == src || "".equals(src)) {
			return true;
		}
		return false;
	}


}