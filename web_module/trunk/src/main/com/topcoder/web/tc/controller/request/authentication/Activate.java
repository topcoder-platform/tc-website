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
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Data;

import javax.naming.InitialContext;
import java.util.Arrays;

public class Activate extends Base {

    static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    static final char[] UNACTIVE_STATI = {'U', '2'};
    static final char[] ACTIVE_STATI = {'1','A'};

    static {
        //sort them so that one can use Arrays.binarySearch to figure out if a particular
        //status is in the list
        Arrays.sort(INACTIVE_STATI);
        Arrays.sort(UNACTIVE_STATI);
        Arrays.sort(ACTIVE_STATI);
    }

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
                char status = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                if (Arrays.binarySearch(UNACTIVE_STATI, status)>0) {
                    doLegacyCrap();
                    user.setStatus(userId, ACTIVE_STATI[1], DBMS.COMMON_OLTP_DATASOURCE_NAME); //want to get 'A'
                    setNextPage(Constants.ACTIVATE);
                    setIsNextPageInContext(true);
                } else if (Arrays.binarySearch(ACTIVE_STATI, status)>0) {
                    throw new NavigationException("Account has already been activated.");
                } else {
                    throw new NavigationException("Your account can not be activated.");
                }
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

    private void doLegacyCrap() throws Exception {
        Navigation nav = (Navigation)getRequest().getSession(true).getAttribute("navigation");
        if (nav==null) nav = new Navigation();
        Data.loadUser(nav);
        nav.getUser().setStatus(String.valueOf(ACTIVE_STATI[1]));
        Data.saveUser(nav);
    }
}
