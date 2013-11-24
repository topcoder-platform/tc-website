/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserSocialLoginDAO;
import com.topcoder.web.common.model.UserSocialLogin;

import java.util.List;

/**
 * <p>
 * Remove social login account from user.
 * </p>
 *
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Social Login Linking for Existing User) Change notes:
 *   <ol>
 *      <li>The first version of this processor.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class RemoveSocialLogin extends ShortHibernateProcessor {
    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = RemoveSocialLogin.class.getName();

    /**
     * The process method. Remove social account here.
     *
     * @throws PermissionException if user is not identified.
     * @throws NavigationException if user is not associated with social account
     */
    protected void dbProcessing() throws PermissionException, NavigationException {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        UserSocialLoginDAO userSocialLoginDAO = DAOUtil.getFactory().getUserSocialLoginDAO();
        List<UserSocialLogin> userSocialLogins = userSocialLoginDAO.findByUserId(getUser().getId());

        // check whether user has been associated with social account.
        if (userSocialLogins.isEmpty()) {
            throw new NavigationException("The user is not associated with any social account.");
        }

        // actually, according to design, there should only be one social account
        // but still delete all social accounts
        for (UserSocialLogin userSocialLogin : userSocialLogins) {
            userSocialLoginDAO.delete(userSocialLogin);
        }

        setNextPage("/tc?module=MyHome");
        log.debug("Leave method " + CLASS_NAME + "#dbProcessing().");
    }
}
