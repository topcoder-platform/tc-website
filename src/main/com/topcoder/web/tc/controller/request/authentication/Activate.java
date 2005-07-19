package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.common.web.error.TCException;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.naming.Context;
import javax.transaction.Status;
import javax.transaction.UserTransaction;
import java.util.Arrays;

public class Activate extends Base {

    public static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    public static final char[] UNACTIVE_STATI = {'U', '2'};
    public static final char[] ACTIVE_STATI = {'1', 'A'};

    static {
        //sort them so that one can use Arrays.binarySearch to figure out if a particular
        //status is in the list
        Arrays.sort(INACTIVE_STATI);
        Arrays.sort(UNACTIVE_STATI);
        Arrays.sort(ACTIVE_STATI);
    }

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
                User user = (User) createEJB(getInitialContext(), User.class);
                char status = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                if (Arrays.binarySearch(UNACTIVE_STATI, status) > 0) {
                    doLegacyCrap((int) userId);
                    Email email = (Email) createEJB(getInitialContext(), Email.class);
                    email.setStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                            EmailActivate.ACTIVE_STATUS, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    user.setStatus(userId, ACTIVE_STATI[1], DBMS.COMMON_OLTP_DATASOURCE_NAME); //want to get 'A'
                    setNextPage(Constants.ACTIVATE);
                    setIsNextPageInContext(true);
                } else if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
                    //just send them to the home page
                    setIsNextPageInContext(false);
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
        }
    }

    private void doLegacyCrap(int userId) throws Exception {
        Context ctx = null;
        com.topcoder.common.web.data.User user = null;
        UserTransaction uTx = null;
        try {
            ctx = TCContext.getInitial();
            UserServicesHome userHome = (UserServicesHome) ctx.lookup(ApplicationServer.USER_SERVICES);
            UserServices userEJB = userHome.findByPrimaryKey(new Integer(userId));
            user = userEJB.getUser();
            log.debug("tc: user loaded from entity bean");

            user.setStatus(String.valueOf(ACTIVE_STATI[1]));
            user.setModified("U");

            uTx = Transaction.get();
            uTx.begin();
            userEJB.setUser(user);
            uTx.commit();

        } catch (Exception e) {
            try {
                if (uTx != null && uTx.getStatus() == Status.STATUS_ACTIVE) {
                    uTx.rollback();
                }
            } catch (Exception te) {
                StringBuffer msg = new StringBuffer(300);
                msg.append("common.DBMS:saveUser:");
                msg.append("failed to roll back transaction.\n");
                msg.append("MSG: ");
                msg.append(te.getMessage());
                msg.append("\n");
                te.printStackTrace();
            }
            throw new TCException("tc:processCommands:ERROR READING DATABASE\n" + e);
        } finally {
            close(ctx);
        }


    }
}
