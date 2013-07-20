/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;

import java.util.List;

/**
 * <p>
 * Find User by the user's id , primary email or second email.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 * <p>
 * Update v1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0): The change is substantial and the
 * previous code is nearly totally removed.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.1
 */
public class FindUser extends ShortHibernateProcessor {

    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = FindUser.class.getName();

    private final static String MULTIPLE_USER_ERROR =
        "We found multiple accounts associated with %s while we allow one account for each member only. please contact support@topcoder.com to unify your accounts first.";

    /**
     * <p>
     * Find the user according to the query string. Go to next step if only one user returned, otherwise return the
     * error information back to client.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    protected void dbProcessing() throws Exception {

        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        String queryString = getRequest().getParameter(Constants.FIND_USER_QUERY);

        if (queryString == null) {
            // first came into this page.
            renderView(Constants.RECOVER_PASSWORD, null, true);
            return;
        }

        queryString = queryString.trim();

        if ("".equals(queryString)) {
            renderView(Constants.RECOVER_PASSWORD, "Please input something to search", true);
            log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
            return;
        }

        if (queryString.length() > Constants.FIND_USER_QUERY_MAX_LENGTH) {
            renderView(Constants.RECOVER_PASSWORD,
                "The input is too much. Do not input more than "
                    + Constants.FIND_USER_QUERY_MAX_LENGTH, true);
            log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
            return;
        }

        UserDAO dao = DAOUtil.getFactory().getUserDAO();
        User user;

        ValidationResult vr = new EmailValidator().validate(new StringInput(queryString));
        if (vr.isValid()) {
            List<User> users = dao.findByPrimaryOrSecondEmail(queryString);
            if (users.size() == 0) {
                renderView(Constants.RECOVER_PASSWORD, "No user found with the given email.", true);
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            } else if (users.size() > 1) {
                renderView(Constants.RECOVER_PASSWORD, String.format(MULTIPLE_USER_ERROR, queryString), true);
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            } else {
                user = users.get(0);
            }
        } else {
            user = dao.find(queryString, false);
            if (user == null) {
                renderView(Constants.RECOVER_PASSWORD, "No user found with the given handle.", true);
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }
        }
        renderView(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=RecoverByEmail&"
            + Constants.CODER_ID + "=" + user.getId() + "&" + Constants.EMAIL_CONFIRM + "="
            + user.getEmailAddresses().size(), null, false);
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");

    }

    /**
     * <p>
     * Render the view page. Here NextPageInContext is set to false.
     * </p>
     * 
     * @param destination
     *            the URL of view page.
     * @param errorMessage
     *            the error message if exist.
     * @param isNextPageInContext
     *            the flag to judge next page in context or not.
     */
    private void renderView(String destination, String errorMessage, boolean isNextPageInContext) {
        if (errorMessage != null) {
            this.addError(Constants.ERROR_INFO, errorMessage);
        }
        setNextPage(destination);
        setIsNextPageInContext(isNextPageInContext);
    }
}
