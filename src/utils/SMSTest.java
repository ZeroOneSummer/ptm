package utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;

/**
 * 短信验证
 * @author Administrator
 *
 */
public class SMSTest {
	private static final String addr = "http://api.sms.cn/sms/";
	private static final String userId = "qq8783462";

	/*
	* 如uid是：test，登录密码是：123123 
	pwd=md5(123123test),即
	pwd=b9887c5ebb23ebb294acab183ecf0769

	*/
	private static final String pwd = "01d948fac36979b718e273cc2e95bc01"; 

	private static final String encode = "utf8"; 

	public static void send(String msgContent, String mobile) throws Exception {

	//组建请求
	String straddr = addr + 
	"?ac=send&uid="+userId+
	"&pwd="+pwd+
	"&mobile="+mobile+
	"&template=100005"+
	"&encode="+encode+
	"&content=" + msgContent;

	StringBuffer sb = new StringBuffer(straddr);
	System.out.println("URL:"+sb);

	//发送请求
	URL url = new URL(sb.toString());
	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	connection.setRequestMethod("POST");
	BufferedReader in = new BufferedReader(new InputStreamReader(
	url.openStream()));

	//返回结果
	String inputline = in.readLine();
	System.out.println("Response:"+inputline);
	}


	/*public static void main(String[] args) {
	try {
		Map codeString=new HashMap();
		codeString.put("code", "666666");
		codeString.put("username", "Mr先生");
		String code=JSON.toJSONString(codeString);
		send(code, "18825156917");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
