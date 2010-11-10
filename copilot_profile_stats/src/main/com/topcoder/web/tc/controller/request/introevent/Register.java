package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;

/**
 * Sets the user as registered in the event passed as a parameter.
 * 
 * @author Cucu
 */
public class Register extends RegistrationBase {

    @Override
    protected void regProcessing(Event event, User user) throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 


        if (isEarly()) {
            throw new NavigationException("Sorry, registration is not yet open.");
        }
        if (isLate()) {
            throw new NavigationException("Sorry, registration is closed.");
        }
        if (isRegistered()) {
            setNextIntroEventPage("registerSuccess.jsp");
            return;
        }
        if (!isEligible()) {
            throw new NavigationException("Sorry, you are not eligible.");
        }

        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();

        user.addEventRegistration(event, null, Boolean.TRUE);
        userDAO.saveOrUpdate(user);


        
    }

}
