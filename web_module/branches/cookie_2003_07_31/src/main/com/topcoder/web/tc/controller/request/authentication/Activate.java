package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.controller.legacy.reg.bean.Registration;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.ejb.EJBException;

public class Activate extends Base {

    protected void businessProcessing() throws TCWebException {
        InitialContext ctx = null;

        String code = StringUtils.checkNull(getRequest().getParameter(Constants.ACTIVATION_CODE));
        long userId = Registration.getCoderId(code);

        try {
            ctx = new InitialContext();
            Coder coder = (Coder) createEJB(ctx, Coder.class);
            String dbCode = null;
            try {
                dbCode = coder.getActivationCode(userId, DBMS.OLTP_DATASOURCE_NAME);
            } catch (Exception e) {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.", e);
            }
            if (dbCode.equals(code)) {
                //activate account
                User user = (User) createEJB(ctx, User.class);
                user.setStatus(userId, Constants.ACTIVE_STATUS.charAt(0));
                setNextPage(Constants.ACTIVATE);
            } else {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.");
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        } finally {
            close(ctx);
        }
    }
}
