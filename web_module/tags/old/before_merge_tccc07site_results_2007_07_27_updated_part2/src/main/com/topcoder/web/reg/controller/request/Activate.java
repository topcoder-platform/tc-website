package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.Constants;

import java.util.Arrays;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 18, 2006
 */
public class Activate extends Base {
    protected void registrationProcessing() throws Exception {

        String code = StringUtils.checkNull(getRequest().getParameter(Constants.ACTIVATION_CODE));
        long userId = StringUtils.getCoderId(code);

        try {
            User u = getFactory().getUserDAO().find(new Long(userId));
            if (u == null) {
                throw new NavigationException("Sorry, incorrect activation code, account not activated.");
            } else if (code.equals(u.getActivationCode())) {
                char status = u.getStatus().charValue();
                if (Arrays.binarySearch(Constants.UNACTIVE_STATI, status) >= 0) {
                    u.getPrimaryEmailAddress().setStatusId(Email.STATUS_ID_ACTIVE);
                    u.setStatus(new Character(Constants.ACTIVE_STATI[1]));
                    getFactory().getUserDAO().saveOrUpdate(u);
                    markForCommit();
                    setNextPage("/activated.jsp");
                    setIsNextPageInContext(true);
                } else if (Arrays.binarySearch(Constants.ACTIVE_STATI, status) >= 0) {
                    setNextPage("/activated.jsp");
                    setIsNextPageInContext(true);
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
}