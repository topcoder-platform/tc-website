package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.security.UserPrincipal;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.legacy.resume.bean.Resume;

import javax.servlet.http.HttpUtils;
import java.util.Map;

/**
 * <p>A request pre-processor responsible to get the details for the speicified candidate and put them to request for
 * further rendering by either existing <code>Candidate Setup JSP</code> or the newly created <code>Profile JSP</code>.
 * </p>
 *
 * <p>As of <code>Screening Tool 1.1</code> this pre-processor supports two usage styles used by the companies to access
 * the <code>Screening Tool</code> application. The first one corresponds to usage type provided with <code>Screening
 * Tool 1.0</code> application (involving user's setting up candidates to take test). In this case the pre-processor
 * pre-processes the <code>CandidateSetup</code> page so that if an existing candidate is being edited, the information
 * for that candidate will be loaded. Checks the request for an existing <code>CandidateInfo</code> object. If it does
 * not exist, checks to see if there is a candidate ID in the parameter list of the request. If so, then it lookups up
 * the <code>CandidateInfo</code> for that id.</p>
 *
 * <p>The second usage type is introduced with <code>Screening Tool 1.1</code> and causes the candidates to register to
 * take a test. In this case the pre-processor gets all candidate's relevant info from the database, saves it to request
 * for further rendering and redirects the user to newly created <code>Profile JSP</code> page.</p>
 *
 * @author  Dan Tomalesky (grim@xynesis.com)
 * @author  isv
 * @version 1.1 07/14/2004
 */
public class PopulateCandidate extends BaseScreeningProcessor {

    /**
     * A <code>Logger</code> to log the <code>PopulateCandidate</code> processor activities.
     */
    private final static Logger log = Logger.getLogger(PopulateCandidate.class);

    /**
     * A main method of <code>PopulateCandidate</code> processor. Depending on the <code>Screening Tool</code>
     * application usage type set for the company the user is associated with either behaves as before if a company is
     * using the <code>Screening Tool</code> application in a <code>version 1.0</code>-like style (involving user's
     * setting up candidates to take test) or displays the full candidate's profile info to the user if a company is
     * using the system in the new way (causing the candidates to register to take a test).
     *
     * @throws TCWebException if any error prevents the normal process flow.
     */
    protected void screeningProcessing() throws TCWebException {

        // First, determine the company usage type
        long usageType = getUsageType();

        // If the usage type is correct then process the request
        if (usageType == Constants.USAGE_TYPE_TESTING) {
            processUsageType1();
        } else if (usageType == Constants.USAGE_TYPE_SCREENING) {
            processUsageType2();
        } else {
            // otherwise notify the user about the invalid usage type set for the company
            throw new ScreeningException("The application usage type set for the company is not recognized.");
        }
    }

    /**
     * The previous code corresponding to old usage type had been moved from <code>businessProcessing()</code> method to
     * this method unchanged.
     *
     * @throws TCWebException if any error prevents the normal process flow.
     * @since  Screening Tool 1.1
     */
    private void processUsageType1() throws TCWebException {

        String uId = getRequest().getParameter(Constants.CANDIDATE_ID);

        if (getRequest().getAttribute(Constants.CANDIDATE_INFO) == null) {

            CandidateInfo info = new CandidateInfo();

            if (uId != null) {
                info.setIsNew(false);
                long userId = Long.parseLong(uId);

                //do some kind of db lookup
                PrincipalMgr principalMgr = new PrincipalMgr();

                //will throw exception or return null?
                info.setUserId(new Long(userId));

                UserPrincipal user = principalMgr.getUser(userId);
                if (user != null) {
                    info.setUserName(user.getName());
                    info.setPassword(principalMgr.getPassword(userId));
                }

                try {
                    DataAccessInt dAccess = Util.getDataAccess();

                    Request dr = new Request();
                    dr.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
                    dr.setContentHandle("noteList");
                    dr.setProperty("uid", String.valueOf(getUser().getId()));

                    Map map = dAccess.getData(dr);

                    if (map != null) {
                        ResultSetContainer result = (ResultSetContainer) map.get("candidateInfo");
                        if (result.getRowCount() == 0) {
                            throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                                    "User not authorized to view information about candidate: " +
                                    dr.getProperty("cid") == null ? "?" : dr.getProperty("cid"));
                        }
                        result = (ResultSetContainer) map.get("noteList");
                        info.setNoteList(result);
                    }
                } catch (TCWebException e) {
                    throw e;
                } catch (Exception e) {
                    throw(new TCWebException(e));
                }
            }

            //set this so we don't lose the value
            info.setReferrer(getRequest().getParameter(Constants.REFERRER));

            getRequest().setAttribute(Constants.CANDIDATE_INFO, info);
        }

        setNextPage(Constants.CANDIDATE_SETUP_PAGE);
        setIsNextPageInContext(true);
    }

    /**
     * Gets the profile data for requested candidate and puts it to the request for further rendering by the <code>
     * Candidate profile page</code>. Executes a <code>CANDIDATE_PROFILE_INFO</code> command through the <code>Query
     * Tool</code> and puts the returned parts of the candidate's profile to the request. This method expects an ID of
     * requested candidate to be provided with incoming request.
     *
     * @throws TCWebException if any error prevents the profile data retrieval.
     * @throws PermissionDeniedException if current user does not have a permission to access the candidate's profile.
     * @since  Screening Tool 1.1
     */
    private void processUsageType2() throws TCWebException {

        // Get the ID of requested candidate from the incoming request
        String cid = getRequest().getParameter(Constants.CANDIDATE_ID);

        // If an ID for a requested candidate is specified then get profile data for specified candidate
        if (cid != null) {

            try {

                // Issue a request for profile details for specified candidate
                Request dr = new Request();
                dr.setContentHandle(Constants.CANDIDATE_PROFILE_INFO);
                dr.setProperty("uid", String.valueOf(getUser().getId()));
                dr.setProperty("cid", cid);

                log.debug("Got the request to load profile details for candidate:" + cid + ", user : "
                        + getUser().getId());

                Map map = Util.getDataAccess().getData(dr);

                if (map != null) {
                    ResultSetContainer result = (ResultSetContainer) map.get(Constants.CANDIDATE_INFO);

                    // Check that the user has a permission to access the candidate's info
                    if (result.getRowCount() == 0) {
                        throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                                "User not authorized to view information about candidate: " +
                                dr.getProperty("cid") == null ? "?" : dr.getProperty("cid"));
                    }

                    // Populate the request with candidate's profile data for further rendering by Profile JSP
                    TCRequest request = getRequest();

                    // Save the main candidate info to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_INFO);
                    request.setAttribute(Constants.CANDIDATE_INFO, result);

                    // Save the email address to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_EMAIL);
                    request.setAttribute(Constants.CANDIDATE_EMAIL, result);

                    // Save the personal info to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_PERSONAL_INFO);
                    request.setAttribute(Constants.CANDIDATE_PERSONAL_INFO, result);

                    // Save the address info to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_ADDRESS_INFO);
                    request.setAttribute(Constants.CANDIDATE_ADDRESS_INFO, result);

                    // Save the demographic info to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_DEMOGRAPHIC_INFO);
                    request.setAttribute(Constants.CANDIDATE_DEMOGRAPHIC_INFO, result);

                    // Save the candidate's notes to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_NOTES);
                    request.setAttribute(Constants.CANDIDATE_NOTES, result);

                    // Save the candidate's problem solving data to the request
                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_PROBLEMS_INFO);
                    request.setAttribute(Constants.CANDIDATE_PROBLEMS_INFO, result);

                    result = (ResultSetContainer) map.get(Constants.CANDIDATE_PREFERENCE_INFO);
                    request.setAttribute(Constants.CANDIDATE_PREFERENCE_INFO, result);

                    request.setAttribute(Constants.USER_ID, String.valueOf(getUser().getId()));

                    PrincipalMgr mgr = new PrincipalMgr();
                    request.setAttribute("password", mgr.getPassword(Long.parseLong(cid)));

                    //get Resume Information
                    ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
                    Resume resume = resumeServices.getResume(Long.parseLong(cid), Constants.DATA_SOURCE);

                    if (resume == null) {
                        request.setAttribute("resume", "");
                    } else
                        request.setAttribute("resume", StringUtils.checkNull(resume.getFileName()));


                    log.debug("The problems info list contains : " + result.size() + " records");

                } else {
                    // if Query Tool returned null (in fact this should never happen) - notify the user that something
                    // went wrong
                    throw new ScreeningException("An unexpected error occured while retrieving the candidate's profile.");
                }
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw(new ScreeningException(e));
            }

            // Forward the request to newly defined "Candidate profile page"
            setNextPage(Constants.CANDIDATE_PROFILE_PAGE);
            setIsNextPageInContext(true);

        } else {
            // notify the user about the necessity to select a candidate to display the profile details for
            throw new ScreeningException("The candidate ID is not specified.");
        }
    }
}
