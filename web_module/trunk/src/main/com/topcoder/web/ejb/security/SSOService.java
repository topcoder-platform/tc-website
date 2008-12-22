/*
 * SSOService
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.ejb.security;


/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public interface SSOService {

    SSOInfo authenticateFromSSOToken(String ssoToken) throws SSOServiceException;

    SSOInfo authenticateFromRememberMeToken(String token) throws SSOServiceException;

    SSOInfo authenticate(String userName, String password) throws SSOServiceException;

}
