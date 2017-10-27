package utils;

import org.springframework.util.DigestUtils;
/**
 * 加密类
 * @author Administrator
 *
 */
public class H5Utils {
	
	//字符串md5加密
	public static String Hex5(String value){
		return DigestUtils.md5DigestAsHex(value.getBytes());
	}
}
