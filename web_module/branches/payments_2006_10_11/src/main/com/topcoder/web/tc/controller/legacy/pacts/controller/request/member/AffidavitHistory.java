package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoteHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class AffidavitHistory extends BaseProcessor implements PactsConstants {

	public static final String FULL_LIST = "full_list";
	
    protected void businessProcessing() throws TCWebException {
        try {
        	boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
        	
        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("pacts/client/affidavitHistoryNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

