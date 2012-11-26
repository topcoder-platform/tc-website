/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.GovernmentID;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>A controller to be used for servicing requests for viewing the form for adding/updating government issued ID 
 * document for desired user.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class EditGovernmentID extends ShortHibernateProcessor {

    /**
     * <p>Constructs new <code>EditGovernmentID</code> instance. This implementation does nothing.</p>
     */
    public EditGovernmentID() {
    }

    /**
     * <p>Processes the incoming request.</p>
     * 
     * @throws TCWebException if an unexpected error occurs.
     */
    protected void dbProcessing() throws TCWebException {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        try {
            User user = (User) createEJB(getInitialContext(), User.class);

            getRequest().setAttribute(Constants.HANDLE,
                                      user.getHandle(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.GIVEN_NAME,
                                      user.getFirstName(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            getRequest().setAttribute(Constants.SURNAME,
                                      user.getLastName(Long.parseLong(userId), DBMS.OLTP_DATASOURCE_NAME));
            setDefault(Constants.USER_ID, userId);
            
            // Get government ID document for user if exists
            DAOFactory daoFactory = DAOUtil.getFactory();
            GovernmentID governmentID = daoFactory.getGovernmentIdDAO().findByUserId(Long.parseLong(userId));
            boolean governmentIdExists = governmentID != null;

            // Get the list of available countries
            List<Country> countries = (List<Country>) daoFactory.getCountryDAO().getCountries();
            List countryOptions = new ArrayList();
            for (Country country : countries) {
                countryOptions.add(new ListSelectTag.Option(country.getCode(), country.getName()));
            }
            getRequest().setAttribute(Constants.COUNTRIES, countryOptions);

            if (governmentIdExists) {
                if (!hasErrors()) {
                    setDefault(Constants.GOVERNMENT_ID, governmentID.getId());
                    setDefault(Constants.COUNTRY_CODE, governmentID.getCountry());
                    setDefault(Constants.GOVERNMENT_ID_NUMBER, governmentID.getDocumentNumber());
                    if (governmentID.getExpires() != null) {
                        setDefault(Constants.GOVERNMENT_ID_EXPIRES, df.format(governmentID.getExpires()));
                    }
                    if (governmentID.getReceived() != null) {
                        setDefault(Constants.GOVERNMENT_ID_RECEIVED, df.format(governmentID.getReceived()));
                    }
                }
            }
            setDefault(Constants.USER_ID, userId);

            // Forward to JSP
            setNextPage(Constants.GOVERNMENT_ID_EDIT);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
