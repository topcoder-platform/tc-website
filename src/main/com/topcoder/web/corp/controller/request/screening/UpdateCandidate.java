package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.Transaction;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.common.security.PrincipalMgrException;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserHome;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.ejb.coder.Coder;
import com.topcoder.web.corp.ejb.coder.CoderHome;
import com.topcoder.web.corp.ejb.coder.CompanyCandidate;
import com.topcoder.web.corp.ejb.coder.CompanyCandidateHome;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.web.corp.model.TestSessionInfo;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import java.util.Map;

/**
 * <p>
 * This process will update an existing candidate unless it is a new one.
 * Then it will create a new one.
 * </p>
 *
 * @author Grimicus
 * @version 1.0
 */
public class UpdateCandidate extends BaseProcessor {
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
     * @throws com.topcoder.web.common.TCWebException Thrown if there is input error.
     */
    protected void businessProcessing() throws TCWebException {
        synchronized (UpdateCandidate.class) {
            if (getAuthentication().getUser().isAnonymous()) {
                throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
            }
            try {
                request = getRequest();
                CandidateInfo info = new CandidateInfo();
                if (!buildInfo(request, info)) {
                    //we must have failed validation
                    request.setAttribute(Constants.CANDIDATE_INFO, info);
                    setNextPage(Constants.CANDIDATE_SETUP_PAGE);
                    setIsNextPageInContext(true);
                    return;
                }

                PrincipalMgr principalMgr = new PrincipalMgr();
                EmailHome eHome = (EmailHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(EmailHome.class.getName()), EmailHome.class);
                Email email = eHome.create();

                //check to see if user is logged in...
                //user.isLoggedIn() or something

                TCSubject requestor =
                        principalMgr.getUserSubject(getAuthentication().getUser().getId());

                UserTransaction ut = Transaction.get(getInitialContext());
                ut.begin();

                try {
                    UserPrincipal userPrincipal = null;
                    try {
                        //check to see if user already exists
                        userPrincipal = principalMgr.getUser(info.getUserName());
                    } catch (PrincipalMgrException e) {
                        Throwable nested = e.getNestedException();
                        if (nested == null ||
                                !(nested instanceof NoSuchUserException)) {
                            throw e;
                        }

                        //do nothing, we want to get here
                        //create new user
                        userPrincipal = principalMgr.createUser(info.getUserName(),
                                info.getPassword(),
                                requestor);
                    }

                    long userId = userPrincipal.getId();

                    UserHome uHome = (UserHome)
                            PortableRemoteObject.narrow(
                                    context.lookup(UserHome.class.getName()), UserHome.class);
                    User user = uHome.create();

                    if (!user.userExists(userId, DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME)) {
                        user.createUser(userId, info.getUserName(), 'A', DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME);

                        CoderHome cHome = (CoderHome)
                                PortableRemoteObject.narrow(
                                        context.lookup(CoderHome.class.getName()), CoderHome.class);
                        Coder coder = cHome.create();
                        coder.createCoder(userId, createCoderStatusId);

                        long emailId = email.createEmail(userId, DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME, DBMS.SCREENING_OLTP_DATASOURCE_NAME);
                        email.setAddress(emailId, info.getUserName(), DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME);
                        email.setPrimaryEmailId(userId, emailId, DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME);
                    }

                    DataAccessInt access = Util.getDataAccess();
                    Request dataRequest = new Request();
                    dataRequest.setProperty(DataAccessConstants.COMMAND,
                            Constants.CONTACT_INFO_QUERY_KEY);
                    dataRequest.setProperty("uid", String.valueOf(requestor.getUserId()));
                    Map map = access.getData(dataRequest);
                    ResultSetContainer rsc = (ResultSetContainer)
                            map.get(Constants.CONTACT_INFO_QUERY_KEY);
                    if (rsc.size() == 0 || rsc.size() > 1) {
                        throw new ScreeningException(
                                "Contact result set size wrong(" + rsc.size() + ")");
                    }
                    ResultSetContainer.ResultSetRow row =
                            (ResultSetContainer.ResultSetRow) rsc.get(0);
                    long companyId =
                            Long.parseLong(row.getItem("company_id").toString());

                    CompanyCandidateHome ccHome = (CompanyCandidateHome)
                            PortableRemoteObject.narrow(
                                    context.lookup(CompanyCandidateHome.class.getName()),
                                    CompanyCandidateHome.class);
                    CompanyCandidate candidate = ccHome.create();
                    candidate.createCompanyCandidate(companyId, userId);

                    updateSessionCandidate(userId);
                } catch (Exception e) {
                    ut.rollback();
                    throw e;
                }
                ut.commit();

            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw(new TCWebException(e));
            }


            determineNextPage();
        }
    }

    /**
     * Attempt build a CandidateInfo bean from the parameters passed in
     * on the request.
     *
     * @return a new CandidateInfo object populated with the parameter info
     * @throws java.lang.Exception Thrown if the required properties for the CandidateInfo
     *                   object are not in the request or are invalid.
     */
    private boolean buildInfo(ServletRequest request, CandidateInfo info)
            throws Exception {
        String uId = request.getParameter(Constants.CANDIDATE_ID);
        info.setReferrer(request.getParameter(Constants.REFERRER));
        boolean success = true;
        if (uId != null) {
            //we're not doing updates so this is an error
            //info.setUserId(new Long(uId));
            success = false;
            addError(Constants.CANDIDATE_ID, "Cannot update candidates");
        }

        String email = request.getParameter(Constants.EMAIL_ADDRESS);
        if (email == null) {
            success = false;
            addError(Constants.EMAIL_ADDRESS, "Email is not set.");
        } else {
            email = email.trim();
            success = validateEmail(email);
            info.setUserName(email);
        }

        if (success) {
            //now check to see if user already exists in this company
            DataAccessInt da = Util.getDataAccess();
            Request dr = new Request();
            dr.setProperty(DataAccessConstants.COMMAND,
                    Constants.CHECK_COMPANY_USER_QUERY_KEY);
            dr.setProperty("uid",
                    String.valueOf(getAuthentication().getUser().getId()));
            dr.setProperty("handle", email);
            Map map = da.getData(dr);
            ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.CHECK_COMPANY_USER_QUERY_KEY);
            if (rsc.size() > 0) {
                addError(Constants.EMAIL_ADDRESS,
                        "Email Address already in use as handle for your company.");
                success = false;
            } else {
                info.setPassword(generatePassword());
            }
        }

        return success;
    }

    /**
     * Validate an String that is supposed to be an Email Address
     *
     * @param email The string to evaluate
     * @throws java.lang.Exception Thrown if the string is invalid.  The exception
     *                   holds the information that specifies what was invalid.
     */
    private boolean validateEmail(String email)
            throws Exception {
        StringBuffer errorString = new StringBuffer();
        boolean valid = true;
        if (email.length() < 5) {
            errorString.append("Email Address is too short.  \n");
            valid = false;
        }

        int index = email.indexOf('@');
        if (index == -1) {
            errorString.append("Email Address needs '@' in it.\n");
            valid = false;
        } else if (index == 0) {
            errorString.append("Email Address must have information before '@'. \n");
            valid = false;
        }

        index = email.indexOf('.', index + 2);
        if (index == -1) {
            errorString.append("Email Address needs '.' in it. \n");
            valid = false;
        }

        if ((email.length() <= index + 1) || !Character.isLetter(email.charAt(index + 1))) {
            errorString.append("Email Address must have characters after the '.' \n");
            valid = false;
        }

        if (!valid) {
            errorString.append("Use 'joe@topcoder.com' format");

            addError(Constants.EMAIL_ADDRESS, errorString.toString());
        }

        return valid;
    }

    /**
     * Validate a string that is supposed to be a password
     *
     * @param password  The string to evaluate
     * @throws java.lang.Exception Thrown if the string is invalid and exception holds
     *                   info about what was invalid
     */
    private void validatePassword(String password) throws Exception {
        StringBuffer errorString = new StringBuffer();
        boolean valid = true;
        if (password.length() == 0) {
            errorString.append("Password does not exist\n");
            valid = false;
        }

        //check for characters not allowed...
        for (int i = 0; i < password.length(); ++i) {
            if (Constants.VALID_CHAR_LIST.indexOf(password.charAt(i)) == -1) {
                errorString.append("Character '" + password.charAt(i) + "' is not a valid character to use in a password. Use only '" +
                        Constants.VALID_CHAR_LIST + "'");
                valid = false;
                break;
            }
        }

        if (!valid) {
            throw new Exception(errorString.toString());
        }
    }

    /**
     * Updates the sessionInfo object if there is one with the newly created
     * candidate
     *
     * @param candidateId  THe id of the created candidate
     */
    private void updateSessionCandidate(long candidateId) {
        HttpServletRequest request = getRequest();
        HttpSession session = request.getSession();
        TestSessionInfo info = (TestSessionInfo)
                session.getAttribute(Constants.SESSION_INFO);
        if (info != null) {
            info.setCandidateId(String.valueOf(candidateId));
        }

    }

    /**
     * Determines the next page by the referrer parameter passed in or
     * defaults to the one specified in Constants
     */
    private void determineNextPage() {
        String referrer = request.getParameter(Constants.REFERRER);
        if (referrer == null || referrer.trim().equals("")) {
            referrer = Constants.UC_DEFAULT_FORWARD_PROCESSOR;
        }

        setNextPage(((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath() + "?" +
                Constants.MODULE_KEY + "=" + referrer);
        //redirect because we are done
        setIsNextPageInContext(false);
    }

    private String generatePassword() {
        StringBuffer newPass = new StringBuffer();
        for (int i = 0; i < maxPasswordSize; ++i) {
            newPass.append(
                    Constants.VALID_PASS_CHAR_LIST.charAt(
                            rand(Constants.VALID_PASS_CHAR_LIST.length())));
        }

        return newPass.toString();
    }

    private int rand(int max) {
        return (int) Math.floor(Math.random() * max);
    }
}

