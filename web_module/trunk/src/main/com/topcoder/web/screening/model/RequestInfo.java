package com.topcoder.web.screening.model;

import com.topcoder.shared.security.User;

public class RequestInfo extends BaseModel {
    private String controllerUrl;
    private User user;

    public RequestInfo() {
        controllerUrl = "";
    }

    public void setControllerUrl( String val )
    {
        controllerUrl = val;
    }

    public String getControllerUrl()
    {
        return controllerUrl;
    }

    public void setUser( User val )
    {
        user = val;
    }

    public User getUser()
    {
        return user;
    }

    public boolean isLoggedIn() {
        if(user == null) return false;

        return (user.isAnonymous());
    }

}
