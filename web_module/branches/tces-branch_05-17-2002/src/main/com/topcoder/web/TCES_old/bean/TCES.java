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
                private UserObject userObject = new UserObject();
                public void setUserObject(UserObject o) { userObject = o; }
                public UserObject getUserObject() {return userObject;}
                private ProfileExperienceObject profileExperienceObject = new ProfileExperienceObject();
                public void setProfileExperienceObject(ProfileExperienceObject o) {profileExperienceObject = o;}
                public ProfileExperienceObject getProfileExperienceObject() {return profileExperienceObject;}

    public void process() throws TaskException {
      Log.msg(" => TCES.process()");
			if (currentNav == null) {
				throw new TaskException("TCES.process(): No current task");
			}
			try {
                            
                                if (currentNav.getTaskKey().equals("employment")) {
                                    /*
                                        ProfileExperienceBean profExpBean = new ProfileExperienceBean();
                                        profileExperienceObject.profile_id = new Long((long)currentUser.getUserId());
                                      */  
                                }
                                
				if (currentNav.getTaskKey().equals("contact")) {
                                        CoderBean beanCoder = new CoderBean();
                                        coderObject.coder_id = new Long( (long)currentUser.getUserId() );
                                        coderObject = beanCoder.request(com.topcoder.web.TCES.ejb.Coder.SELECT, coderObject);

                                        UserBean beanUser = new UserBean();
                                        userObject.user_id = coderObject.coder_id;
                                        beanUser.request(com.topcoder.web.TCES.ejb.User.SELECT, userObject);


                                        boolean doUpdate = false;

                                        String[] parameterValues;

                                        isTaskValidated = true;


                                        parameterValues = (String[])htParams.get("firstName");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.first_name = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }


                                        parameterValues = (String[])htParams.get("lastName");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.last_name = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("address1");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.address1 = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("address2");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.address2 = parameterValues[0];
                                        } else {
                                                coderObject.address2 = "";
                                        }

                                        parameterValues = (String[])htParams.get("city");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.city = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("state");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.state_code = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("zip");
                                        if (this.isValid(parameterValues)) {

                                            
                                            boolean zipOK = true;
                                            /*
                                             
                                             if (parameterValues[0].length < 5) {
                                                 zipOK = false;
                                             }
                                             for (int i = 0; i < parameterValues[0].length(); i++) {
                                                 if (Character.isDigit(parameterValues[0].charAt(i))) {
                                                     zipOK = false;
                                                 }
                                             }
                                            //*/
                                            if (zipOK) {
                                                coderObject.zip = parameterValues[0];
                                            } else {
                                                isTaskValidated = false;
                                            }

                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }


                                        parameterValues = (String[])htParams.get("country");
                                        if (this.isValid(parameterValues)) {
                                                coderObject.country_code = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }


                                        parameterValues = (String[])htParams.get("phone");
                                        if (this.isValid(parameterValues)) {
                                            coderObject.home_phone = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("handle");
                                        if (this.isValid(parameterValues)) {
                                            userObject.handle = parameterValues[0];
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        String password = "";
                                        String confirmPassword = "";
                                        parameterValues = (String[])htParams.get("password");
                                        if (this.isValid(parameterValues)) {
                                            password = parameterValues[0];
                                        }
                                        parameterValues = (String[])htParams.get("confirmPassword");
                                        if (this.isValid(parameterValues)) {
                                            confirmPassword = parameterValues[0];
                                        }
                                        if (!(confirmPassword.equals("") && password.equals(""))) {
                                            if (confirmPassword.equals(password) && password.length() >= 7) {
                                                userObject.password = password;
                                            } else {
                                                //xxx todo - add error redirect
                                                isTaskValidated = false;
                                            }
                                        }


                                        String email = "";
                                        String confirmEmail = "";

                                        parameterValues = (String[])htParams.get("email");
                                        if (this.isValid(parameterValues)) {
                                            email = parameterValues[0];
                                        }
                                        parameterValues = (String[])htParams.get("confirmEmail");
                                        if (this.isValid(parameterValues)) {
                                            confirmEmail = parameterValues[0];
                                        }

                                        if (email.indexOf("@") == -1 || email.indexOf(".") == -1 || !(email.equals(confirmEmail))) {
                                            isTaskValidated = false;
                                        } else {
                                            userObject.email = parameterValues[0];
                                        }

                                        parameterValues = (String[])htParams.get("quote");
                                        if (this.isValid(parameterValues)) {
                                            coderObject.quote = parameterValues[0];
                                        } 

                                        parameterValues = (String[])htParams.get("language");
                                        if (this.isValid(parameterValues)) {
                                            try {
                                                coderObject.language_id = new Integer(parameterValues[0]);
                                            } catch (NumberFormatException exc) {
                                                coderObject.language_id = null;
                                            }
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        parameterValues = (String[])htParams.get("editor");
                                        if (this.isValid(parameterValues)) {
                                            try {
                                                coderObject.editor_id = new Integer(parameterValues[0]);
                                            } catch (NumberFormatException exc) {
                                                coderObject.editor_id = null;
                                            }
                                        } else {
                                            //xxx todo - add error redirect
                                            isTaskValidated = false;
                                        }

                                        if (isTaskValidated) {

                                            /*
                                                coderObject.work_phone=null;
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
                                             **/
                                                coderObject = beanCoder.request(com.topcoder.web.TCES.ejb.Coder.UPDATE, coderObject);
                                                userObject = beanUser.request(com.topcoder.web.TCES.ejb.User.UPDATE, userObject);

                                                //isTaskValidated = true;
                                        }
                                                        /*
                                                                                UserBean beanUser = new UserBean();
                                                                                UserObject objUser = new UserObject();
                                                                                objUser.user_id = new Long ((long)currentUser.getUserId());
                                                                                objUser = beanUser.request(com.topcoder.web.TCES.ejb.User.SELECT, objUser);			
                                                        */
				}
			} catch (Exception e) {
                                Log.msg("Exception while processing TCES.process(): " + e.getMessage());
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
    
    //trj - add convenience function
    private static boolean isValid(String[] s) {
        return (s != null && s.length > 0 && s[0] != null && !s[0].trim().equals(""));
    }
}
