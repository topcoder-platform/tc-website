package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
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
	
}
