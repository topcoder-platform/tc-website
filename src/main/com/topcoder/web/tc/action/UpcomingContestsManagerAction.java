/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.json.object.JSONObject;
import com.topcoder.web.tc.ServicesHelper;
import com.topcoder.web.tc.ContestServicesConfigurationException;
import com.topcoder.web.tc.ContestsServiceManagerException;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.UpcomingContestsManager;
import com.topcoder.web.tc.dto.UpcomingContestDTO;
import com.topcoder.web.tc.dto.UpcomingContestsFilter;

/**
 * <p>
 * This action simply wraps around UpcomingContestsManager and provides its
 * service to the front end.
 * </p>
 * <p>
 * This action will receive a request parameter under the name
 * &quot;parameter&quot; and treat is as a JSON string. The JSON string may
 * contain following fields:
 * <ul>
 * <li>filter - the criteria used to filter searching result. Please refer to
 * UpcomingContestsFilter and following explanation.</li>
 * <li>columnName - the sorting column name.</li>
 * <li>sortingOrder - the sorting order. Please refer to SortingOrder for valid
 * values.</li>
 * <li>pageNumber - the number of page to retrieve.</li>
 * <li>pageSize - the size of each page.</li>
 * </ul>
 * </p>
 * <p>
 * Below is an explanation on the fields used for filtering searching result.
 * All the values are optional.
 * <ul>
 * <li>contestName - the name pattern of the contests. It will use LIKE to match
 * the contest name.</li>
 * <li>catalog - the list of catalogs of the contests to retrieve.</li>
 * <li>type - the list of types of the contests to retrieve.</li>
 * <li>subtype - the list of sub-types of the contests to retrieve.</li>
 * <li>registrationStart - the start date of registration phase of the contests
 * to retrieve.</li>
 * <li>submissionEnd - the end date of submission phase of the contests to
 * retrieve.</li>
 * <li>contestFinalization - the finish time of the contests to retrieve.</li>
 * <li>winnerHandle - the winner handle of the contests to retrieve. It will use
 * LIKE to match the winner handle.</li>
 * </ul>
 * </p>
 * <p>
 * registrationStart, submissionEnd, and contestFinalization contains the below
 * fields:
 * <ul>
 * <li>intervalType - valid values are BEFORE, AFTER, ON, BETWEEN_DATES,
 * BEFORE_CURRENT_DATE, AFTER_CURRENT_DATE, the meaning of all values are quite
 * obvious from their names.</li>
 * <li>firstDate - the date used for BEFORE, AFTER, ON, and the first date used
 * for BETWEEN_DATES.</li>
 * <li>secondDate - the second date used for BETWEEN_DATES.</li>
 * </ul>
 * </p>
 * <p>
 * This action is required to be configured with an instance of
 * UpcomingContestsManager. Below is an example of configuration using Spring.
 * 
 * <pre>
 * <bean id="upcomingContestsManagerAction" class="com.topcoder.web.tc.action.UpcomingContestsManagerAction"
 *     scope="prototype" init-method="checkConfiguration">
 *     <property name="upcomingContestsManager" ref="upcomingContestsManager" />
 * </bean>
 * <bean id="upcomingContestsManager" class="com.topcoder.web.tc.implement.UpcomingContestsManagerImpl">
 *     <property name="sessionFactory" ref="sessionFactory" />
 *     <property name="loggerName" value="UpcomingContestsManagerImpl" />
 * </bean>
 * </pre>
 * 
 * </p>
 * <p>
 * This class is not thread-safe because it's mutable. However, dedicated
 * instance of Struts action will be created by the Struts framework to process
 * the user request, so the Struts actions don't need to be thread-safe.
 * </p>
 * 
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public class UpcomingContestsManagerAction extends BaseJSONParameterAction {

    /**
     * Represents the serial version id of this class.
     */
    private static final long serialVersionUID = -3984483271827996144L;

    /**
     * Represents the name of the class.
     */
    private static final String CLASS_NAME = UpcomingContestsManagerAction.class
            .getName();

    /**
     * Represents the logger used to log information.
     */
    private static final Logger LOGGER = Logger
            .getLogger(UpcomingContestsManagerAction.class);

    /**
     * Represents the UpcomingContestsManager for search review opportunities.
     * It is set through setter and doesn't have a getter. It cannot be null.
     * Its value legality is checked in checkConfiguration() method. It does not
     * need to be initialized when the instance is created.
     */
    private UpcomingContestsManager upcomingContestsManager;

    /**
     * Represents the retrieved upcoming contests. It is accessed through getter
     * and doesn't have a setter. It cannot be null but can be empty. The
     * contained values can't be null. It does not need to be initialized when
     * the instance is created.
     */
    private List<UpcomingContestDTO> upcomingContests;

    /**
     * The list of JSON errors.
     */
    private List<String> jsonErrors;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public UpcomingContestsManagerAction() {
    }

    /**
     * <p>
     * Searches upcoming contests.
     * </p>
     * 
     * @return always SUCCESS.
     * @throws ContestServicesActionException
     *             if any error occurs while performing the search.
     */
    @Override
    public String execute() throws ContestServicesActionException {
        String methodName = CLASS_NAME + ".execute()";
        Log4jUtility.logEntrance(LOGGER, methodName, null, null);

        try {
            JSONObject jsonObject = getParameterAsJSONObject();
            Map<String, Object> params = ServicesHelper
                    .getParamFromJson(jsonObject);

            UpcomingContestsFilter filter = new UpcomingContestsFilter();
            jsonErrors = ServicesHelper.setFilterFields(jsonObject, filter,
                    getDateFormatString());

            upcomingContests = upcomingContestsManager
                    .retrieveUpcomingContests(
                            (String) params.get("columnName"),
                            (SortingOrder) params.get("sortingOrder"),
                            (Integer) params.get("pageNumber"),
                            (Integer) params.get("pageSize"), filter);
        } catch (IllegalArgumentException e) {
            throw ServicesHelper.logException(LOGGER, methodName,
                    new ContestServicesActionException(
                            "Some fields in the parameter are invalid.", e));
        } catch (ContestServicesActionException e) {
            throw ServicesHelper.logException(LOGGER, methodName, e);
        } catch (ContestsServiceManagerException e) {
            throw ServicesHelper.logException(LOGGER, methodName,
                    new ContestServicesActionException(
                            "Error occurs while searching upcoming contests.",
                            e));
        }

        Log4jUtility.logExit(LOGGER, methodName, new Object[] { SUCCESS });
        return SUCCESS;
    }

    /**
     * <p>
     * Gets the value of upcoming contests attribute.
     * </p>
     * 
     * @return the upcoming contests attribute.
     */
    public List<UpcomingContestDTO> getUpcomingContests() {
        return upcomingContests;
    }

    /**
     * <p>
     * Sets the value of upcoming contests manager attribute.
     * </p>
     * 
     * @param upcomingContestsManager
     *            the upcoming contests manager attribute to set.
     */
    public void setUpcomingContestsManager(
            UpcomingContestsManager upcomingContestsManager) {
        this.upcomingContestsManager = upcomingContestsManager;
    }

    /**
     * <p>
     * Checks whether this object is configured correctly. It will ensure
     * upcoming contests manager is valid.
     * </p>
     * 
     * @throws ContestServicesConfigurationException
     *             if upcoming contests manager is null.
     */
    @Override
    public void checkConfiguration()
            throws ContestServicesConfigurationException {
        super.checkConfiguration();
        ServicesHelper.checkConfigObject(upcomingContestsManager,
                "upcomingContestsManager");
    }

    /**
     * Gets the list of JSON errors.
     * 
     * @return the jsonErrors
     */
    public List<String> getJsonErrors() {
        return jsonErrors;
    }
}
