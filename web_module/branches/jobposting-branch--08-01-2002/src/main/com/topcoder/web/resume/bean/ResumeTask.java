package com.topcoder.web.resume.bean;

import com.topcoder.ejb.AuthenticationServices.User;

import javax.servlet.http.HttpServletRequest;

public abstract class ResumeTask {
    protected User user;
    public abstract void process()
            throws ResumeTaskException;
    public abstract String getNextPage();
    public void setUser(User user){
        this.user = user;
    }
}
