package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.Constants;

import java.util.Arrays;
import java.util.Locale;

abstract public class BaseActivate extends RegistrationBase {

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

    protected void registrationProcessing() throws TCWebException {

        String code = StringUtils.checkNull(getRequest().getParameter(ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);

        try {
            User user = (User) createEJB(getInitialContext(), User.class);
            String dbCode = null;
            try {
                dbCode = user.getActivationCode(userId, db);
            } catch (Exception e) {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.", e);
            }
            if (dbCode.equals(code)) {
                //activate account
                char status = user.getStatus(userId, db);
                if (Arrays.binarySearch(UNACTIVE_STATI, status) > 0) {
                    user.setStatus(userId, ACTIVE_STATI[1], db); //want to get 'A'
                    setNextPage();
                } else if (Arrays.binarySearch(ACTIVE_STATI, status) > 0) {
                    setNextPage();
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

    abstract protected void setNextPage();

    /**
     * just returning null cuz we don't need registration info at this point.
     * if that changes, we'll need to come up with a better implementation
     * @return
     * @throws Exception
     */
    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = new SimpleRegInfo();
        if (hasRequestParameter(Constants.LOCALE)) {
            ret.setLocale(new Locale(StringUtils.checkNull(getRequestParameter(Constants.LOCALE))));
        } else {
            ret.setLocale(Locale.US);
        }
        return ret;
    }

}

