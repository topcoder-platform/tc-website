/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.topcoder.json.object.JSONObject;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.PastContestsManager;
import com.topcoder.web.tc.PastContestsManagerException;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.PastContestDTO;
import com.topcoder.web.tc.dto.PastContestFilter;

/**
 * <p>
 * This action simply wraps around PastContestsManager and provides its service
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
public class PastContestsManagerAction extends BaseJSONParameterAction {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = PastContestsManagerAction.class
            .getName();
    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(PastContestsManagerAction.class). It is used throughout
     * the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(PastContestsManagerAction.class);

    /**
     * <p>
     * The PastContestsManager for getting past contests. It is set through
     * setter and doesn't have a getter. It cannot be null. (Note that the above
     * statement applies only after the setter has been called as part of the
     * IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is
     * created. It is used in execute(), setPastContestsManager(). Its value
     * legality is checked in checkConfiguration() method.
     * </p>
     */
    private PastContestsManager pastContestsManager;

    /**
     * <p>
     * The retrieved past contests. It is accessed through getter and doesn't
     * have a setter. It cannot be null but can be empty. The contained values
     * can't be null. It does not need to be initialized when the instance is
     * created. It is used in getPastContests(), execute().
     * </p>
     */
    private List<PastContestDTO> pastContests;

    /**
     * The list of JSON errors.
     */
    private List<String> jsonErrors;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public PastContestsManagerAction() {
        // Empty
    }

    /**
     * <p>
     * Get past contests.
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

            PastContestFilter filter = new PastContestFilter();
            // Parse the json string to BaseFilter
            jsonErrors = Helper.parseJsonToBaseFilter(filter, jsonObject,
                    getDateFormatString());
            pastContests = pastContestsManager.retrievePastContests(
                    (String) mapParam.get("columnName"),
                    (SortingOrder) mapParam.get("sortingOrder"),
                    (Integer) mapParam.get("pageNumber"),
                    (Integer) mapParam.get("pageSize"), filter);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, SUCCESS);

            return SUCCESS;
        } catch (ContestServicesActionException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (PastContestsManagerException e) {
            throw Helper
                    .logException(
                            LOGGER,
                            new ContestServicesActionException(
                                    "PastContestsManagerException occurs while retrieving pastContests",
                                    e), signature);
        }
    }

    /**
     * <p>
     * Getter method for pastContests, simply return the value of the namesake
     * field.
     * </p>
     * 
     * @return the pastContests
     */
    public List<PastContestDTO> getPastContests() {
        return pastContests;
    }

    /**
     * <p>
     * Setter method for the pastContestsManager, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param pastContestsManager
     *            The PastContestsManager for getting past contests to set
     */
    public void setPastContestsManager(PastContestsManager pastContestsManager) {
        this.pastContestsManager = pastContestsManager;
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
        Helper.checkNotNullForConfiguration("pastContestsManager",
                pastContestsManager);
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
