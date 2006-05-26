package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.reg.model.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Main extends Base {

    protected void registrationProcessing() throws Exception {
        if (getRegUser()==null||getRegUser().isNew() || userLoggedIn()) {
            RegistrationTypeDAO regTypeDAO = getFactory().getRegistrationTypeDAO();
            List types = regTypeDAO.getRegistrationTypes();

            RegistrationType rt;
            HashSet requestedTypes = new HashSet();
            for (Iterator it = types.iterator(); it.hasNext();) {
                rt = (RegistrationType)it.next();
                if ("on".equals(getRequest().getParameter(Constants.REGISTRATION_TYPE + rt.getId()))) {
                    //log.debug("adding type: " + rt.getName());
                    requestedTypes.add(rt);
                }
            }


            User u = getRegUser();

            requestedTypes.addAll(u.getRegistrationTypes());
            setRequestedTypes(requestedTypes);

                if (u.getContact()==null&&(requestedTypes.contains(regTypeDAO.getCorporateType()) || requestedTypes.contains(regTypeDAO.getSoftwareType()))) {
                    Contact c = new Contact();
                    u.setContact(c);
                    c.setUser(u);
                }
                if (u.getCoder()==null && requestedTypes.contains(regTypeDAO.getCompetitionType())) {
                    Coder c= new Coder();
                    u.setCoder(c);
                    c.setUser(u);
                }
            if (requestedTypes.contains(regTypeDAO.getHighSchoolType())) {
                Coder c;
                if (u.getCoder()==null) {
                    c = new Coder();
                    c.setUser(u);
                    u.setCoder(c);
                } else {
                    c = u.getCoder();
                }
                c.setCoderType(getFactory().getCoderTypeDAO().find(CoderType.STUDENT));
            }

            setRegUser(u);

            if (requestedTypes.isEmpty()) {
                addError(Constants.REGISTRATION_TYPE, "You have not selected to register for any aspect of TopCoder.");
            }
            if (!u.getAgreedToSiteTerms()) {
                if (!"on".equals(getTrimmedParameter(Constants.TERMS_OF_USE_ID))) {
                    addError(Constants.TERMS_OF_USE_ID, "In order to continue, you must agree to the terms of use.");
                }
            }

            if (hasErrors()) {

                getRequest().setAttribute("registrationTypeList", getFactory().getRegistrationTypeDAO().getRegistrationTypes());
                if (userLoggedIn()) {
                    //they're updating their info, and they're logged in, so here we go
                    RegistrationType regType;
                    for (Iterator it = new UserDAOHibernate().find(new Long(getUser().getId())).getRegistrationTypes().iterator(); it.hasNext();) {
                        regType = (RegistrationType) it.next();
                        setDefault(Constants.REGISTRATION_TYPE + regType.getId(), String.valueOf(true));
                    }
                }

                setNextPage("/selection.jsp");
                setIsNextPageInContext(true);
            } else {
                //todo if they are attempting to register for high school, and they are not eligible,
                  //todo give them a message saying they are not eligible to register for highschool
                setMainDefaults(u);

                u.addTerms(getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID)));
                log.debug("has site terms: " + u.getAgreedToSiteTerms());
                setRegUser(u);

                List nots = getFactory().getNotificationDAO().getNotifications(requestedTypes);
                if (nots!=null) {
                    getRequest().setAttribute("notifications", nots);
                }
                getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
                getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
                getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
                getRequest().setAttribute(Constants.FIELDS,
                        RegFieldHelper.getMainFieldSet(requestedTypes, getRegUser()));
                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
