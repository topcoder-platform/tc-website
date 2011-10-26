package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author mktong
 * Create Date: May 16, 2006
 */
public class ViewGenerateComponentPayments extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            Map map = dib.getProjectTerminationStatusTypes();
            getRequest().setAttribute(PROJECT_TERMINATION_STATUS_LIST, map.get(PROJECT_TERMINATION_STATUS_LIST));
            
            setNextPage(INTERNAL_GENERATE_COMPONENT_PAYMENTS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

