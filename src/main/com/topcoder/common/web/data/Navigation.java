package com.topcoder.common.web.data;

import com.topcoder.common.web.error.TCException;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.SecurityHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.HashMap;

/**
 * This class stores login information about site navigation.
 *
 * @author Steve Burrows
 */
public final class Navigation
        implements Serializable {

    private User user;
    private HashMap sessionObjects;
    private static Logger log = Logger.getLogger(Navigation.class);
    private CoderSessionInfo info;


    /**
     * The constructor for the class. Initializes instance variables.
     */
    public Navigation() {
        user = new User();
        sessionObjects = new HashMap(3);
        info = new CoderSessionInfo();
    }

    public Navigation(TCRequest request, CoderSessionInfo info) throws TCException {
        this();
        this.info = info;

    }

    public Navigation(HttpServletRequest request, HttpServletResponse response) throws TCException {
        this();
        try {
            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
                    tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            TCSubject user = SecurityHelper.getUserSubject(authentication.getActiveUser().getId());
            info = new CoderSessionInfo(tcRequest, authentication, user.getPrincipals());
        } catch (Exception e) {
            throw new TCException();
        }
    }

    public Navigation(TCRequest request, TCResponse tcResponse) throws TCException {
        this();
        try {
            WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, tcResponse, BasicAuthentication.MAIN_SITE);
            TCSubject user = SecurityHelper.getUserSubject(authentication.getActiveUser().getId());
            info = new CoderSessionInfo(request, authentication, user.getPrincipals());

        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException();
        }
    }

    public int getUserId() {
        return (int) info.getUserId();
    }

    public boolean isIdentified() {
        return !info.isAnonymous();
    }

    public boolean isLoggedIn() {
        return info.isLoggedIn();
    }

    public User getUser() {
        return this.user;
    }


    public HashMap getSessionObjects() {
        return this.sessionObjects;
    }


    public void setUser(User user) {

        this.user = user;
        log.debug("common.Navigation:setUser:user set");
    }

    public void setSessionObjects(HashMap sessionObjects) {
        this.sessionObjects = sessionObjects;
    }

    public CoderSessionInfo getSessionInfo() {
        return info;
    }

    public void setCoderSessionInfo(CoderSessionInfo info) {
        this.info = info;
    }


}
