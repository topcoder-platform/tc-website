package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

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
            throw new NavigationException("Sorry, your session has expired.");
        } else if (u.isNew() || userLoggedIn()) {

            Map params = getSecondaryUserInput();

            checkSecondaryFields(params);

            Set fields = RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u);
            log.debug(fields.size() + " fields found");

            if (hasErrors()) {
                Map.Entry me;
                for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
                    me = (Map.Entry) it.next();
                    setDefault((String) me.getKey(), me.getValue());
                }
                getRequest().setAttribute(Constants.FIELDS, fields);
                Set required = RegFieldHelper.getSecondaryRequiredFieldSet(getRequestedTypes(), u);
                log.debug("we have the required fields " + required);
                getRequest().setAttribute(Constants.REQUIRED_FIELDS, required);
                getRequest().setAttribute("demographicAssignments", getAssignments(u));
                getRequest().setAttribute("referrals", getReferrals(u));
                setNextPage("/secondary.jsp");
                setIsNextPageInContext(true);
            } else {
                //set the fields in the user object
                loadFieldsIntoUserObject(fields, params);
                Set allFields = new HashSet(RegFieldHelper.getMainFieldSet(getRequestedTypes(), u));
                allFields.addAll(RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u));
                getRequest().setAttribute(Constants.FIELDS, allFields);
                HashSet h = new HashSet();
                for (Iterator it = getRequestedTypes().iterator(); it.hasNext();) {
                    h.add(((RegistrationType) it.next()).getId());
                }
                getRequest().setAttribute(Constants.REG_TYPES, h);
                setNextPage("/confirm.jsp");
                setIsNextPageInContext(true);
            }
        }
    }


    private void loadFieldsIntoUserObject(Set fields, Map params) throws TCWebException {
        User u = getRegUser();

        if (fields.contains(Constants.DEMOG_PREFIX)) {
            //make set of responses
            //set the responses on the user object
            DemographicAssignment da;
            Long answerId;
            List answers;
            DemographicResponse tr;
            ArrayList responses = new ArrayList();
            for (Iterator it = getAssignments(u).iterator(); it.hasNext();) {
                da = (DemographicAssignment) it.next();
                if (da.getQuestion().isMultipleSelect()) {
                    answers = (List) params.get(Constants.DEMOG_PREFIX + da.getQuestion().getId());
                    //todo if they answer the multiple choice with a real answer, remove the decline to answer
                    if (answers != null) {
                        for (int i = 0; i < answers.size(); i++) {
                            tr = new DemographicResponse();
                            tr.setQuestion(da.getQuestion());
                            tr.setAnswer(da.getQuestion().getAnswer(new Long((String) answers.get(i))));
                            tr.setUser(u);
                            responses.add(tr);
                        }
                    }
                } else if (da.getQuestion().isFreeForm()) {
                    String response = (String) params.get(Constants.DEMOG_PREFIX + da.getQuestion().getId());
                    if (!"".equals(StringUtils.checkNull(response))) {
                        tr = new DemographicResponse();
                        tr.setAnswer(getFactory().getDemographicAnswerDAO().findFreeForm(da.getQuestion()));
                        tr.setQuestion(da.getQuestion());
                        tr.setResponse((String) params.get(Constants.DEMOG_PREFIX + da.getQuestion().getId()));
                        tr.setUser(u);
                        responses.add(tr);
                    }
                } else if (da.getQuestion().isSingleSelect()) {
                    String response = (String) params.get(Constants.DEMOG_PREFIX + da.getQuestion().getId());
                    if (!"".equals(StringUtils.checkNull(response))) {
                        answerId = new Long(response);
                        tr = new DemographicResponse();
                        tr.setQuestion(da.getQuestion());
                        tr.setAnswer(da.getQuestion().getAnswer(answerId));
                        tr.setUser(u);
                        responses.add(tr);
                    }
                }
            }
            u.setTransientResponses(responses);

        }
        if (fields.contains(Constants.SCHOOL_ID)) {
            //we'll assume that the coder object exists since we're setting a school
            CurrentSchool cs = u.getCoder().getCurrentSchool();
            if (cs == null) {
                cs = new CurrentSchool();
                cs.setCoder(u.getCoder());
                u.getCoder().setCurrentSchool(cs);
            }
            if (hasParameter(params, Constants.SCHOOL_ID)) {
                //find existing
                cs.setSchool(getFactory().getSchoolDAO().find(new Long((String) params.get(Constants.SCHOOL_ID))));
            } else {
                School s = new School();
                s.setViewable(Boolean.valueOf(!Constants.HOME_SCHOOLED.equalsIgnoreCase((String) params.get(Constants.SCHOOL_NAME))));
                s.setCoder(u.getCoder());
                u.getCoder().addCreatedSchool(s);
                s.setName((String) params.get(Constants.SCHOOL_NAME));
                s.setType(getFactory().getSchoolTypeDAO().find(new Integer((String) params.get(Constants.SCHOOL_TYPE))));
                Address a = new Address();
                a.setCity((String) params.get(Constants.SCHOOL_CITY));
                if (hasParameter(params, Constants.SCHOOL_COUNTRY)) {
                    a.setCountry(getFactory().getCountryDAO().find((String) params.get(Constants.SCHOOL_COUNTRY)));
                    //make hs people's comp country be the country of their school
                    if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                        u.getCoder().setCompCountry(a.getCountry());
                    }
                }
                if (getFactory().getCountryDAO().getUS().equals(a.getCountry())) {
                    if (hasParameter(params, Constants.SCHOOL_STATE)) {
                        a.setState(getFactory().getStateDAO().find((String) params.get(Constants.SCHOOL_STATE)));
                    }
                } else {
                    a.setProvince((String) params.get(Constants.SCHOOL_PROVINCE));
                }
                s.setAddress(a);
                cs.setSchool(s);
            }

            if (getFactory().getSchoolTypeDAO().find(SchoolType.HIGH_SCHOOL).equals(u.getCoder().getCurrentSchool().getSchool().getType()))
            {
                //high school people have to show their school
                u.getCoder().getCurrentSchool().setViewable(Boolean.TRUE);
            } else {
                u.getCoder().getCurrentSchool().setViewable(Boolean.valueOf("on".equals(params.get(Constants.VISIBLE_SCHOOL))));
            }

            if (u.getCoder().getCurrentSchool() != null && getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType()))
            {

                List teams = getFactory().getTeamDAO().getHighSchoolTeamsForSchool(u.getCoder().getCurrentSchool().getSchool());
                Team t;
                if (teams.isEmpty()) {
                    t = new Team();
                    School s = u.getCoder().getCurrentSchool().getSchool();
                    t.setName(s.getName());
                    t.setSchool(s);
                    t.setType(getFactory().getTeamTypeDAO().find(TeamType.HIGH_SCHOOL_TYPE));
                } else {
                    t = (Team) teams.iterator().next();
                }

                Team userTeam = u.getCoder().getHighSchoolTeam();
                if (userTeam == null) {
                    u.getCoder().addTeam(t);
                } else {
                    if (!(userTeam.getSchool().getId() != null && userTeam.getSchool().equals(t.getSchool()))) {
                        u.getCoder().removeTeam(userTeam);
                        u.getCoder().addTeam(t);
                    }
                }
            }
        }
        if (fields.contains(Constants.RESUME) && hasParameter(params, Constants.FILE)) {
            Resume r = null;
            if (u.getCoder().getResumes().isEmpty()) {
                r = new Resume();
                r.setCoder(u.getCoder());
                u.getCoder().addResume(r);
            } else {
                r = (Resume) u.getCoder().getResumes().iterator().next();
            }
            r.setFile((byte[]) params.get(Constants.FILE));
            r.setFileName((String) params.get(Constants.FILE_NAME));
            r.setFileType(getFactory().getFileTypeDAO().find((String) params.get(Constants.FILE_TYPE)));
        }
        if (fields.contains(Constants.GPA) &&
                fields.contains(Constants.GPA_SCALE) &&
                hasParameter(params, Constants.GPA) &&
                hasParameter(params, Constants.GPA_SCALE)) {
            u.getCoder().getCurrentSchool().setGPA(new Float((String) params.get(Constants.GPA)));
            u.getCoder().getCurrentSchool().setGPAScale(new Float((String) params.get(Constants.GPA_SCALE)));
        }

        if (fields.contains(Constants.REFERRAL)) {
            CoderReferral cr = new CoderReferral();
            cr.setCoder(u.getCoder());
            cr.setReferral(getFactory().getReferralDAO().find(new Integer((String) params.get(Constants.REFERRAL))));
            if (fields.contains(Constants.REFERRAL_CODER) && hasParameter(params, Constants.REFERRAL_CODER)) {
                cr.setReferenceCoder(getFactory().getUserDAO().find((String) params.get(Constants.REFERRAL_CODER), true, true).getCoder());
            }
            if (fields.contains(Constants.REFERRAL_OTHER) && hasParameter(params, Constants.REFERRAL_OTHER)) {
                cr.setOther((String) params.get(Constants.REFERRAL_OTHER));
            }
            u.getCoder().setCoderReferral(cr);
        }

        if ((fields.contains(Constants.COMPANY_NAME) || fields.contains(Constants.TITLE)) && u.getContact() == null) {
            Contact c = new Contact();
            u.setContact(c);
            c.setUser(u);
        }
        if (fields.contains(Constants.COMPANY_NAME)) {
            String name = (String) params.get(Constants.COMPANY_NAME);
            if (u.getContact().isNew()) {
                Company c = new Company();
                c.setName(name);
                c.setPrimaryContact(u.getContact());
                u.getContact().setCompany(c);
            } else {
                if (u.getContact().getCompany() == null) {
                    throw new TCWebException("Invalid state, user " + u.getId() + " missing company");
                } else {
                    //if they're changing their company, create a new company record
                    if (!u.getContact().getCompany().getName().equals(name)) {
                        Company c = new Company();
                        c.setName(name);
                        c.setPrimaryContact(u.getContact());
                        u.getContact().setCompany(c);
                    }
                }
            }
        }

        if (fields.contains(Constants.TITLE)) {
            u.getContact().setTitle((String) params.get(Constants.TITLE));
        }


        setRegUser(u);
    }

}