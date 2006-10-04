package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 * Provides some helper methods to Pacts processors. 
 * 
 * @author Cucu
 */
public abstract class PactsBaseProcessor extends BaseProcessor{

	protected UserProfileHeader getUserProfileHeader(long userId) throws Exception {
        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserProfileHeader(userId);

        if (results == null) {
        	throw new TCWebException("User not found: " + userId);
        }
            
        return new UserProfileHeader(results);		
	}
	
	protected long getOptionalLongParameter(String name) {
		return getRequest().getParameter(name) == null? -1 : 
				Long.parseLong(getRequest().getParameter(name));
	}
	
	protected long getLongParameter(String name) {
		if (getRequest().getParameter(name) == null) {
			throw new IllegalArgumentException("Missing parameter " + name);
		}
		return Long.parseLong(getRequest().getParameter(name));
	}

	protected String checkNotEmptyString(String name, String errorMsg) {
		if (getRequest().getParameter(name) == null || getRequest().getParameter(name).trim().length() == 0) {
			addError("error", errorMsg);
		}
		return (String) getRequest().getParameter(name);
	}

	protected int checkNonNegativeInt(String name, String errorMsg) {
		int value = -1;
		try {
			value = Integer.parseInt(getRequest().getParameter(name));
		} catch(NumberFormatException e) {}
		
		if (value < 0) {
			addError("error", errorMsg);
		}
		return value;
	}

	protected Date checkDate(String name, String errorMsg) {
		SimpleDateFormat dfmt = new SimpleDateFormat(PactsConstants.DATE_FORMAT_STRING);
        Date d = null;
        try {
            d = dfmt.parse((String) getRequest().getParameter(name));
        } catch (Exception e3) {
        	addError("error", errorMsg);
        }
        return d;
	}
}
