/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.topcoder.json.object.JSONObject;
import com.topcoder.web.tc.ContestStatusManager;
import com.topcoder.web.tc.ContestStatusManagerException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.ContestStatusDTO;
import com.topcoder.web.tc.dto.ContestStatusFilter;

/**
 * <p>
 * This action simply wraps around ContestStatusManager and provides its service
 * to the front end.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable. However,
 * dedicated instance of struts action will be created by the struts framework
 * to process the user request, so the struts actions don't need to be
 * thread-safe.
 * </p>
 * 
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class ContestStatusManagerAction extends BaseJSONParameterAction {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = ContestStatusManagerAction.class
            .getName();

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(ContestStatusManagerAction.class). It is used throughout
     * the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(ContestStatusManagerAction.class);

    /**
     * <p>
     * The ContestStatusManager for getting contest statuses. It is set through
     * setter and doesn't have a getter. It cannot be null. (Note that the above
     * statement applies only after the setter has been called as part of the
     * IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is
     * created. It is used in execute(), setContestStatusManager(). Its value
     * legality is checked in checkConfiguration() method.
     * </p>
     */
    private ContestStatusManager contestStatusManager;

    /**
     * <p>
     * The retrieved contest statuses. It is accessed through getter and doesn't
     * have a setter. It cannot be null but can be empty. The contained values
     * can't be null. It does not need to be initialized when the instance is
     * created. It is used in getContestStatuses(), execute().
     * </p>
     */
    private List<ContestStatusDTO> contestStatuses;

    /**
     * The list of JSON errors.
     */
    private List<String> jsonErrors;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ContestStatusManagerAction() {
        // Empty
    }

    /**
     * <p>
     * Get contest statuses.
     * </p>
     * 
     * @return SUCCESS
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    @Override
    public String execute() throws ContestServicesActionException {
        // Log the entry
        final String signature = CLASS_NAME + ".execute()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            JSONObject jsonObject = this.getParameterAsJSONObject();
            Map<String, Object> mapParam = Helper.parseJsonToParam(jsonObject);

            ContestStatusFilter filter = new ContestStatusFilter();
            // Parse the json string to BaseFilter
            jsonErrors = Helper.parseJsonToBaseFilter(filter, jsonObject,
                    getDateFormatString());
            contestStatuses = contestStatusManager.retrieveContestStatuses(
                    (String) mapParam.get("columnName"),
                    (SortingOrder) mapParam.get("sortingOrder"),
                    (Integer) mapParam.get("pageNumber"),
                    (Integer) mapParam.get("pageSize"), filter);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, SUCCESS);

            return SUCCESS;
        } catch (ContestServicesActionException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (ContestStatusManagerException e) {
            throw Helper
                    .logException(
                            LOGGER,
                            new ContestServicesActionException(
                                    "ContestStatusManagerException occurs while retrieving contestStatuses",
                                    e), signature);
        }
    }

    /**
     * <p>
     * Getter method for contestStatuses, simply return the value of the
     * namesake field.
     * </p>
     * 
     * @return the contestStatuses
     */
    public List<ContestStatusDTO> getContestStatuses() {
        return contestStatuses;
    }

    /**
     * <p>
     * Setter method for the contestStatusManager, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param contestStatusManager
     *            The ContestStatusManager for getting contest statuses to set
     */
    public void setContestStatusManager(
            ContestStatusManager contestStatusManager) {
        this.contestStatusManager = contestStatusManager;
    }

    /**
     * <p>
     * This method is called right after the dependency of this class is fully
     * injected. It checks if the injected values are valid.
     * </p>
     * 
     * @throws ContestServicesConfigurationException
     *             if any of the injected values is invalid.
     */
    @Override
    public void checkConfiguration() {
        super.checkConfiguration();
        // Check the value of the following fields according to their legal
        // value specification in the field
        // variable documentation:
        Helper.checkNotNullForConfiguration("contestStatusManager",
                contestStatusManager);
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
