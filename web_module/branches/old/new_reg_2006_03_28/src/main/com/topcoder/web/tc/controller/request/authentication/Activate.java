package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.util.Arrays;

public class Activate extends Base {


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
                if (Arrays.binarySearch(Constants.UNACTIVE_STATI, status) >= 0) {
                    doLegacyCrap((int) userId);
                    Email email = (Email) createEJB(getInitialContext(), Email.class);
                    email.setStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                            EmailActivate.ACTIVE_STATUS, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    user.setStatus(userId, Constants.ACTIVE_STATI[1], DBMS.COMMON_OLTP_DATASOURCE_NAME); //want to get 'A'
                    setNextPage(Constants.ACTIVATE);
                    setIsNextPageInContext(true);
                } else if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) >= 0) {
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
        com.topcoder.common.web.data.User user = null;
        TransactionManager tm = null;
        try {
            UserServicesHome userHome = (UserServicesHome) PortableRemoteObject.narrow(getInitialContext().lookup(
                            UserServicesHome.class.getName()),
                            UserServicesHome.class);

            UserServices userEJB = userHome.findByPrimaryKey(new Long(userId));
            user = userEJB.getUser();
            log.debug("tc: user loaded from entity bean");

            user.setStatus(String.valueOf(Constants.ACTIVE_STATI[1]));
            user.setModified("U");

            tm = (TransactionManager)getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            tm.begin();
            userEJB.setUser(user);
            tm.commit();

        } catch (Exception e) {
            try {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
            } catch (Exception te) {
                throw new TCWebException(te);
            }
            throw new TCWebException(e);
        }


    }
}
