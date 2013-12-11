/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.cs;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * <p>
 * Show spin index page.
 * </p>
 *
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this processor.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class SpinIndex extends ShortHibernateProcessor {
    /**
     * The class name.
     */
    private final static String CLASS_NAME = SpinIndex.class.getName();

    /**
     * The process method. Prepare data for spin index page here.
     *
     * @throws PermissionException if user is not identified.
     * @throws Exception if error occurs
     */
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        getRequest().setAttribute("apis", DAOUtil.getFactory().getUserApiSpinDAO().findByUserId(getUser().getId()));

        setNextPage("/cs/spin_index.jsp");
        setIsNextPageInContext(true);
        log.debug("Leave method " + CLASS_NAME + "#dbProcessing().");
    }
}
