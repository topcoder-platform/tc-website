package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import java.util.Arrays;

abstract public class Activate extends BaseProcessor {

    static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    static final char[] UNACTIVE_STATI = {'U', '2'};
    static final char[] ACTIVE_STATI = {'1', 'A'};
    public static final String ACTIVATION_CODE = "code";

    static {
        //sort them so that one can use Arrays.binarySearch to figure out if a particular
        //status is in the list
        Arrays.sort(INACTIVE_STATI);
        Arrays.sort(UNACTIVE_STATI);
        Arrays.sort(ACTIVE_STATI);
    }

    protected void businessProcessing() throws TCWebException {
        InitialContext ctx = null;

        String code = StringUtils.checkNull(getRequest().getParameter(ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);

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
                if (Arrays.binarySearch(UNACTIVE_STATI, status) > 0) {
                    user.setStatus(userId, ACTIVE_STATI[1], DBMS.COMMON_OLTP_DATASOURCE_NAME); //want to get 'A'
                    setNextPage();
                } else if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
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

    abstract protected void setNextPage();

}

