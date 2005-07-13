package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 * User: dok
 * Date: Aug 27, 2004
 */
public class EmailActivate extends Base {

    public static final int ACTIVE_STATUS = 1;

    protected void businessProcessing() throws TCWebException {

        String code = StringUtils.checkNull(getRequest().getParameter(Constants.ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);

        try {
            Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
            String dbCode = null;
            try {
                dbCode = coder.getActivationCode(userId, DBMS.OLTP_DATASOURCE_NAME);
            } catch (Exception e) {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.", e);
            }
            if (dbCode.equals(code)) {
                //activate account
                Email email = (Email) createEJB(getInitialContext(), Email.class);
                email.setStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                        ACTIVE_STATUS, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                setNextPage(Constants.ACTIVATE);
                setIsNextPageInContext(true);
            } else {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.");
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
