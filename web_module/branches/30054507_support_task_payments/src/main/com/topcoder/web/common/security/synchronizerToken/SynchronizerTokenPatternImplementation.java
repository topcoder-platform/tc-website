/*
 * This code is copyright (c) 2015 EMC Corporation.
 */
package com.topcoder.web.common.security.synchronizerToken;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.Map;
import java.util.UUID;

/**
 * <p>This is SynchronizerTokenPatternImplementation entity class.</p>
 *
 * <p><strong>Thread safety</strong>: This class is mutable, it is not thread safety.</p>
 *
 * @author isv
 */
public class SynchronizerTokenPatternImplementation implements SynchronizerTokenPattern, Serializable {

    /**
     * <p>Constructs new <code>SynchronizerTokenPatternImplementation</code> instance. This implementation does
     * nothing.</p>
     */
    public SynchronizerTokenPatternImplementation() {
    }

    /**
     * <p>Gets the name of parameter of client's request for specified type of "protected" operation which is expected
     * to provide a synchronizer token in context of specified session.</p>
     *
     * @param session an <code>HttpSession</code> specifying the session context.
     * @param operationType a <code>String</code> specifying the operation type.
     * @return a <code>String</code> providing the name of request parameter.
     * @throws IllegalArgumentException if specified <code>session</code> is <code>null</code> or specified operation
     * type is not supported or there is no parameter name mapped to specified operation type or session was not
     * initialized properly. 
     */
    @SuppressWarnings("unchecked")
    public String getParameterName(HttpSession session, String operationType) {
        if (session == null) {
            throw new IllegalArgumentException("The session is null");
        }
        if (!SynchronizerTokenPatternConfig.SUPPORTED_OPERATION_TYPES.contains(operationType)) {
            throw new IllegalArgumentException("Unsupported operation type");
        }
        
        Map<String, String> parameterNames = (Map<String, String>) session.getAttribute(
            SynchronizerTokenPatternConfig.SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES);

        if (parameterNames == null) {
            throw new IllegalArgumentException("The session is not initialized properly");
        }
        
        if (parameterNames.containsKey(operationType)) {
            return parameterNames.get(operationType);
        } else {
            throw new IllegalArgumentException("No request parameter name mapped to operation type");
        }
    }

    /**
     * <p>Gets the synchronizer token which is expected to be provided by client's request for specified type of
     * "protected" operation in context of specified session.</p>
     *
     * @param session an <code>HttpSession</code> specifying the session context.
     * @param operationType a <code>String</code> specifying the operation type.
     * @return a <code>String</code> providing the synchronizer token
     * @throws IllegalArgumentException if specified <code>session</code> is <code>null</code> or specified operation
     * type is not supported or there is no synchronizer token mapped to specified operation type or session was not
     * initialized properly. 
     */
    @SuppressWarnings("unchecked")
    public String getExpectedToken(HttpSession session, String operationType) {
        if (session == null) {
            throw new IllegalArgumentException("The session is null");
        }
        if (!SynchronizerTokenPatternConfig.SUPPORTED_OPERATION_TYPES.contains(operationType)) {
            throw new IllegalArgumentException("Unsupported operation type");
        }

        Map<String, String> tokens = (Map<String, String>) session
            .getAttribute(SynchronizerTokenPatternConfig.SESSION_ATTR_OPERATION_TYPE_TOKENS);

        if (tokens == null) {
            throw new IllegalArgumentException("The session is not initialized properly");
        }

        if (tokens.containsKey(operationType)) {
            return tokens.get(operationType);
        } else {
            throw new IllegalArgumentException("No token mapped to operation type");
        }
    }

    /**
     * <p>Generates the name for request parameter to be used for carrying the synchronizer token.</p>
     *
     * @return a <code>String</code> providing the name of request parameter.
     */
    public String generateParameterName() {
        return UUID.randomUUID().toString();
    }

    /**
     * <p>Generates unique synchronizer token.</p>
     *
     * @return a <code>String</code> providing the unique synchronizer token.
     */
    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    protected static final Logger log = Logger.getLogger(SynchronizerTokenPatternImplementation.class);

    /**
     * <p>Verifies that specified request corresponding to specified "protected" operation provides valid synchronizer
     * token.</p>
     *
     * @param request a <code>TCRequest</code> specifying the request context.
     * @param operationType a <code>String</code> specifying the operation type.
     * @return <code>true</code> if specified request provided valid synchronizer token; <code>false</code> otherwise.
     */
    public boolean validateSynchronizerToken(TCRequest request, String operationType) {

        HttpSession session = request.getSession(false);
        if (session == null) {
            log.error("YYYYYY: session was null");
            return false;
        } else {
            String parameterName = getParameterName(session, operationType);
            String expectedToken = getExpectedToken(session, operationType);
            String tokenFromRequest = request.getParameter(parameterName);
            log.error("YYYYYY: " + session.getId() + " : parameterName = " + parameterName);
            log.error("YYYYYY: " + session.getId() + " : expectedToken = " + expectedToken);
            log.error("YYYYYY: " + session.getId() + " : tokenFromRequest = " + tokenFromRequest);
            log.error("YYYYYY: " + session.getId() + " : (tokenFromRequest != null) && (tokenFromRequest.equals" +
                "(expectedToken) = " + ((tokenFromRequest != null) && (tokenFromRequest.equals(expectedToken))));

            return (tokenFromRequest != null) && (tokenFromRequest.equals(expectedToken));
        }
    }
}
