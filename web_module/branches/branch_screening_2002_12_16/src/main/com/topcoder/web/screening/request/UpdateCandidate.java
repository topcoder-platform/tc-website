package com.topcoder.web.screening.request;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;

import com.topcoder.web.screening.model.CandidateInfo;

import com.topcoder.web.ejb.user.Coder;
import com.topcoder.web.ejb.user.CoderHome;
//import com.topcoder.web.ejb.user.Email;
//import com.topcoder.web.ejb.user.EmailHome;
//import com.topcoder.web.ejb.user.User;
//import com.topcoder.web.ejb.user.UserHome;

/** 
 * <p>
 * This process will update an existing candidate unless it is a new one.
 * Then it will create a new one.
 * </p>
 *
 * @author Dan Tomalesky
 * @version 1.0
 */
public class UpdateCandidate extends BaseProcessor
{
    /** String with the total list of character able to be used in a password */
    private static final String VALUE_SPACE = 
        "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 

    /** Page to forward to if we don't have a referrer specified */
    private static final String DEFAULT_PAGE_NAME = "CandidateList";

    /** The request variable for this particular processor */
    private ServletRequest request;

    /** 
     * Processes the inputted information specified for CandidateSetup.
     * Decides if it is a new or old one and updates/creates if applicable.
     * 
     * @throws Exception Thrown if there is input error.
     */
    public void process() throws Exception {
        request = getRequest();
        CandidateInfo info = buildInfo();

        InitialContext context = new InitialContext();
        CoderHome cHome = (CoderHome)PortableRemoteObject.narrow(context.lookup(CoderHome.class.getName()), CoderHome.class);
        Coder coder = cHome.create();
        //UserHome uHome = (UserHome)PortableRemoteObject.narrow(context.lookup(UserHome.class.getName()), UserHome.class);
        //User user = uHome.create();
        //EmailHome eHome = 
        //        (EmailHome)PortableRemoteObject.narrow(context.lookup(EmailHome.class.getName()), EmailHome.class);
        //Email user = eHome.create();
        if(info.getCandidateId() == null) {
            //create new user
            //long userId = user.createUser();
            
            //we have a new candidate
            //long newCandidateId = coder.createCoder(0/*some coder status id*/);
            //if(newCandidateId == -1) {
            //  throw new Exception("Failed to generate new candidate");
            //}
            //info.setCandidateId(new Long(newCandidateId));
        }

        //email.setEmailAddress(info.getCandidateId().longValue(), 
        //                        info.getEmailAddress());
        //user.setPassword(info.getCandidateId().longValue(),
        //                    info.getPassword());

        determineNextPage();
    }

    private CandidateInfo buildInfo() throws Exception {
        CandidateInfo info = new CandidateInfo();
        String candId = request.getParameter("candidateId");
        if(candId != null) {
            info.setCandidateId(new Long(candId));
        }

        String email = request.getParameter("emailAddress");
        if(email == null) {
            throw new Exception("Email is not set.");
        }
        validateEmail(email);
        info.setEmailAddress(email);
        String password = request.getParameter("password");
        if(password == null) {
            throw new Exception("Password is not set.");
        }
        validatePassword(password);
        info.setPassword(password);
        return info;
    }

    private void validateEmail(String email) throws Exception {
        StringBuffer errorString = new StringBuffer();
        boolean valid = true;
        if(email.length() < 5) {
            errorString.append("Email Address is too short.  \n");
            valid = false;
        }

        int index = email.indexOf('@');
        if(index == -1) {
            errorString.append("Email Address needs '@' in it.\n");
            valid = false;
        }
        else if(index == 0) {
            errorString.append("Email Address must have information before '@'. \n");
            valid = false;
        }

        index = email.indexOf('.', index + 2);
        if(index == -1) {
            errorString.append("Email Address needs '.' in it. \n");
            valid = false;
        }

        if((email.length() <= index + 1) || !Character.isLetter(email.charAt(index + 1))) {
            errorString.append("Email Address must have characters after the '.' \n");
            valid = false;
        }

        if(!valid) {
            errorString.append("Use 'joe@topcoder.com' format");
            throw new Exception(errorString.toString());
        }
    }
    private void validatePassword(String password) throws Exception {
        StringBuffer errorString = new StringBuffer();
        boolean valid = true;
        if(password.length() == 0) {
            errorString.append("Password does not exist\n");
            valid = false;
        }

        //check for characters not allowed...
        for(int i = 0; i < password.length(); ++i) {
            if(VALUE_SPACE.indexOf(password.charAt(i)) == -1) {
                errorString.append("Character '" + password.charAt(i) + "' is not a valid character to use in a password. Use only '" + VALUE_SPACE + "'");
                valid = false;
                break;
            }
        }

        if(!valid){
            throw new Exception(errorString.toString());
        }
    }

    private void determineNextPage() {
        String referrer = request.getParameter("referrer");
        if(referrer == null) {
            referrer = DEFAULT_PAGE_NAME;
        }

        setNextPage("/screening?rp= " + referrer);
        //redirect because we are done
        setNextPageInContext(false);
    }
}

