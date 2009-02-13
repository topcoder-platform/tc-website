package com.topcoder.web.test.wsf;

import java.util.regex.*;

/**
 * helper class defines one sign of being correct page
 * 
 * @author mishagam
 * created 1/18/2003
 * */
class WsfPattern {
	final static int TEXT_PATTERN = 1;
	final static int RE_PATTERN = 2;
	int type;
	String value;
	
	/**
	 * check that string s conforms to pattern
	 * 
	 * @parameter - String s that we are testing for conformance
	 * 
	 * @return - return true if s conforms to pattern, false otherwise
	 * */
	boolean check(String s) {
		boolean checkOk = false;
		
		if (type == TEXT_PATTERN) {
			checkOk = (s.indexOf(value) >= 0);
		} else if (type == RE_PATTERN) {
			Pattern pattern = Pattern.compile(value, Pattern.DOTALL);
			Matcher mat = pattern.matcher(s);
			checkOk = mat.matches();
		}
		
		return checkOk;
	}
}
