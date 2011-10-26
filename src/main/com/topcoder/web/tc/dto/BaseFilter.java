/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.List;

/**
 * <p>
 * This class defines the common properties of all filter classes of this component. It also implements
 * Filterable marker interface.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public abstract class BaseFilter implements Filterable {
    /**
     * <p>
     * The contest types that the data to filter must match (it must match at least one of the values in the
     * list). It has both getter and setter. It can be any value. It does not need to be initialized when the
     * instance is created. It is used in getTypes(), setTypes().
     * </p>
     */
    private List<String> types;

    /**
     * <p>
     * The contest sub-types that the data to filter must match (it must match at least one of the values in
     * the list). It has both getter and setter. It can be any value. It does not need to be initialized when
     * the instance is created. It is used in setSubTypes(), getSubTypes().
     * </p>
     */
    private List<String> subTypes;

    /**
     * <p>
     * The contest catalogs that the data to filter must match (it must match at least one of the values in
     * the list). It has both getter and setter. It can be any value. It does not need to be initialized when
     * the instance is created. It is used in setCatalogs(), getCatalogs().
     * </p>
     */
    private List<String> catalogs;

    /**
     * <p>
     * The contest name. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in getContestName(), setContestName().
     * </p>
     */
    private String contestName;

    /**
     * <p>
     * The registration start date. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setRegistrationStartDate(),
     * getRegistrationStartDate().
     * </p>
     */
    private DateIntervalSpecification registrationStartDate;

    /**
     * <p>
     * The submission end date. It has both getter and setter. It can be any value. It does not need to be
     * initialized when the instance is created. It is used in setSubmissionEndDate(), getSubmissionEndDate().
     * </p>
     */
    private DateIntervalSpecification submissionEndDate;

    /**
     * <p>
     * The contest finalization date. It has both getter and setter. It can be any value. It does not need to
     * be initialized when the instance is created. It is used in setContestFinalizationDate(),
     * getContestFinalizationDate().
     * </p>
     */
    private DateIntervalSpecification contestFinalizationDate;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    protected BaseFilter() {
        // Empty
    }

    /**
     * <p>
     * Getter method for types, simply return the value of the namesake field.
     * </p>
     *
     * @return the types
     */
    public List<String> getTypes() {
        return types;
    }

    /**
     * <p>
     * Setter method for the types, simply set the value to the namesake field.
     * </p>
     *
     * @param types
     *            the types to set
     */
    public void setTypes(List<String> types) {
        this.types = types;
    }

    /**
     * <p>
     * Getter method for subTypes, simply return the value of the namesake field.
     * </p>
     *
     * @return the subTypes
     */
    public List<String> getSubTypes() {
        return subTypes;
    }

    /**
     * <p>
     * Setter method for the subTypes, simply set the value to the namesake field.
     * </p>
     *
     * @param subTypes
     *            the subTypes to set
     */
    public void setSubTypes(List<String> subTypes) {
        this.subTypes = subTypes;
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
     * Setter method for the catalogs, simply set the value to the namesake field.
     * </p>
     *
     * @param catalogs
     *            the catalogs to set
     */
    public void setCatalogs(List<String> catalogs) {
        this.catalogs = catalogs;
    }

    /**
     * <p>
     * Getter method for contestName, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestName
     */
    public String getContestName() {
        return contestName;
    }

    /**
     * <p>
     * Setter method for the contestName, simply set the value to the namesake field.
     * </p>
     *
     * @param contestName
     *            the contestName to set
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    /**
     * <p>
     * Getter method for registrationStartDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the registrationStartDate
     */
    public DateIntervalSpecification getRegistrationStartDate() {
        return registrationStartDate;
    }

    /**
     * <p>
     * Setter method for the registrationStartDate, simply set the value to the namesake field.
     * </p>
     *
     * @param registrationStartDate
     *            the registrationStartDate to set
     */
    public void setRegistrationStartDate(DateIntervalSpecification registrationStartDate) {
        this.registrationStartDate = registrationStartDate;
    }

    /**
     * <p>
     * Getter method for submissionEndDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the submissionEndDate
     */
    public DateIntervalSpecification getSubmissionEndDate() {
        return submissionEndDate;
    }

    /**
     * <p>
     * Setter method for the submissionEndDate, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionEndDate
     *            the submissionEndDate to set
     */
    public void setSubmissionEndDate(DateIntervalSpecification submissionEndDate) {
        this.submissionEndDate = submissionEndDate;
    }

    /**
     * <p>
     * Getter method for contestFinalizationDate, simply return the value of the namesake field.
     * </p>
     *
     * @return the contestFinalizationDate
     */
    public DateIntervalSpecification getContestFinalizationDate() {
        return contestFinalizationDate;
    }

    /**
     * <p>
     * Setter method for the contestFinalizationDate, simply set the value to the namesake field.
     * </p>
     *
     * @param contestFinalizationDate
     *            the contestFinalizationDate to set
     */
    public void setContestFinalizationDate(DateIntervalSpecification contestFinalizationDate) {
        this.contestFinalizationDate = contestFinalizationDate;
    }

}
