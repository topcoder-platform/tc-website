package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
import com.topcoder.web.ejb.school.CurrentSchool;
import com.topcoder.web.ejb.school.School;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.shared.security.SimpleUser;

import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author gpaul 06.26.2003
 */
public class FullRegSubmit extends SimpleRegSubmit {

    protected void registrationProcessing() throws TCWebException {

        /*
          don't need to check the data cuz it should have
          already been done.  we got it all from the session
          so it should be good
        */
        commit(regInfo);

        //if there reg info suggests they're not eligible, give them the ineligible page
        if (isEligible()) {
            setNextPage(Constants.VERIZON_REG_SUCCESS_PAGE);
        } else {
            setNextPage(Constants.VERIZON_INELIGIBLE_PAGE);
        }
        setIsNextPageInContext(true);

        clearRegInfo();
    }

    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        UserPrincipal ret = super.store(regInfo, newUser);
        Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
        Response response = (Response)createEJB(getInitialContext(), Response.class);

        coder.setCoderTypeId(ret.getId(), ((FullRegInfo)regInfo).getCoderType(), transDb);

        DemographicResponse r = null;
        DemographicQuestion q = null;
        Map questions = FullRegBase.getQuestions(transDb);
        for (Iterator it = ((FullRegInfo)regInfo).getResponses().iterator(); it.hasNext();) {
            r = (DemographicResponse) it.next();
            q = (DemographicQuestion) questions.get(new Long(r.getQuestionId()));
            response.createResponse(ret.getId(), r.getQuestionId(), transDb);
            if (q.getAnswerType()==DemographicQuestion.SINGLE_SELECT ||
                    q.getAnswerType()==DemographicQuestion.MULTIPLE_SELECT ) {
                response.setAnswerId(ret.getId(), r.getQuestionId(), r.getAnswerId(), transDb);
            } else {
                response.setResponseText(ret.getId(), r.getQuestionId(), r.getText(), transDb);
            }
            //if this is the "what school did you go to" question, add a record to the current school table for TCES
            if (q.getId()==Constants.SCHOOL_QUESTION && ((FullRegInfo)regInfo).isStudent()) {
                CurrentSchool cs = (CurrentSchool) createEJB(getInitialContext(), CurrentSchool.class);
                School s = (School) createEJB(getInitialContext(), School.class);
                long schoolId = s.createSchool(transDb, db);
                s.setFullName(schoolId, r.getText(), transDb);
                cs.createCurrentSchool(ret.getId(), r.getText(), schoolId, transDb);

            }
        }

        if (isEligible()) {
            //log them is so that they can upload a resume
            //this is really sketchy if they we are requiring an activation email to activate their account
            getAuthentication().login(new SimpleUser(ret.getId(), regInfo.getHandle(), regInfo.getPassword()));
        } else {
            User user = (User)createEJB(getInitialContext(), User.class);
            user.setStatus(ret.getId(), 'U');  //they're not eligible so override whatever we had set their status to be unactive
        }

        return ret;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get all reg info from the session, no changes should have been made at this point
        FullRegInfo info = (FullRegInfo)getRegInfoFromPersistor();
        if (info==null) {
            throw new NavigationException("Sorry, your session has expired.");
        }

        return info;
    }

    /**
     *
     * @return
     */
    protected boolean isEligible() {
        boolean ret = true;
        ret &= regInfo.getCity().toLowerCase().equals("chennai");
        ret &= regInfo.getCountryCode().equals("356"); //india
        return ret;
    }

}
