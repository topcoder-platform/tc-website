/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.action;

import java.util.List;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.topcoder.web.tc.CategoriesManager;
import com.topcoder.web.tc.CategoriesManagerException;
import com.topcoder.web.tc.Helper;

/**
 * <p>
 * This action simply wraps around CategoriesManager and provides its service to the front end.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable. However, dedicated instance of struts
 * action will be created by the struts framework to process the user request, so the struts actions don't
 * need to be thread-safe.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class CategoriesManagerAction extends ActionSupport {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = CategoriesManagerAction.class.getName();

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be that constant value It is final
     * and won't change once it is initialized as part of variable declaration to:
     * Logger.getLogger(CategoriesManagerAction.class). It is used throughout the class wherever logging is
     * needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(CategoriesManagerAction.class);

    /**
     * <p>
     * The CategoriesManager for getting contest types, sub-types, and catalogs. It is set through setter and
     * doesn't have a getter. It cannot be null. (Note that the above statement applies only after the setter
     * has been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * retrieveContestTypes(), retrieveContestSubTypes(), retrieveCatalogs(), setCategoriesManager(). Its
     * value legality is checked in checkConfiguration() method.
     * </p>
     */
    private CategoriesManager categoriesManager;

    /**
     * <p>
     * The category used to get contest types. It has both getter and setter. It can be any value. It does not
     * need to be initialized when the instance is created. It is used in setCategory(), getCategory(),
     * retrieveContestTypes().
     * </p>
     */
    private String category;

    /**
     * <p>
     * The type used to get the contest sub-types. It has both getter and setter. It cannot be null or empty.
     * (Note that the above statement applies only after the field has passed Struts validation. This field's
     * value has no restriction before then.) It does not need to be initialized when the instance is created.
     * It is used in getType(), setType(), retrieveContestSubTypes().
     * </p>
     */
    private String type;

    /**
     * <p>
     * The retrieved contest types. It is accessed through getter and doesn't have a setter. It cannot be null
     * but can be empty. The contained values can't be null or empty. It does not need to be initialized when
     * the instance is created. It is used in retrieveContestTypes(), getContestTypes().
     * </p>
     */
    private List<String> contestTypes;

    /**
     * <p>
     * The retrieved contest sub types. It is accessed through getter and doesn't have a setter. It cannot be
     * null but can be empty. The contained values can't be null or empty. It does not need to be initialized
     * when the instance is created. It is used in getContestSubTypes(), retrieveContestSubTypes().
     * </p>
     */
    private List<String> contestSubTypes;

    /**
     * <p>
     * The retrieved catalogs. It is accessed through getter and doesn't have a setter. It cannot be null but
     * can be empty. The contained values can't be null or empty. It does not need to be initialized when the
     * instance is created. It is used in getCatalogs(), retrieveCatalogs().
     * </p>
     */
    private List<String> catalogs;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public CategoriesManagerAction() {
        // Empty
    }

    /**
     * <p>
     * Get contest types.
     * </p>
     *
     * @return SUCCESS
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    public String retrieveContestTypes() throws ContestServicesActionException {
        // Log the entry
        final String signature = CLASS_NAME + ".retrieveContestTypes()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            if (Helper.checkStringNotNullAndNotEmptyOfBoolean(category)) {
                contestTypes = categoriesManager.getContestTypes(category);
            } else {
                contestTypes = categoriesManager.getContestTypes();
            }

            // log exit
            Helper.logExit(LOGGER, signature, startTime, SUCCESS);

            return SUCCESS;
        } catch (CategoriesManagerException e) {
            throw Helper.logException(LOGGER, new ContestServicesActionException(
                "CategoriesManagerException occurs while getting ContestTypes", e), signature);
        }
    }

    /**
     * <p>
     * Get contest sub types.
     * </p>
     *
     * @return INPUT or SUCCESS
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    public String retrieveContestSubTypes() throws ContestServicesActionException {
        // Log the entry
        final String signature = CLASS_NAME + ".retrieveContestSubTypes()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            if (!Helper.checkStringNotNullAndNotEmptyOfBoolean(type)) {
                this.addFieldError("type", "type is required");

                // log exit
                Helper.logExit(LOGGER, signature, startTime, INPUT);

                return INPUT;
            }
            contestSubTypes = categoriesManager.getContestSubTypes(type);
            // log exit
            Helper.logExit(LOGGER, signature, startTime, SUCCESS);

            return SUCCESS;
        } catch (CategoriesManagerException e) {
            throw Helper.logException(LOGGER, new ContestServicesActionException(
                "CategoriesManagerException occurs while getting ContestTypes", e), signature);
        }
    }

    /**
     * <p>
     * Get catalogs.
     * </p>
     *
     * @return SUCCESS
     * @throws ContestServicesActionException
     *             if any error occurs
     */
    public String retrieveCatalogs() throws ContestServicesActionException {
        // Log the entry
        final String signature = CLASS_NAME + ".retrieveCatalogs()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            catalogs = categoriesManager.getCatalogs();

            // log exit
            Helper.logExit(LOGGER, signature, startTime, SUCCESS);

            return SUCCESS;
        } catch (CategoriesManagerException e) {
            throw Helper.logException(LOGGER, new ContestServicesActionException(
                "CategoriesManagerException occurs while getting ContestTypes", e), signature);
        }
    }

    /**
     * <p>
     * Getter method for category, simply return the value of the namesake field.
     * </p>
     *
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * <p>
     * Setter method for the category, simply set the value to the namesake field.
     * </p>
     *
     * @param category
     *            The category used to get contest types.
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * <p>
     * Getter method for type, simply return the value of the namesake field.
     * </p>
     *
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * <p>
     * Setter method for the type, simply set the value to the namesake field.
     * </p>
     *
     * @param type
     *            The type used to get the contest sub-types.
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * <p>
     * Getter method for contestTypes, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestTypes
     */
    public List<String> getContestTypes() {
        return contestTypes;
    }

    /**
     * <p>
     * Getter method for contestSubTypes, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestSubTypes
     */
    public List<String> getContestSubTypes() {
        return contestSubTypes;
    }

    /**
     * <p>
     * Getter method for catalogs, simply return the value of the namesake field.
     * </p>
     *
     * @return the catalogs
     */
    public List<String> getCatalogs() {
        return catalogs;
    }

    /**
     * <p>
     * Setter method for the categoriesManager, simply set the value to the namesake field.
     * </p>
     *
     * @param categoriesManager
     *            The CategoriesManager for getting contest types, sub-types, and catalogs
     */
    public void setCategoriesManager(CategoriesManager categoriesManager) {
        this.categoriesManager = categoriesManager;
    }

    /**
     * <p>
     * This method is called right after the dependency of this class is fully injected. It checks if the
     * injected values are valid.
     * </p>
     *
     * @throws ContestServicesConfigurationException
     *             if any of the injected values is invalid.
     */
    public void checkConfiguration() {
        // Check the value of the following fields according to their legal value specification in the field
        // variable documentation:
        Helper.checkNotNullForConfiguration("categoriesManager", categoriesManager);
    }
}
