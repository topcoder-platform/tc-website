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
			navs.setDefaultNav("contact");
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
      Log.msg(" => TCES.setAttributes():" + param + ":" + values.length);
			return true;
		}
				
		private CoderObject coderObject = new CoderObject();
		public void setCoderObject(CoderObject objIn) { coderObject = objIn; }
 		public CoderObject getCoderObject() { return coderObject; }

    public void process() throws TaskException {
      Log.msg(" => TCES.process()");
			if (currentNav == null) {
				throw new TaskException("TCES.process(): No current task");
			}
			try {
				if (currentNav.getTaskKey().equals("contact")) {
					CoderBean beanCoder = new CoderBean();
					coderObject.coder_id = new Long( (long)currentUser.getUserId() );
					coderObject = beanCoder.request(com.topcoder.web.TCES.ejb.Coder.SELECT, coderObject);
					boolean doUpdate = false;
					if (htParams.get("firstName") != null) {
						coderObject.first_name = ((String[])htParams.get("firstName"))[0];
						doUpdate = true;
					}
					if (htParams.get("lastName") != null) {
						coderObject.last_name = ((String[])htParams.get("lastName"))[0]
						doUpdate = true;
					}
					if (doUpdate) {
						coderObject.state_code=null;
						coderObject.country_code=null;
						//coderObject.first_name=null;
						//coderObject.last_name=null;
						coderObject.home_phone=null;
						coderObject.work_phone=null;
						coderObject.address1=null;
						coderObject.address2=null;
						coderObject.city=null;
						coderObject.zip=null;
						coderObject.middle_name=null;
						coderObject.activation_code=null;
						coderObject.member_since=null;
						coderObject.notify=null;
						coderObject.quote=null;
						coderObject.employer_search=null;
						coderObject.relocate=null;
						coderObject.modify_date=null;
						coderObject.referral_id=null;
						coderObject.editor_id=null;
						coderObject.notify_inquiry=null;
						coderObject.referral_user_id=null;
						coderObject.language_id=null;
						coderObject.coder_type_id=null;
						coderObject.image=null;
						coderObject.date_of_birth=null;
						coderObject = beanCoder.request(com.topcoder.web.TCES.ejb.Coder.UPDATE, coderObject);
						isTaskValidated = true;
					}
		/*
					UserBean beanUser = new UserBean();
					UserObject objUser = new UserObject();
					objUser.user_id = new Long ((long)currentUser.getUserId());
					objUser = beanUser.request(com.topcoder.web.TCES.ejb.User.SELECT, objUser);			
		*/
				}
			} catch (Exception e) {
				throw new TaskException("TCES.process(): Exception: " + e.getMessage());			
			}
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
