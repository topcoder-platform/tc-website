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
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.GovernmentIDDAO;
import com.topcoder.web.common.model.GovernmentID;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>A controller to be used for servicing requests for saving details on government issued ID 
 * document for desired user.</p>
 * 
 * @author isv
 * @version 1.0
 */
public class UpdateGovernmentID extends EditGovernmentID {

    /**
     * <p>Constructs new <code>UpdateGovernmentID</code> instance. This implementation does nothing.</p>
     */
    public UpdateGovernmentID() {
    }

    protected void dbProcessing() throws TCWebException {
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

        // Validate request parameters
        String userIdString = getRequest().getParameter(Constants.USER_ID);
        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        if (StringUtils.checkNull(userIdString).equals("")) {
            throw new NavigationException("Request missing user id");
        }
        String govNumber = getRequest().getParameter(Constants.GOVERNMENT_ID_NUMBER);
        if (govNumber == null || govNumber.trim().length() == 0) {
            addError(Constants.GOVERNMENT_ID, "ID Number is required");
        }
        String countryCode = getRequest().getParameter(Constants.COUNTRY_CODE);
        if (countryCode == null || countryCode.trim().length() == 0) {
            addError(Constants.GOVERNMENT_ID, "Country is required");
        }
        Date govExpiredDate = null;
        String govExpired = getRequest().getParameter(Constants.GOVERNMENT_ID_EXPIRES);
        if (govExpired != null && govExpired.trim().length() > 0) {
            try {
                govExpiredDate = df.parse(govExpired);
            } catch (ParseException e) {
                addError(Constants.GOVERNMENT_ID, "Expiration date must be in MM/DD/YYYY format");
            }
        }
        Date govReceivedDate = null;
        String govReceived = getRequest().getParameter(Constants.GOVERNMENT_ID_RECEIVED);
        if (govReceived != null && govReceived.trim().length() > 0) {
            try {
                govReceivedDate = df.parse(govReceived);
            } catch (ParseException e) {
                addError(Constants.GOVERNMENT_ID, "Received date must be in MM/DD/YYYY format");
            }
        }

        // Get use data 
        long userId = Long.parseLong(userIdString);
        String handle;
        try {
            User user = (User) createEJB(getInitialContext(), User.class);
            handle = user.getHandle(userId, DBMS.OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            throw new NavigationException("Could not get user profile data");
        }


        // Save the government ID if there are no validation errors
        if (!hasErrors()) {

            DAOFactory daoFactory = DAOUtil.getFactory();
            GovernmentIDDAO governmentIdDAO = daoFactory.getGovernmentIdDAO();

            GovernmentID govIdDoc = governmentIdDAO.findByUserId(userId);
            if (govIdDoc == null) {
                govIdDoc = new GovernmentID();
                govIdDoc.setUserId(userId);
            }

            govIdDoc.setCountry(countryCode);
            govIdDoc.setDocumentNumber(govNumber);
            govIdDoc.setExpires(govExpiredDate);
            govIdDoc.setReceived(govReceivedDate);

            governmentIdDAO.saveOrUpdate(govIdDoc);
            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            setNextPage(
                info.getServletPath() + "?" + Constants.MODULE_KEY + "=LegacyReport&t=profile&" + Constants.HANDLE 
                + "=" + handle);
            setIsNextPageInContext(false);
        } else {
            setDefault(Constants.COUNTRY_CODE, countryCode);
            setDefault(Constants.GOVERNMENT_ID_NUMBER, govNumber);
            setDefault(Constants.GOVERNMENT_ID_EXPIRES, govExpired);
            setDefault(Constants.GOVERNMENT_ID_RECEIVED, govReceived);
            super.dbProcessing();
        }

    }

}
