/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;

import org.apache.log4j.Logger;

import com.topcoder.web.tc.BugRacesManager;
import com.topcoder.web.tc.BugRacesManagerException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.dto.BugRaceDTO;

/**
 * <p>
 * This action simply wraps around BugRacesManager and provides its service to the front end.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable. However, dedicated instance of struts action will
 * be created by the struts framework to process the user request, so the struts actions don't need to be thread-safe.
 * </p>
 * @author duxiaoyang
 * @version 1.0
 */
public class BugRacesManagerAction extends BaseJSONParameterAction {

    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = BugRacesManagerAction.class.getName();

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be that constant value It is final and won't
     * change once it is initialized as part of variable declaration to: Logger.getLogger(BugRacesManagerAction.class).
     * It is used throughout the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(BugRacesManagerAction.class);

    /**
     * <p>
     * The BugRacesManager for getting bug race contests. It is set through setter and doesn't have a getter. It cannot
     * be null. (Note that the above statement applies only after the setter has been called as part of the IoC
     * initialization. This field's value has no restriction before the IoC initialization) It does not need to be
     * initialized when the instance is created. It is used in execute(), setBugRacesManager(). Its value legality is
     * checked in checkConfiguration() method.
     * </p>
     */
    private BugRacesManager bugRacesManager;

    /**
     * <p>
     * The retrieved bug races. It is accessed through getter and doesn't have a setter. It cannot be null but can be
     * empty. The contained values can't be null. It does not need to be initialized when the instance is created. It is
     * used in execute(), getBugRaces().
     * </p>
     */
    private List<BugRaceDTO> bugRaces;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public BugRacesManagerAction() {
    }

    /**
     * <p>
     * Gets bug race contests.
     * </p>
     * @return SUCCESS.
     * @throws ContestServicesActionException
     *             if any error occurs.
     */
    public String execute() throws ContestServicesActionException {
        final String signature = CLASS_NAME + ".execute()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            bugRaces = bugRacesManager.retrieveBugRaces();
        } catch (BugRacesManagerException e) {
            throw Helper.logException(LOGGER, new ContestServicesActionException(
                    "BugRacesManagerException occurs while retrieving BugRaces", e), signature);
        }

        Helper.logExit(LOGGER, signature, startTime, SUCCESS);

        return SUCCESS;
    }

    /**
     * <p>
     * Getter method for bugRaces, simply return the value of the namesake field.
     * </p>
     * @return the bugRaces.
     */
    public List<BugRaceDTO> getBugRaces() {
        return bugRaces;
    }

    /**
     * <p>
     * Setter method for the bugRacesManager, simply set the value to the namesake field.
     * </p>
     * @param bugRacesManager
     *            The BugRacesManager for getting bug race contests.
     */
    public void setBugRacesManager(BugRacesManager bugRacesManager) {
        this.bugRacesManager = bugRacesManager;
    }

    /**
     * <p>
     * This method is called right after the dependency of this class is fully injected. It checks if the injected
     * values are valid.
     * </p>
     * @throws ContestServicesConfigurationException
     *             if any of the injected values is invalid.
     */
    @Override
    public void checkConfiguration() {
        super.checkConfiguration();
        Helper.checkNotNullForConfiguration("bugRacesManager", bugRacesManager);
    }
}
