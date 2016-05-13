/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security.synchronizerToken;

import com.topcoder.web.common.TCRequest;

import javax.servlet.http.HttpSession;

/**
 * <p>An interface to implementation of <code>Synchronizer Token Pattern</code>.</p>
 *
 * @author isv
 */
public interface SynchronizerTokenPattern {

    /**
     * <p>Gets the name of parameter of client's request for specified type of "protected" operation which is expected
     * to provide a synchronizer token in context of specified session.</p>
     *
     * @param session an <code>HttpSession</code> specifying the session context.
     * @param operationType a <code>String</code> specifying the operation type.
     * @return a <code>String</code> providing the name of request parameter.
     */
    String getParameterName(HttpSession session, String operationType);

    /**
     * <p>Gets the synchronizer token which is expected to be provided by client's request for specified type of
     * "protected" operation in context of specified session.</p>
     *
     * @param session an <code>HttpSession</code> specifying the session context.
     * @param operationType a <code>String</code> specifying the operation type.
     * @return a <code>String</code> providing the synchronizer token
     */
    String getExpectedToken(HttpSession session, String operationType);

    /**
     * <p>Generates the name for request parameter to be used for carrying the synchronizer token.</p>
     *  
     * @return a <code>String</code> providing the name of request parameter.
     */
    String generateParameterName();

    /**
     * <p>Generates unique synchronizer token.</p>
     * 
     * @return a <code>String</code> providing the unique synchronizer token.
     */
    String generateToken();

    /**
     * <p>Verifies that specified request corresponding to specified "protected" operation provides valid synchronizer
     * token.</p>
     * 
     * @param request a <code>TCRequest</code> specifying the request context. 
     * @param operationType a <code>String</code> specifying the operation type.
     * @return <code>true</code> if specified request provided valid synchronizer token; <code>false</code> otherwise.
     */
    boolean validateSynchronizerToken(TCRequest request, String operationType);
}
