package com.topcoder.web.tc.controller.legacy.pacts.common;


public class Links implements PactsConstants {

	private static String createLink(String module, String param1, String value1) {
		return INTERNAL_SERVLET_URL + "?module=" + module + "&" + param1 + "=" + value1;
	}

	private static String createLink(String module, String param1, String value1, String param2, String value2) {
		return INTERNAL_SERVLET_URL + "?module=" + module + "&" + param1 + "=" + value1 + "&" + param2 + "=" + value2; 
	}
	
	public static String addAffidavit(long userId) {
		return createLink("AddAffidavit", USER_ID, userId + "");
	}
	
	public static String addAffidavitForPayment(long userId, long paymentId) {
		return createLink("AddAffidavit", USER_ID, userId + "", PAYMENT_ID, paymentId + "");
	}

	public static String viewUser(long userId) {
		return PactsConstants.INTERNAL_SERVLET_URL + "?t=view&c=user&" + USER_ID + "=" + userId; 
	}
	
}
