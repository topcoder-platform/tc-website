package com.topcoder.web.tces.bean;

import java.io.*;
import java.math.*;
import java.util.*;
import javax.naming.*;
import javax.transaction.Status;
import javax.transaction.UserTransaction;

import com.topcoder.common.*;
import com.topcoder.common.web.constant.*;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.*;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.DataCache.*;
import com.topcoder.ejb.UserServices.*;
import com.topcoder.web.tces.common.*;
import com.topcoder.web.tces.servlet.*;
import com.topcoder.web.tces.servlet.jsp.tag.*;

public class TCES extends Task implements Serializable {
    boolean VERBOSE = false;

    public static final String PROTOCOL = "http";
    public static final String HOST = ApplicationServer.SERVER_NAME;
    public static final String PATH = "/tces/";

		public static TCESNavs navs = new TCESNavs();

		static {
			navs.add(new TCESNav("contact", PATH, "contact.jsp"));
			navs.add(new TCESNav("employment", PATH, "employment.jsp"));
			navs.add(new TCESNav("education", PATH, "education.jsp"));
			navs.add(new TCESNav("skills", PATH, "skills.jsp"));
			navs.add(new TCESNav("job", PATH, "job.jsp"));
		}
    
    public TCES() {
        super();
        init();
    }
    
    void init() {
        Log.msg(" => TCES.INIT()");
        
        if (user == null || user.getUserId() == 0) {
            resetUser();
        } else {
            loadUser();            
        }
    }
    
    public void setUser(User user) {
        super.setUser(user);
        if (userChanged) {
            userChanged = false;
            loadUser();
        }
    }
    
    void loadUser() {
        if (user == null || user.getUserId() == 0) return;
        Log.msg(VERBOSE,"loading User data");        
        CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get(CODER);
    }
    
    public void process() throws TaskException {
        Log.msg(VERBOSE,"TCES.process()");
    }
 
    public void setProcess(String ignore) {
        try {
            process();
        } catch (TaskException e) {}
    }        
}
