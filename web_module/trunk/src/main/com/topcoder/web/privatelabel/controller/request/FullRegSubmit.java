package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.school.CurrentSchool;
import com.topcoder.web.ejb.school.School;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.jobposting.JobPostingServices;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author gpaul 06.26.2003
 */
abstract class FullRegSubmit extends SimpleRegSubmit {
    private static final int HIT_TYPE = 3; //private label reg hit type

    protected void registrationProcessing() throws TCWebException {

        /*
          don't need to check the data cuz it should have
          already been done.  we got it all from the session
          so it should be good
        */
        UserPrincipal newUser = commit(regInfo);
        handleActivation(regInfo, newUser);
        setNextPage();
        clearRegInfo();
    }

    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        UserPrincipal ret = super.store(regInfo, newUser);
        Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
        Response response = (Response)createEJB(getInitialContext(), Response.class);

        coder.setCoderTypeId(ret.getId(), ((FullRegInfo)regInfo).getCoderType(), transDb);

        DemographicResponse r = null;
        DemographicQuestion q = null;
        Map questions = FullRegBase.getQuestions(transDb, regInfo.getCompanyId());

        //remove the current response for questions they have answered
        for (Iterator it = ((FullRegInfo)regInfo).getResponses().iterator(); it.hasNext();) {
            r = (DemographicResponse) it.next();
            int numWacked = response.remove(ret.getId(), r.getQuestionId(), transDb);
            log.debug(numWacked + " response items removed");
        }

        for (Iterator it = ((FullRegInfo)regInfo).getResponses().iterator(); it.hasNext();) {
            r = (DemographicResponse) it.next();
            q = (DemographicQuestion) questions.get(new Long(r.getQuestionId()));
            if (q.getAnswerType()==DemographicQuestion.SINGLE_SELECT ||
                    q.getAnswerType()==DemographicQuestion.MULTIPLE_SELECT ) {
                response.createResponse(ret.getId(), r.getQuestionId(), r.getAnswerId(), transDb);
            } else {
                response.createResponse(ret.getId(), r.getQuestionId(), r.getText(), transDb);
            }
            //if this is the "what school did you go to" question, add a record to the current school table for TCES
            if (q.getId()==Constants.SCHOOL_QUESTION && ((FullRegInfo)regInfo).isStudent()) {
                CurrentSchool cs = (CurrentSchool) createEJB(getInitialContext(), CurrentSchool.class);
                School s = (School) createEJB(getInitialContext(), School.class);
                long schoolId = s.createSchool(transDb, db);
                s.setFullName(schoolId, r.getText(), transDb);
                if (regInfo.isNew()) {
                    cs.createCurrentSchool(ret.getId(), transDb);
                }
                cs.setSchoolId(ret.getId(), schoolId, transDb);
                cs.setSchoolName(ret.getId(), r.getText(), transDb);
            }
        }

        if (isEligible()) {
            long jobId = getJobId();
            if (jobId > 0) {
                JobPostingServices jp = (JobPostingServices)createEJB(getInitialContext(), JobPostingServices.class);
                if (jp.jobExists(jobId, transDb)) {
                    jp.addJobHit(newUser.getId(), jobId, HIT_TYPE, transDb);
                } else {
                    throw new Exception ("Invalid or inactive job " + jobId);
                }
            }
            //put their user id in the session so that they can upload a resume
            getRequest().getSession(true).setAttribute(Constants.USER_ID, new Long(ret.getId()));
        } else {
            User user = (User) createEJB(getInitialContext(), User.class);
            //they're not eligible so override whatever we had set their status to be private label ineligible
            user.setStatus(ret.getId(), '3', transDb);
        }

        return ret;
    }

    /**
     * default is true, subclasses can implement something more interesting
     * @return
     */
    protected boolean isEligible() {
        return true;
    }

    /**
     * default is do nothing, subclasses can implement something more interesting
     * @throws TCWebException
     */
    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {

    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get all reg info from the session, no changes should have been made at this point
        FullRegInfo info = (FullRegInfo)getRegInfoFromPersistor();
        if (info==null) {
            SessionInfo sessInfo = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            throw new NavigationException("Sorry, your session has expired.", sessInfo.getServletPath());
        }

        return info;
    }





}
