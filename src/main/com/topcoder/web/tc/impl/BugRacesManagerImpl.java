/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;

import com.atlassian.jira.rpc.soap.client.JiraSoapService;
import com.atlassian.jira.rpc.soap.client.JiraSoapServiceServiceLocator;
import com.atlassian.jira.rpc.soap.client.RemoteAuthenticationException;
import com.atlassian.jira.rpc.soap.client.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.client.RemoteException;
import com.atlassian.jira.rpc.soap.client.RemoteIssue;
import com.topcoder.web.tc.BugRacesManager;
import com.topcoder.web.tc.BugRacesManagerException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.dto.BugRaceDTO;

/**
 * <p>
 * This is the default implementation of BugRacesManager. It uses JIRA SOAP API to retrieve the data.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public class BugRacesManagerImpl implements BugRacesManager {

    /**
     * Represent the class name.
     */
    private static final String CLASS_NAME = BugRacesManagerImpl.class.getName();

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be that constant value It is final and won't
     * change once it is initialized as part of variable declaration to: Logger.getLogger(BugRacesManagerImpl.class). It
     * is used throughout the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(BugRacesManagerImpl.class);

    /**
     * <p>
     * Retrieve bug race contests with pagination support.
     * </p>
     * @return matched bug races contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if pageNumber is negative, or pageSize is not zero of negative.
     * @throws BugRacesManagerException
     *             if any error occurs which retrieving bug race contests.
     */
    public List<BugRaceDTO> retrieveBugRaces() throws BugRacesManagerException {
        final String signature = CLASS_NAME + ".retrieveBugRaces()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        // Get configurations
        String jiraServiceUrl = Constants.JIRA_SERVICE_URL;
        String user = Constants.JIRA_USERNAME;
        String password = Constants.JIRA_PASSWORD;
        String jql = Constants.JIRA_JQL;
        String paymentFieldId = Constants.CUSTOM_FIELD_ID_PAYMENT;
        String tcoPointsFieldId = Constants.CUSTOM_FIELD_ID_TCO_POINTS;

        List<BugRaceDTO> bugRaces = new ArrayList<BugRaceDTO>();

        try {
            // the JIRA SOAP Service and authentication token are used to make authentication calls
            JiraSoapService jiraSoapService = new JiraSoapServiceServiceLocator().getJirasoapserviceV2(new URL(
                    jiraServiceUrl));
            String token = jiraSoapService.login(user, password);

            // Get issues
            RemoteIssue[] issues = jiraSoapService.getIssuesFromJqlSearch(token, jql, Integer.MAX_VALUE);

            for (RemoteIssue issue : issues) {
                BugRaceDTO dto = new BugRaceDTO();
                dto.setKey(issue.getKey());
                dto.setSummary(issue.getSummary());
                dto.setRegistrants(issue.getVotes().intValue());
                RemoteCustomFieldValue[] customFields = issue.getCustomFieldValues();
                for (RemoteCustomFieldValue customField : customFields) {
                    if (paymentFieldId.equals(customField.getCustomfieldId())) {
                        dto.setPayment(Double.parseDouble(customField.getValues()[0]));
                    }
                    if (tcoPointsFieldId.equals(customField.getCustomfieldId())) {
                        dto.setTcoPoints(Integer.parseInt(customField.getValues()[0]));
                    }
                }
                dto.setActiveSince(issue.getCreated().getTime());
                bugRaces.add(dto);
            }
        } catch (MalformedURLException e) {
            throw Helper.logException(LOGGER, new BugRacesManagerException(
                    "Error occurs while retrieving bug race contests.", e), signature);
        } catch (ServiceException e) {
            throw Helper.logException(LOGGER, new BugRacesManagerException(
                    "Error occurs while retrieving bug race contests.", e), signature);
        } catch (RemoteAuthenticationException e) {
            throw Helper.logException(LOGGER, new BugRacesManagerException(
                    "Error occurs while retrieving bug race contests.", e), signature);
        } catch (RemoteException e) {
            throw Helper.logException(LOGGER, new BugRacesManagerException(
                    "Error occurs while retrieving bug race contests.", e), signature);
        } catch (java.rmi.RemoteException e) {
            throw Helper.logException(LOGGER, new BugRacesManagerException(
                    "Error occurs while retrieving bug race contests.", e), signature);
        }

        Helper.logExit(LOGGER, signature, startTime, bugRaces);

        return bugRaces;
    }

}
