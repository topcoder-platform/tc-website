package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.RegistrationTypeDAO;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.common.model.*;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Main extends Base {

    protected void registrationProcessing() throws Exception {

        if (log.isDebugEnabled()) {
            if (getRegUser() == null) {
                log.debug("user is null");
            } else if (getRegUser().isNew()) {
                log.debug("user is new");
            } else {
                log.debug("handle : " + getRegUser().getHandle());
                log.debug("name: " + getRegUser().getFirstName() + " " + getRegUser().getLastName());
            }
        }
        if (getRegUser() == null) {
            throw new NavigationException("Sorry, your session has expired.");
        } else if (getRegUser().isNew() || userLoggedIn()) {
            User u = getRegUser();
            RegistrationTypeDAO regTypeDAO = getFactory().getRegistrationTypeDAO();
            //if it's a post, they're coming from the selection page, and they should have selected
            //some types, so add them.
            if ("POST".equals(getRequest().getMethod())) {
                List types = regTypeDAO.getRegistrationTypes();

                RegistrationType rt;
                HashSet requestedTypes = new HashSet();
                for (Iterator it = types.iterator(); it.hasNext();) {
                    rt = (RegistrationType) it.next();
                    if ("on".equals(getRequest().getParameter(Constants.REGISTRATION_TYPE + rt.getId()))) {
                        //log.debug("adding type: " + rt.getName());
                        requestedTypes.add(rt);
                    }
                }
                requestedTypes.addAll(u.getRegistrationTypes());
                setRequestedTypes(requestedTypes);
            }

            if (getRequestedTypes().isEmpty()) {
                addError(Constants.REGISTRATION_TYPE, "You have not selected to register for any aspect of TopCoder.");
            }
            //todo if they are attempting to register for high school, and they are not eligible,
            //todo give them a message saying they are not eligible to register for highschool
            //todo those that are ineligable: big age demographic question,
            //people whose current school is a college (questionable),
            if (!u.isNew() && getRequestedTypes().contains(regTypeDAO.getHighSchoolType())) {
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
                    RegistrationType regType;
                    for (Iterator it = new UserDAOHibernate().find(new Long(getUser().getId())).getRegistrationTypes().iterator(); it.hasNext();)
                    {
                        regType = (RegistrationType) it.next();
                        setDefault(Constants.REGISTRATION_TYPE + regType.getId(), String.valueOf(true));
                    }
                }

                setNextPage("/selection.jsp");
                setIsNextPageInContext(true);
            } else {
                if (u.getContact() == null &&
                        (getRequestedTypes().contains(regTypeDAO.getCorporateType()) || getRequestedTypes().contains(regTypeDAO.getSoftwareType())))
                {
                    Contact c = new Contact();
                    u.setContact(c);
                    c.setUser(u);
                }
                if (u.getCoder() == null && (getRequestedTypes().contains(regTypeDAO.getCompetitionType()) ||
                        getRequestedTypes().contains(regTypeDAO.getStudioType()))) {
                    //we'll make a coder record for creative people..at least for now.  perhaps in the future
                    //we'll have competitor table rather than a coder table
                    Coder c = new Coder();
                    u.setCoder(c);
                    c.setUser(u);
                }
                if (getRequestedTypes().contains(regTypeDAO.getHighSchoolType())) {
                    Coder c;
                    if (u.getCoder() == null) {
                        c = new Coder();
                        c.setUser(u);
                        u.setCoder(c);
                    } else {
                        c = u.getCoder();
                    }
                    c.setCoderType(getFactory().getCoderTypeDAO().find(CoderType.STUDENT));
                }

                setRegUser(u);

                setMainDefaults(u);

                setRegUser(u);

                List nots = getFactory().getNotificationDAO().getNotifications(getRequestedTypes());
                if (nots != null) {
                    getRequest().setAttribute("notifications", nots);
                }

                getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
                getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
                getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
                getRequest().setAttribute(Constants.FIELDS,
                        RegFieldHelper.getMainFieldSet(getRequestedTypes(), getRegUser()));
                Set reqFields = RegFieldHelper.getMainRequiredFieldSet(getRequestedTypes(), getRegUser());
                getRequest().setAttribute(Constants.REQUIRED_FIELDS, reqFields);
                getRequest().setAttribute("regTerms", getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID)));
                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }

}