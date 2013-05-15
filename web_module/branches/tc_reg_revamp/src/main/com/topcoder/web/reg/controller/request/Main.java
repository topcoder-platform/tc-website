package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.PaymentDAO;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.model.Contact;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.model.educ.ProfessorStatus;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 79505 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Main extends Base {

    protected void registrationProcessing() throws Exception {

        if (isNewRegistration() || userLoggedIn()) {
            User u = getRegUser();
            //if someone is registering for just one thing, they might include that type in the request.
            String regTypeParam = StringUtils.checkNull(getRequest().getParameter(Constants.REGISTRATION_TYPE));
            if (!"".equals(regTypeParam) && u == null) {
                //this is a new registration, they're just starting here, so create an empty user for them.
                u = new User();
                setRegUser(u);
                if (log.isDebugEnabled()) {
                    log.debug("got a reg type of " + regTypeParam);
                }
            }

            RegistrationTypeDAO regTypeDAO = getFactory().getRegistrationTypeDAO();
            //if it's a post, they're coming from the selection page, and they should have selected
            //some types, so add them.
            if ("POST".equals(getRequest().getMethod())) {
                List<RegistrationType> types = regTypeDAO.getRegistrationTypes();

                HashSet<RegistrationType> requestedTypes = new HashSet<RegistrationType>();
                for (RegistrationType rt : types) {
                    if ("on".equals(getRequest().getParameter(Constants.REGISTRATION_TYPE + rt.getId()))) {
                        //log.debug("adding type: " + rt.getName());
                        requestedTypes.add(rt);
                    }
                }
                requestedTypes.addAll(u.getRegistrationTypes());
                setRequestedTypes(requestedTypes);
            } else {
                //if it's not a post, they must be coming in directly, so lets see if they have made
                //a request to register.  it could be that they are just editing some information in the
                //session (click edit on the confirm page, but they could also be registering for the first time,
                //and hitting this page directly, or hitting this page directly in an attempt to add a registration
                if (!"".equals(regTypeParam)) {
                    if (!StringUtils.isNumber(regTypeParam)) {
                        throw new NavigationException("Invalid registration type specified.");
                    } else {
                        List<RegistrationType> types = regTypeDAO.getRegistrationTypes();
                        HashSet<RegistrationType> requestedTypes = new HashSet<RegistrationType>();
                        if (userLoggedIn()) {
                            requestedTypes.addAll(getRegUser().getRegistrationTypes());
                        }
                        for (RegistrationType rt : types) {
                            if (log.isDebugEnabled()) {
                                log.debug("check " + rt.getDescription());
                            }
                            if (rt.getId().equals(new Integer(regTypeParam))) {
                                if (log.isDebugEnabled()) {
                                    log.debug("found, it's " + rt.getDescription());
                                }
                                requestedTypes.add(rt);
                            }
                        }
                        if (requestedTypes.isEmpty()) {
                            throw new NavigationException("Invalid request, no registratoin type specified.");
                        } else {
                            setRequestedTypes(requestedTypes);
                        }
                    }
                }
            }

            if (getRequestedTypes().isEmpty()) {
                addError(Constants.REGISTRATION_TYPE, "You have not selected to register for any aspect of TopCoder.");
            }
            //todo if they are attempting to register for high school, and they are not eligible,
            //todo give them a message saying they are not eligible to register for highschool
            //todo those that are ineligable: big age demographic question,
            //people whose current school is a college (questionable),
            if (!isNewRegistration() && getRequestedTypes().contains(regTypeDAO.getHighSchoolType())) {
                if (getFactory().getSecurityGroupDAO().hasInactiveHSGroup(u)) {
                    addError(Constants.REGISTRATION_TYPE, "Sorry, you are not eligible for High School Competitions");
                } else if (u.getCoder() != null && CoderType.PROFESSIONAL.equals(u.getCoder().getCoderType().getId())) {
                    addError(Constants.REGISTRATION_TYPE, "Sorry, you are not eligible for High School Competitions");
                }


            }

            if (hasErrors()) {

                getRequest().setAttribute("registrationTypeList", getFactory().getRegistrationTypeDAO().getRegistrationTypes());
                if (userLoggedIn()) {
                    //they're updating their info, and they're logged in, so here we go
                    for (RegistrationType regType : new UserDAOHibernate().find(getUser().getId()).getRegistrationTypes()) {
                        setDefault(Constants.REGISTRATION_TYPE + regType.getId(), String.valueOf(true));
                    }
                }

                setNextPage("/selection.jsp");
                setIsNextPageInContext(true);
            } else {
                if (u.getContact() == null &&
                        (getRequestedTypes().contains(regTypeDAO.getCorporateType()) || getRequestedTypes().contains(regTypeDAO.getSoftwareType()))) {
                    Contact c = new Contact();
                    u.setContact(c);
                }
                if (u.getCoder() == null && (getRequestedTypes().contains(regTypeDAO.getCompetitionType()) ||
                        getRequestedTypes().contains(regTypeDAO.getStudioType()) ||
                        getRequestedTypes().contains(regTypeDAO.getOpenAIMType()) ||
                        getRequestedTypes().contains(regTypeDAO.getTruveoType()))) {
                    //we'll make a coder record for creative people..at least for now.  perhaps in the future
                    //we'll have competitor table rather than a coder table
                    Coder c = new Coder();
                    u.setCoder(c);
                }
                if (getRequestedTypes().contains(regTypeDAO.getHighSchoolType())) {
                    Coder c;
                    if (u.getCoder() == null) {
                        c = new Coder();
                        u.setCoder(c);
                    } else {
                        c = u.getCoder();
                    }
                    c.setCoderType(getFactory().getCoderTypeDAO().find(CoderType.STUDENT));
                }

                if (u.getProfessor() == null && (getRequestedTypes().contains(regTypeDAO.getTeacherType()))) {
                    Professor p = new Professor();
                    p.setStatus(getFactory().getProfessorStatusDA0().find(ProfessorStatus.PENDING));
                    u.setProfessor(p);
                }


                setRegUser(u);

                setMainDefaults(u);

                getRequest().setAttribute("hasPayments", getFactory().getPaymentDAO().hasPayments(u.getId()));
                getRequest().setAttribute("isNameInAnotherLanguageEmpty", u.getNameInAnotherLanguage() == null || u.getNameInAnotherLanguage().trim().length() == 0);

                List nots = getFactory().getNotificationDAO().getNotifications(getRequestedTypes());
                if (nots != null) {
                    getRequest().setAttribute("notifications", nots);
                }

                Season season = getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON);
                if (season != null && season.getEvent() != null && season.getEvent().getSurvey() != null) {
                    getRequest().setAttribute("questions", new ArrayList(season.getEvent().getSurvey().getQuestions()));
                }

                getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
                getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
                getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
                getRequest().setAttribute(Constants.FIELDS,
                        RegFieldHelper.getMainFieldSet(getRequestedTypes(), getRegUser()));
                Set reqFields = RegFieldHelper.getMainRequiredFieldSet(getRequestedTypes(), getRegUser());
                getRequest().setAttribute(Constants.REQUIRED_FIELDS, reqFields);
                getRequest().setAttribute("regTerms", getFactory().getTermsOfUse().find(Constants.REG_TERMS_ID));
                getRequest().setAttribute("season", season);
                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }

}