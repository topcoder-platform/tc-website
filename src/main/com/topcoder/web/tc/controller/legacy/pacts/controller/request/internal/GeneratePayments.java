package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 7, 2005
 */
public class GeneratePayments extends BaseProcessor implements PactsConstants {


    protected void businessProcessing() throws TCWebException {
        try {
            setNextPage(INTERNAL_GENERATE_PAYMENTS);
            setIsNextPageInContext(true);
            if (getRequest().getParameter(ROUND_ID)!=null) {
                DataInterfaceBean bean = new DataInterfaceBean();
                int count = 0;
                if (StringUtils.checkNull(getRequest().getParameter(AFFIDAVIT_TYPE_ID)).equals("")) {
                    log.debug("no affidavit type");
                    count = bean.generateRoundPayments(Long.parseLong(getRequest().getParameter(ROUND_ID)), true);
                } else {
                    log.debug("affidavit type " + getRequest().getParameter(AFFIDAVIT_TYPE_ID));
                    count = bean.generateRoundPayments(Long.parseLong(getRequest().getParameter(ROUND_ID)),
                            Integer.parseInt(getRequest().getParameter(AFFIDAVIT_TYPE_ID)), true);
                }
                addError(ROUND_ID, "Success, " + count + " payments generated");
            } else {
                addError(ROUND_ID, "Missing round id");
            }
        } catch (NumberFormatException e) {
            addError(ROUND_ID, "Please enter a value for round id");
        } catch (IllegalUpdateException e) {
            throw new NavigationException(e.getMessage());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
