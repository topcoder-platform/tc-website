package com.topcoder.web.screening.request;

import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;

import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.NoSuchUserException;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserHome;
import com.topcoder.web.ejb.user.CompanyCandidate;
import com.topcoder.web.ejb.user.CompanyCandidateHome;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.ejb.coder.Coder;
import com.topcoder.web.screening.ejb.coder.CoderHome;
import com.topcoder.web.screening.model.CandidateInfo;
import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.common.security.PrincipalMgrException;

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
    private final int createCoderStatusId;
    private final int maxPasswordSize;

    /** The request variable for this particular processor */
    private ServletRequest request;

    public UpdateCandidate() {
        createCoderStatusId = 
            Integer.parseInt(Constants.UC_CREATE_CODER_STATUS_ID);
        maxPasswordSize = Integer.parseInt(Constants.MAX_PASSWORD_SIZE);
    }

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
        PrincipalMgr principalMgr = new PrincipalMgr();
        EmailHome eHome = (EmailHome)
            PortableRemoteObject.narrow(
                    context.lookup(EmailHome.class.getName()), EmailHome.class);
        Email email = eHome.create();
            
        //check to see if user is logged in...
        //user.isLoggedIn() or something 
        
        TCSubject requestor = 
            principalMgr.getUserSubject(getAuthentication().getUser().getId());

        UserPrincipal userPrincipal = null;
        try {
            //check to see if user already exists
            userPrincipal = principalMgr.getUser(info.getEmailAddress());
        }
        catch(PrincipalMgrException e) {
            Throwable nested = e.getNestedException();
            if(nested == null ||
               !(nested instanceof NoSuchUserException)) {
                   throw e;
            }

            //do nothing, we want to get here
            //create new user
            userPrincipal = principalMgr.createUser(info.getEmailAddress(), 
                                    info.getPassword(),
                                    requestor);
        }

        long userId = userPrincipal.getId();
        
        UserHome uHome = (UserHome)
            PortableRemoteObject.narrow(
                context.lookup(UserHome.class.getName()), UserHome.class);
        User user = uHome.create();
        user.createUser(userId, info.getEmailAddress(), 'A');

        CoderHome cHome = (CoderHome)
            PortableRemoteObject.narrow(
                context.lookup(CoderHome.class.getName()), CoderHome.class);
        Coder coder = cHome.create();
        coder.createCoder(userId, createCoderStatusId);

        DataAccess access = getDataAccess();
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND,
                            Constants.CONTACT_INFO_QUERY_KEY);
        dataRequest.setProperty("uid", String.valueOf(requestor.getUserId()));
        Map map = access.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer)
                map.get(Constants.CONTACT_INFO_QUERY_KEY);
        if(rsc.size() == 0 || rsc.size() > 1) {
            throw new ScreeningException(
                    "Contact result set size wrong(" + rsc.size() + ")");
        }
        ResultSetContainer.ResultSetRow row = 
            (ResultSetContainer.ResultSetRow)rsc.get(0);
        long companyId = 
            Long.parseLong(row.getItem("company_id").toString());

        CompanyCandidateHome ccHome = (CompanyCandidateHome)
            PortableRemoteObject.narrow(
                context.lookup(CompanyCandidateHome.class.getName()), 
                               CompanyCandidateHome.class);
        CompanyCandidate candidate = ccHome.create();
        candidate.createCompanyCandidate(companyId, userId);

        long emailId = email.createEmail(userId);
        email.setAddress(emailId, userId, info.getEmailAddress());
        email.setPrimary(emailId, userId, true);
        
        determineNextPage();
    }

    /** 
     * Attempt build a CandidateInfo bean from the parameters passed in
     * on the request.
     * 
     * @return a new CandidateInfo object populated with the parameter info
     * @throws Exception Thrown if the required properties for the CandidateInfo
     *                   object are not in the request or are invalid.
     */
    private CandidateInfo buildInfo() throws Exception {
        CandidateInfo info = new CandidateInfo();
        String uId = request.getParameter(Constants.CANDIDATE_ID);
        if(uId != null) {
            info.setUserId(new Long(uId));
        }

        String email = request.getParameter(Constants.EMAIL_ADDRESS);
        if(email == null) {
            throw new Exception("Email is not set.");
        }
        validateEmail(email);
        info.setEmailAddress(email);
        String password = request.getParameter(Constants.PASSWORD);
        if(password == null) {
            password = generatePassword();
        }
        //validatePassword(password);  don't need anymore cuz we always
        //make the password
        info.setPassword(password);
        return info;
    }

    /** 
     * Validate an String that is supposed to be an Email Address
     * 
     * @param email The string to evaluate
     * @throws Exception Thrown if the string is invalid.  The exception
     *                   holds the information that specifies what was invalid.
     */
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

    /** 
     * Validate a string that is supposed to be a password
     *
     * @param password  The string to evaluate
     * @throws Exception Thrown if the string is invalid and exception holds
     *                   info about what was invalid
     */
    private void validatePassword(String password) throws Exception {
        StringBuffer errorString = new StringBuffer();
        boolean valid = true;
        if(password.length() == 0) {
            errorString.append("Password does not exist\n");
            valid = false;
        }

        //check for characters not allowed...
        for(int i = 0; i < password.length(); ++i) {
            if(Constants.VALID_CHAR_LIST.indexOf(password.charAt(i)) == -1) {
                errorString.append("Character '" + password.charAt(i) + "' is not a valid character to use in a password. Use only '" + 
                        Constants.VALID_CHAR_LIST + "'");
                valid = false;
                break;
            }
        }

        if(!valid){
            throw new Exception(errorString.toString());
        }
    }

    /** 
     * Determines the next page by the referrer parameter passed in or
     * defaults to the one specified in Constants
     */
    private void determineNextPage() {
        String referrer = request.getParameter(Constants.REFERRER);
        if(referrer == null) {
            referrer = Constants.UC_DEFAULT_FORWARD_PROCESSOR;
        }

        setNextPage(Constants.CONTROLLER_URL + "?" + 
                    Constants.REQUEST_PROCESSOR + "=" + referrer);
        //redirect because we are done
        setNextPageInContext(false);
    }

    private String generatePassword() {
        StringBuffer newPass = new StringBuffer();
        for(int i = 0; i < maxPasswordSize; ++i) {
            newPass.append(
                Constants.VALID_CHAR_LIST.charAt(
                    rand(Constants.VALID_CHAR_LIST.length())));
        }
        
        return newPass.toString();
    }

    private int rand(int max) {
        return (int)Math.floor(Math.random()*max);
    }
}

