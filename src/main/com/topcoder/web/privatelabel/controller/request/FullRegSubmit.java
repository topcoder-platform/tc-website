package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.ejb.demographic.Response;
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
        clearRegInfo();
        setNextPage(Constants.VERIZON_REG_SUCCESS_PAGE);
        setIsNextPageInContext(true);
    }

    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        UserPrincipal ret = super.store(regInfo, newUser);
        Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
        Response response = (Response)createEJB(getInitialContext(), Response.class);

        coder.setCoderTypeId(ret.getId(), ((FullRegInfo)regInfo).getCoderType(), db);

        DemographicResponse r = null;
        DemographicQuestion q = null;
        Map questions = FullRegBase.getQuestions(db);
        for (Iterator it = ((FullRegInfo)regInfo).getResponses().iterator(); it.hasNext();) {
            r = (DemographicResponse) it.next();
            q = (DemographicQuestion) questions.get(new Long(r.getQuestionId()));
            response.createResponse(ret.getId(), r.getQuestionId(), db);
            if (q.getAnswerType()==DemographicQuestion.SINGLE_SELECT ||
                    q.getAnswerType()==DemographicQuestion.MULTIPLE_SELECT ) {
                response.setAnswerId(ret.getId(), r.getQuestionId(), r.getAnswerId(), db);
            } else {
                response.setResponseText(ret.getId(), r.getQuestionId(), r.getText(), db);
            }
        }
        //log them is so that they can upload a resume
        //this is really sketchy if they we are requiring an activation email to activate their account
        getAuthentication().login(new SimpleUser(ret.getId(), regInfo.getHandle(), regInfo.getPassword()));


        return ret;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get all reg info from the session, no changes should have been made at this point
        FullRegInfo info = (FullRegInfo)getRegInfoFromPersistor();
        if (info==null) {
            throw new NavigationException("Sorry, your session has expired, you'll have to begin again.");
        }

        return info;
    }


}
