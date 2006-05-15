package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.model.DemographicAssignment;
import com.topcoder.web.reg.model.DemographicResponse;
import com.topcoder.web.reg.model.User;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Confirm extends Base {

    protected void registrationProcessing() throws Exception {

        User u = getRegUser();
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has timed out.");
        } else if (u.isNew() || userLoggedIn()) {
            
            Map params = getSecondaryUserInput();

            checkSecondaryFields(params);

            Set fields = new HashSet(RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u));
            log.debug(fields.size() + " fields found");

            if (hasErrors()) {
                Map.Entry me;
                for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
                    me = (Map.Entry) it.next();
                    setDefault((String) me.getKey(), me.getValue());
                }
                getRequest().setAttribute(Constants.FIELDS, fields);

                getRequest().setAttribute("demographicAssignments",getAssignments(u));

                setNextPage("/secondary.jsp");
                setIsNextPageInContext(true);
            } else {
                //set the fields in the user object
                loadFieldsIntoUserObject(fields, params);
                Set allFields = new HashSet(RegFieldHelper.getMainFieldSet(getRequestedTypes(), u));
                allFields.addAll(RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u));
                getRequest().setAttribute(Constants.FIELDS, allFields);
                setNextPage("/confirm.jsp");
                setIsNextPageInContext(true);
            }
        }
    }


    private void loadFieldsIntoUserObject(Set fields, Map params) {
        User u = getRegUser();

        if (fields.contains(Constants.DEMOG_PREFIX)) {
            //make set of responses
            //set the responses on the user object
            DemographicAssignment da;
            Long answerId;
            List answers;
            Set responses = new HashSet();
            DemographicResponse dr;
            for (Iterator it = getAssignments(u).iterator(); it.hasNext();) {
                da = (DemographicAssignment)it.next();
                if (da.getQuestion().isMultipleSelect()) {
                    answers = (List)params.get(Constants.DEMOG_PREFIX+da.getQuestion().getId());
                    for (int i=0; i<answers.size(); i++) {
                        dr = new DemographicResponse();
                        dr.setQuestion(da.getQuestion());
                        dr.setAnswer(da.getQuestion().getAnswer(new Long((String)answers.get(i))));
                        dr.setUser(u);
                        dr.setId(new DemographicResponse.Identifier(u.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                        responses.add(dr);
                    }

                } else if (da.getQuestion().isFreeForm()) {
                    dr = new DemographicResponse();
                    dr.setAnswer(getFactory().getDemographicAnswerDAO().findFreeForm(da.getQuestion()));
                    dr.setQuestion(da.getQuestion());
                    dr.setUser(u);
                    dr.setResponse((String)params.get(Constants.DEMOG_PREFIX+da.getQuestion().getId()));
                    dr.setId(new DemographicResponse.Identifier(u.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                    responses.add(dr);
                } else if (da.getQuestion().isSingleSelect()) {
                    answerId = new Long((String)params.get(Constants.DEMOG_PREFIX+da.getQuestion().getId()));
                    dr = new DemographicResponse();
                    dr.setQuestion(da.getQuestion());
                    dr.setAnswer(da.getQuestion().getAnswer(answerId));
                    dr.setUser(u);
                    dr.setId(new DemographicResponse.Identifier(u.getId(), dr.getQuestion().getId(), dr.getAnswer().getId()));
                    responses.add(dr);
                }
            }
            u.setDemographicResponses(responses);

        }
    }

}
