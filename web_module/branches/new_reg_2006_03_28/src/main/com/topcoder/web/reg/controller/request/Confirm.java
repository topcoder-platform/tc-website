package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.model.*;

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
        if (fields.contains(Constants.SCHOOL_ID)) {
            //we'll assume that the coder object exists since we're setting a school
            CurrentSchool cs = u.getCoder().getCurrentSchool();
            if (cs == null) {
                cs = new CurrentSchool();
                cs.setCoder(u.getCoder());
                u.getCoder().setCurrentSchool(cs);
            }
            if (params.containsKey(Constants.SCHOOL_ID)) {
                //find existing
                cs.setSchool(getFactory().getSchoolDAO().find(new Long((String)params.get(Constants.SCHOOL_ID))));
            } else {
                School s = new School();
                s.setCoder(u.getCoder());
                u.getCoder().addCreatedSchool(s);
                s.setName((String)params.get(Constants.SCHOOL_NAME));
                s.setType(getFactory().getSchoolTypeDAO().find(new Integer((String)params.get(Constants.SCHOOL_TYPE))));
                Address a = new Address();
                a.setCity((String)params.get(Constants.SCHOOL_CITY));
                a.setProvince((String)params.get(Constants.SCHOOL_PROVINCE));
                if (params.containsKey(Constants.STATE_CODE)) {
                    a.setState(getFactory().getStateDAO().find((String)params.get(Constants.STATE_CODE)));
                }
                if (params.containsKey(Constants.COUNTRY_CODE)) {
                    a.setCountry(getFactory().getCountryDAO().find((String)params.get(Constants.COUNTRY_CODE)));
                }
                s.setAddress(a);
                cs.setSchool(s);
            }
        }
        if (fields.contains(Constants.RESUME)&&params.containsKey(Constants.FILE)) {
            Resume r = null;
            if (u.getCoder().getResumes().isEmpty()) {
                r = new Resume();
                r.setCoder(u.getCoder());
                u.getCoder().addResume(r);
            } else {
                r = (Resume)u.getCoder().getResumes().iterator().next();
            }
            r.setFile((byte[])params.get(Constants.FILE));
            r.setFileName((String)params.get(Constants.FILE_NAME));
            r.setFileType(getFactory().getFileTypeDAO().find((String)params.get(Constants.FILE_TYPE)));
        }
        if (fields.contains(Constants.GPA) &&
                fields.contains(Constants.GPA_SCALE) &&
                params.containsKey(Constants.GPA) &&
                params.containsKey(Constants.GPA_SCALE)) {
            u.getCoder().getCurrentSchool().setGPA(new Float((String)params.get(Constants.GPA)));
            u.getCoder().getCurrentSchool().setGPAScale(new Float((String)params.get(Constants.GPA_SCALE)));
        }
        setRegUser(u);
    }

}
