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
import com.topcoder.web.TCES.ejb.*;

public class TCES extends Task implements Serializable {
    boolean VERBOSE = false;
		
		private com.topcoder.common.web.data.User currentUser = null;
		private TCESNav currentNav = null;
		private TCESNav nextNav = null;
		private Hashtable htParams = new Hashtable();
		private boolean isTaskValidated = false;

    public static final String PROTOCOL = "http";
    public static final String HOST = ApplicationServer.SERVER_NAME;
    public static final String PATH = "/tces/";

		public static final String CODER = "Coder";
		
		public static TCESNavs navs = new TCESNavs();

		static {
			navs.add(new TCESNav("contact", PATH, "contact.jsp", "Contact Info"));
			navs.add(new TCESNav("employment", PATH, "employment.jsp", "Employment"));
			navs.add(new TCESNav("education", PATH, "education.jsp", "Education"));
			navs.add(new TCESNav("skills", PATH, "skills.jsp", "Skills"));
			navs.add(new TCESNav("job", PATH, "job.jsp", "Job Builder"));
			navs.add(new TCESNav("done", PATH, "done.jsp", "Finish", false));			
			navs.add(new TCESNav("norating", PATH, "norating.jsp", "Unrated", false));
		}
	   
    public TCES() {
      super();
    	Log.msg(" => TCES.Constructor()");
    }
    
		public TCES(com.topcoder.common.web.data.User userIn, String taskName) {
			super();
      Log.msg(" => TCES.Constructor(User, String)");
			currentUser = userIn;
			currentNav = navs.getTCESNav(taskName);
		}
		    
		public boolean setAttributes(String param, String[] values) {
			htParams.put(param, values);
			return true;
		}
				
    public void process() throws TaskException {
    	Log.msg(VERBOSE,"TCES.process()");
			if (currentNav == null) {
				throw new TaskException("TCES.process(): No current task");
			}
			if (htParams.size() == 0) {
				isTaskValidated = false;
			}
/*
			int user_id = user.getUserId();
			CoderBean beanCoder = new CoderBean();
			CoderObject objCoder = new CoderObject();
			objCoder.coder_id = new Long( (long)user_id );
			objCoder = beanCoder.request(Coder.SELECT, objCoder);

			UserBean beanUser = new UserBean();
			UserObject objUser = new UserObject();
			objUser.user_id = new Long ((long)user_id);
			objUser = beanUser.request(User.SELECT, objUser);			
*/
    }
 
 		public TCESNav getCurrentNav() {
			return currentNav;
		}
 
 		public TCESNav getNextNav() {
			if (!isTaskValidated) {
				return currentNav;
			}
			if (currentNav.getTaskKey().equals("contact")) { return navs.getTCESNav("employment"); }
			if (currentNav.getTaskKey().equals("employment")) { return navs.getTCESNav("education"); }
			if (currentNav.getTaskKey().equals("education")) { return navs.getTCESNav("skills"); }
			//if (currentNav.getTaskKey().equals("skills") && no rating) { return navs.getTCESNav("norating"); }
			//if (currentNav.getTaskKey().equals("skills") && rating) { return navs.getTCESNav("job"); }
			if (currentNav.getTaskKey().equals("job")) { return navs.getTCESNav("done"); }
			return null;
		}
 
    public void setProcess(String ignore) {
        try {
            process();
        } catch (TaskException e) {}
    }        
}
