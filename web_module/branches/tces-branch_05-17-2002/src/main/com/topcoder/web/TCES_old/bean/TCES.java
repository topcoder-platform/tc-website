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
		
		private User currentUser = null;
		private TCESNav currentNav = null;
		private TCESNav nextNav = null;
		private Hashtable htParams = new Hashtable();
		private boolean isTaskValidated = true;

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
    
		public TCES(User userIn, String taskName) {
			super();
      Log.msg(" => TCES.Constructor(User, String)");
			currentUser = userIn;
			currentNav = navs.getTCESNav(taskName);
		}
		    
		public void setAttributes(String param, String[] values) {
			htParams.put(param, values);
			if (currentNav.getTaskKey().equals("contact")) {
				
			}
		}
				
    public void process() throws TaskException {
    	Log.msg(VERBOSE,"TCES.process()");
			if (currentNav == null) {
				throw new TaskException("TCES.process(): No current task");
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
			if (currentTask.getTaskKey().equals("contact")) { return navs.getTCESNav("employment"); }
			if (currentTask.getTaskKey().equals("employment")) { return navs.getTCESNav("education"); }
			if (currentTask.getTaskKey().equals("education")) { return navs.getTCESNav("skills"); }
			//if (currentTask.getTaskKey().equals("skills") && no rating) { return navs.getTCESNav("norating"); }
			//if (currentTask.getTaskKey().equals("skills") && rating) { return navs.getTCESNav("job"); }
			if (currentTask.getTaskKey().equals("job")) { return navs.getTCESNav("done"); }
		}
 
    public void setProcess(String ignore) {
        try {
            process();
        } catch (TaskException e) {}
    }        
}
