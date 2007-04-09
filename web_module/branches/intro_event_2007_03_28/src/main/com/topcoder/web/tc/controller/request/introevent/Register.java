package com.topcoder.web.tc.controller.request.introevent;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;

public class Register extends RegistrationBase {

    @Override
    protected void regProcessing(Event event, User user) throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } 
        
        if (isEarly() || isLate() || isRegistered() || !isEligible()) {
            throw new NavigationException("You can't register for this event.");
        }
                
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();

        user.addEventRegistration(event, null, Boolean.TRUE);
        userDAO.saveOrUpdate(user);

        setNextIntroEventPage("registerSuccess.jsp");
        
    }

}
