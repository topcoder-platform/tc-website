package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
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
        if (getRegUser() == null || getRegUser().isNew() || userLoggedIn()) {
            RegistrationTypeDAO regTypeDAO = getFactory().getRegistrationTypeDAO();
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

            User u = getRegUser();

            requestedTypes.addAll(u.getRegistrationTypes());
            setRequestedTypes(requestedTypes);

            if (requestedTypes.isEmpty()) {
                addError(Constants.REGISTRATION_TYPE, "You have not selected to register for any aspect of TopCoder.");
            }
            //todo if they are attempting to register for high school, and they are not eligible,
            //todo give them a message saying they are not eligible to register for highschool
            //todo those that are ineligable: big age demographic question,
            //people whose current school is a college (questionable),
            if (!u.isNew() && requestedTypes.contains(regTypeDAO.getHighSchoolType())) {
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
                        (requestedTypes.contains(regTypeDAO.getCorporateType()) || requestedTypes.contains(regTypeDAO.getSoftwareType())))
                {
                    Contact c = new Contact();
                    u.setContact(c);
                    c.setUser(u);
                }
                    Coder c = new Coder();
                    u.setCoder(c);
                    c.setUser(u);
                }
                if (requestedTypes.contains(regTypeDAO.getHighSchoolType())) {
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

                List nots = getFactory().getNotificationDAO().getNotifications(requestedTypes);
                if (nots != null) {
                    getRequest().setAttribute("notifications", nots);
                }

                getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
                getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
                getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
                getRequest().setAttribute(Constants.FIELDS,
                        RegFieldHelper.getMainFieldSet(requestedTypes, getRegUser()));
                Set reqFields = RegFieldHelper.getMainRequiredFieldSet(requestedTypes, getRegUser());
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