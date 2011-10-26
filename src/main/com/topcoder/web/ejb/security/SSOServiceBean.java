/*
 * SSOServiceBean
 * 
 * Created Dec 22, 2008
 */
package com.topcoder.web.ejb.security;

import javax.ejb.Stateless;

import com.topcoder.security.UserPrincipal;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.common.security.SecurityTokenGeneratorImpl;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: SSOServiceBean.java 74079 2008-12-22 18:30:50Z dbelfer $
 */
@Stateless
public class SSOServiceBean implements SSOServiceRemote, SSOServiceLocal {
    private static Logger log = Logger.getLogger(SSOServiceBean.class);
    private SecurityTokenGeneratorImpl generator = new SecurityTokenGeneratorImpl();

    public SSOInfo authenticate(String username, String password) throws SSOServiceException {
        try {
            UserPrincipal user = new PrincipalMgr().getUser(username);
            SSOInfo info = generateSSOInfo(username, password, user.getId(), true);
            return info;
        } catch (Exception e) {
            log.error("Failed to authenticate and generate SSO Info: ",e);
            throw new SSOServiceException("Authentication failed");
        }
    }

    public SSOInfo authenticateFromRememberMeToken(String token) throws SSOServiceException {
        try {
            long userId = generator.extractUserFromRememberMeToken(token);
            return generateSSOInfo(userId);
        } catch (Exception e) {
            log.error("Failed to authenticate and generate SSO Info: ",e);
            throw new SSOServiceException("Authentication failed");
        }
    }


    public SSOInfo authenticateFromSSOToken(String ssoToken) throws SSOServiceException {
        try {
            long userId = generator.extractUserFromSSOToken(ssoToken);
            return generateSSOInfo(userId);
        } catch (Exception e) {
            log.error("Failed to authenticate and generate SSO Info: ",e);
            throw new SSOServiceException("Authentication failed");
        }
    }
    
    private SSOInfo generateSSOInfo(String username, String password, long userId, boolean generateRememberMe) throws Exception {
        SSOInfo info = new SSOInfo();
        info.setUserName(username);
        info.setPassword(password);
        info.setUpdatedSSOToken(generator.generateSSOToken(userId));
        if (generateRememberMe) {
            info.setUpdatedRememberToken(generator.generateRememberMeToken(userId));
        }
        return info;
    }

    private SSOInfo generateSSOInfo(long userId) throws Exception {
        PrincipalMgr principalMgr = new PrincipalMgr();
        String password = principalMgr.getPassword(userId);
        String userName = principalMgr.getUser(userId).getName();
        return generateSSOInfo(userName, password, userId, false);
    }
}
