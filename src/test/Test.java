package test;

import org.apache.log4j.Logger;

import utils.LoggerUtils;

public class Test {
	public static void main(String[] args) {
		Logger logger = LoggerUtils.getLogger(Test.class);		
		logger.info("111111");
	}
}
