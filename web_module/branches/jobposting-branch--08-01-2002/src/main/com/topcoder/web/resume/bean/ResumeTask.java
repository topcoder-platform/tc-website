package com.topcoder.web.resume.bean;

import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.web.resume.servlet.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;

public abstract class ResumeTask {
    protected User user;
    public abstract void process()
            throws ResumeTaskException;
    public abstract void getNextPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
    public void setUser(User user){
        this.user = user;
    }
}
