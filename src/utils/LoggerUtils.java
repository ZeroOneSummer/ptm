package utils;

import org.apache.log4j.Logger;
/**
 * 日志工具类
 * @author Administrator
 *
 */
public class LoggerUtils {
	private static Logger logger;
	
	public static Logger getLogger(Class<?> clazz){	
		if (logger == null) {
			return Logger.getLogger(clazz);
		}
		return logger;
	}
}
