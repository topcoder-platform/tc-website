package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.privatelabel.Constants;

import java.util.Arrays;

public abstract class FullLogin extends FullReg {

    protected static final char[] INACTIVE_STATI = {'I', '0', '9', '6', '5', '4'};
    protected static final char[] UNACTIVE_STATI = {'U', '2'};
    protected static final char[] ACTIVE_STATI = {'1', 'A'};

    static {
        //sort them so that one can use Arrays.binarySearch to figure out if a particular
        //status is in the list
        Arrays.sort(INACTIVE_STATI);
        Arrays.sort(UNACTIVE_STATI);
        Arrays.sort(ACTIVE_STATI);
    }

    protected boolean hasTopCoderAccount() throws Exception {
        String handle = getRequestParameter(Constants.HANDLE);
        String password = getRequestParameter(Constants.PASSWORD);

        boolean ret = false;
        long userId = getUserId(handle);
        if (userId > 0) {
            char status = getStatus(userId);
            if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
                try {
                    getAuthentication().login(new SimpleUser(0, handle, password));
                    ret = true;
                } catch (LoginException l) {
                    if (!hasError(Constants.HANDLE))
                        addError(Constants.HANDLE, l.getMessage());
                }
            } else {
                addError(Constants.HANDLE, "Account status not active.");
            }
        }

        return ret;
    }

    /**
     *
     * @param userId
     * @return
     * @throws Exception if user doesn't exist or some other ejb problem
     */
    private char getStatus(long userId) throws Exception {
        char result;
        com.topcoder.web.ejb.user.User user = (com.topcoder.web.ejb.user.User) createEJB(getInitialContext(), com.topcoder.web.ejb.user.User.class);
        result = user.getStatus(userId, DBMS.OLTP_DATASOURCE_NAME);
        return result;

    }

    private long getUserId(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user_id_using_handle");
        r.setProperty("ha", handle);
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("user_id");
        if (rsc.isEmpty())
            return -1;
        else
            return rsc.getLongItem(0, "user_id");
    }


    abstract protected boolean hasCompanyAccount() throws Exception;

}
