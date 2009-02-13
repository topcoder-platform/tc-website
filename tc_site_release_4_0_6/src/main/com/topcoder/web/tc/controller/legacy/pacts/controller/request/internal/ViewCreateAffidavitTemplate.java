package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;

import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Aug 5, 2005
 */
public class ViewCreateAffidavitTemplate extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {

        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            Map map = dib.getAffidavitTypes();
            getRequest().setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));
            setNextPage(INTERNAL_CREATE_AFFIDAVIT);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

