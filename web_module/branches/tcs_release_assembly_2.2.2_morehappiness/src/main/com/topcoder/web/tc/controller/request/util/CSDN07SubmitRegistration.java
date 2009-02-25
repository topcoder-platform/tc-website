package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;

public class CSDN07SubmitRegistration extends CSDN07RegistrationBase {

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        setAlreadyRegistered(true);
    }


    protected void regProcessing(Event event, User user) {
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        user.addEventRegistration(event, null, Boolean.TRUE);
        userDAO.saveOrUpdate(user);
        setAlreadyRegistered(true);
    }

}
