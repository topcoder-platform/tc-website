/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * Give the users options to recover their password.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class RecoverByEmail extends ShortHibernateProcessor {


    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = RecoverByEmail.class.getName();
    
    /**
     * <p>
     * Redirect user to the page where the user can choose to recover password with primary email or second email.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");
        long userId = 0;
        try {
            userId = Long.valueOf(StringUtils.checkNull(getRequest().getParameter(Constants.CODER_ID)));
        } catch (NumberFormatException e) {
            renderView(Constants.RECOVER_BY_EMAIL, "Invalid param " + Constants.CODER_ID);
            log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
            return;
        }
        User user = DAOUtil.getFactory().getUserDAO().find(userId);
        this.getRequest().getSession().setAttribute(Constants.HANDLE, user.getHandle());
        renderView(Constants.RECOVER_BY_EMAIL, null);
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * Render the view page. Here NextPageInContext is set to true.
     * </p>
     * 
     * @param destination
     *            the URL of view page.
     * @param errorMessage
     *            the error message if exist.
     */
    private void renderView(String destination, String errorMessage) {
        if (errorMessage != null) {
            this.addError(Constants.ERROR_INFO, errorMessage);
        }
        setNextPage(destination);
        setIsNextPageInContext(true);
    }

}
