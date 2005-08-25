/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.util.logging.Logger;

/**
 * This Model provides business logic through which users login to the system.
 *
 * @author adic
 * @version 1.0
 */
public class Login implements Model {

    private static Logger log = Logger.getLogger(Login.class);
    
    /**
     * Performs the login for a user with the name and password given inside a LoginData object.
     *
     * @param data a LoginData object with the populated username and password
     *
     * @return a LoginResult wrapping the User object for that user if the login was successful
     *         a FailureResult object if the data object is not populated correctly
     *         a FailureResult containing an exception in case one is thrown
     *         (Errors and RuntimeExceptions are propagated so they aren't included in this category)
     */
    public ResultData start(ActionData data) {
        log.debug("Starting request to model class Login ...");

        if (!(data instanceof LoginData)) {
            // should never happen if front-end works properly
            return new FailureResult("Invalid ActionData object, expected LoginData");
        }

        LoginData loginData = (LoginData) data;
        if (loginData.getUserName() == null || loginData.getPassword() == null) {
            // should never happen if front-end works properly
            return new FailureResult("Null user name or password");
        }

        try {
            LoginRemote login = EJBHelper.getLogin();
            TCSubject subject = login.login(loginData.getUserName(), loginData.getPassword());
            UserManagerLocal userManager = EJBHelper.getUserManager();
            SecurityEnabledUser user = userManager.getUser(subject);
            return new LoginResult(user);

            // throw RuntimeExceptions and Errors, wrap other exceptions in FailureResult
        } catch (AuthenticationException e) {
            return new FailureResult("User name or password is incorrect", e);
        } catch (RuntimeException e) {
            log.error("", e);
            throw e;
        } catch (Error e) {
            log.error("", e);
            throw e;
        } catch (Exception e) {
            return new FailureResult(e);
        }
    }

}

