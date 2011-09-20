package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2006
 */
public class Confirm extends Base {
    private static final Logger log = Logger.getLogger(Confirm.class);

    protected void registrationProcessing() throws Exception {

        User u = getRegUser();
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has expired.", "http://www.topcoder.com/reg");
        } else if (isNewRegistration() || userLoggedIn()) {

            Map params = getSecondaryUserInput();

            checkSecondaryFields(params);

            Set fields = RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), u);
            log.debug(fields.size() + " fields found");

            if (hasErrors()) {
                Map.Entry me;
                for (Object o : params.entrySet()) {
                    me = (Map.Entry) o;
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
                        for (Object answer : answers) {
                            tr = new DemographicResponse();
                            tr.setQuestion(da.getQuestion());
                            tr.setAnswer(da.getQuestion().getAnswer(new Long((String) answer)));
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

            CurrentSchool cs = null;
            if (u.getCoder() != null) {
                cs = u.getCoder().getCurrentSchool();
            }
            if (cs == null && u.getCoder() != null) {
                //must be a student
                cs = new CurrentSchool();
                u.getCoder().setCurrentSchool(cs);
            }

            School s;
            Long schoolId = null;
            if (hasParameter(params, Constants.SCHOOL_ID)) {
                schoolId = new Long((String) params.get(Constants.SCHOOL_ID));
                if (log.isDebugEnabled()) {
                    log.debug("got school " + schoolId);
                }
                //find school that exists in our system
                s = getFactory().getSchoolDAO().find(schoolId);
            } else {
                //create a new school
                s = new School();
                s.setViewable(!Constants.HOME_SCHOOLED.equalsIgnoreCase((String) params.get(Constants.SCHOOL_NAME)));
                u.addCreatedSchool(s);
                s.setName((String) params.get(Constants.SCHOOL_NAME));
                s.setType(getFactory().getSchoolTypeDAO().find(new Integer((String) params.get(Constants.SCHOOL_TYPE))));
                Address a = new Address();
                a.setCity((String) params.get(Constants.SCHOOL_CITY));
                a.setCountry(getFactory().getCountryDAO().find((String) params.get(Constants.SCHOOL_COUNTRY)));
                if (getFactory().getCountryDAO().getUS().equals(a.getCountry())) {
                    if (hasParameter(params, Constants.SCHOOL_STATE)) {
                        a.setState(getFactory().getStateDAO().find((String) params.get(Constants.SCHOOL_STATE)));
                    }
                } else {
                    a.setProvince((String) params.get(Constants.SCHOOL_PROVINCE));
                }
                s.setAddress(a);
            }
            if (log.isDebugEnabled()) {
                if (s == null) {
                    log.debug("school is null");
                } else {
                    log.debug("school is " + s.getId() + " " + s.getName());
                }

            }


            if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getTeacherType())) {
                log.debug("teacher, setting them up");
                UserSchool teacherSchool = null;
                if (hasParameter(params, Constants.SCHOOL_ID)) {
                    teacherSchool = u.getSchool(schoolId, SchoolAssociationType.TEACHER);
                }
                if (teacherSchool == null) {
                    if (log.isDebugEnabled()) {
                        log.debug("teacher school was null, create new one");
                    }
                    teacherSchool = new UserSchool();
                    //setting primary now so that we only end up with one school set as primary.
                    //the add method takes care of that logic.
                    teacherSchool.setPrimary(true);
                    teacherSchool.setAssociationType(getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.TEACHER));
                    teacherSchool.setSchool(s);
                    u.addSchool(teacherSchool);
                }
            }


            if (u.getCoder() != null && CoderType.STUDENT.equals(u.getCoder().getCoderType().getId())) {
                UserSchool studentSchool = null;

                if (hasParameter(params, Constants.SCHOOL_ID)) {
                    studentSchool = u.getSchool(schoolId, SchoolAssociationType.STUDENT);
                }

                if (studentSchool == null) {
                    studentSchool = new UserSchool();
                    //setting primary now so that we only end up with one school set as primary.
                    //the add method takes care of that logic.
                    studentSchool.setPrimary(true);
                    studentSchool.setAssociationType(getFactory().getSchoolAssociationTypeDAO().find(SchoolAssociationType.STUDENT));
                    studentSchool.setSchool(s);
                    u.addSchool(studentSchool);
                }
            }

            if (log.isDebugEnabled()) {
                for (UserSchool ch : u.getSchools()) {
                    log.debug(ch.getId() + " " + ch.getAssociationType().getDescription() + " " + ch.isPrimary() + " " + ch.getSchool().getName());
                }

            }

            if (!RegFieldHelper.getMainFieldSet(getRequestedTypes(), u).contains(Constants.COMP_COUNTRY_CODE)) {
                //make hs people's comp country be the country of their school
                if (getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    if (log.isDebugEnabled()) {
                        if (u.getCoder() == null) {
                            log.debug("coder is null");
                        }
                        if (s == null) {
                            log.debug("school is null");
                        }
                    }
                    u.getCoder().setCompCountry(s.getAddress().getCountry());
                }
            }

            if (cs != null) {
                cs.setSchool(s);

                if (s.getType() != null && SchoolType.HIGH_SCHOOL.equals(s.getType().getId())) {
                    //high school people have to show their school
                    u.getCoder().getCurrentSchool().setViewable(Boolean.TRUE);
                } else {
                    u.getCoder().getCurrentSchool().setViewable("show".equals(params.get(Constants.VISIBLE_SCHOOL)));
                }

                if (u.getCoder().getCurrentSchool() != null &&
                        getRequestedTypes().contains(getFactory().getRegistrationTypeDAO().getHighSchoolType())) {
                    List teams = getFactory().getTeamDAO().getHighSchoolTeamsForSchool(s);
                    Team t;
                    if (teams.isEmpty()) {
                        t = new Team();
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
        }
        if (fields.contains(Constants.RESUME) && hasParameter(params, Constants.FILE)) {
            Resume r;
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
            if (u.getContact().getCompany() == null || !u.getContact().getCompany().getName().equals(name)) {
                Company c = new Company();
                c.setName(name);
                c.setPrimaryContact(u.getContact());
                u.getContact().setCompany(c);
            }
        }

        if (fields.contains(Constants.TITLE)) {
            u.getContact().setTitle((String) params.get(Constants.TITLE));
        }


        setRegUser(u);
    }

}