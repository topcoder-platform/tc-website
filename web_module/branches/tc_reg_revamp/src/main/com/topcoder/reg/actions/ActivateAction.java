/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpSession;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.shared.util.logging.Logger;

/**
 * This method would validate the activation code and then activate the the account if nothing wrong detected.
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe as its parent is not thread safe. But
 * Struts2 framework only uses it in thread-safe manner.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class ActivateAction extends BaseAction {

    /**
     * Generated serial number.
     */
    private static final long serialVersionUID = 7216018769686756492L;

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = ActivateAction.class.getName();

    /**
     * Session key to hold user handle.
     */
    private static final String USER_HANDLE_KEY = "user_handle";
    
    /**
     * Represents the activation code.
     */
    private String code;
	
	private static final Logger logger = Logger.getLogger(ActivateAction.class);
    
    /**
     * This method would validate activation code and activate the account if there is no error.
     * 
     * @throws Exception
     *             If there is any error.
     * @return The result code.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);        
        
        if (null == code || code.trim().length() == 0) {
            addActionError("Empty activation code");
        }

        try {
            userService.activate(code);
            long userId = StringUtils.getCoderId(code);
            UserDTO userDTO = null;
            userDTO = userService.getUserByUserId(userId);
            ServletActionContext.getRequest().setAttribute(USER_HANDLE_KEY, userDTO.getHandle());
        } catch (PersistenceException e) {
            addActionError(e.getMessage());
            logger.error(e);
            throw e;
        }

        //LoggingWrapperUtility.logExit(logger, signature, new String[] { SUCCESS });
        return SUCCESS;
    }
    
    /**
     * Sets the activation code.
     */
    public void setCode(String code) {
        this.code = code;
    }

}
