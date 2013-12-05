/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.shared.security.Authentication;
import com.topcoder.shared.util.logging.Logger;

/**
 * This action will be used to clear the user session.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only uses
 * this class in thread-safe manner.
 * </p>
 * 
 * @author sampath01, leo_lol
 * @version 1.0
 * @since 1.0
 */
public class LogoutAction extends BaseAction {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 1425743732087208819L;
    
    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = LogoutAction.class.getName();
	
	private static final Logger logger = Logger.getLogger(LogoutAction.class);

    /**
     * This method will logs user out and clear cookies.
     * 
     * @throws Exception
     *             If there is any error.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);
        HttpSession session = ServletActionContext.getRequest().getSession();
        Authentication authentication = (Authentication) session.getAttribute(authenticationSessionKey);
        if(null != authentication) {
            authentication.logout();
        }
        session.removeAttribute(userSessionKey);
        session.removeAttribute(userHandleSessionKey);
        //LoggingWrapperUtility.logExit(logger, signature, new String[]{SUCCESS});
        return SUCCESS;
    }

}
