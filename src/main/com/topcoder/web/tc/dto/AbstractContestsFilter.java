/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.List;

/**
 * <p>
 * This class defines the common properties of all filter classes in this component.
 * </p>
 * <p>
 * This class is not thread-safe because it is mutable.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public abstract class AbstractContestsFilter extends ContestNameEntity implements Filterable {

    /**
     * Represents the type of contest filter. It can be any string value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private List<String> type;

    /**
     * Represents the sub-type of contest filter. It can be any string value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private List<String> subtype;

    /**
     * Represents the catalog of contest filter. It can be any string value. It can be accessed through corresponding
     * getter and setter methods.
     */
    private List<String> catalog;

    /**
     * Represents the registration start date of contest filter. It can be any string value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private DateIntervalSpecification registrationStart;

    /**
     * Represents the submission end date of contest filter. It can be any string value. It can be accessed through
     * corresponding getter and setter methods.
     */
    private DateIntervalSpecification submissionEnd;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    protected AbstractContestsFilter() {
    }

    /**
     * <p>
     * Gets the type of contest filter.
     * </p>
     * @return the type of contest filter.
     */
    public List<String> getType() {
        return type;
    }

    /**
     * <p>
     * Sets the type of contest filter.
     * </p>
     * @param type
     *            the contest filter type to set.
     */
    public void setType(List<String> type) {
        this.type = type;
    }

    /**
     * <p>
     * Gets the sub-type of contest filter.
     * </p>
     * @return the sub-type of contest filter.
     */
    public List<String> getSubtype() {
        return subtype;
    }

    /**
     * <p>
     * Sets the sub-type of contest filter.
     * </p>
     * @param subtype
     *            the contest filter sub-type to set.
     */
    public void setSubtype(List<String> subtype) {
        this.subtype = subtype;
    }

    /**
     * <p>
     * Gets the catalog of contest filter.
     * </p>
     * @return the catalog of contest filter.
     */
    public List<String> getCatalog() {
        return catalog;
    }

    /**
     * <p>
     * Sets the catalog of contest filter.
     * </p>
     * @param catalog
     *            the contest filter catalog to set.
     */
    public void setCatalog(List<String> catalog) {
        this.catalog = catalog;
    }

    /**
     * <p>
     * Gets the registration start date of contest filter.
     * </p>
     * @return the registration start date of contest filter.
     */
    public DateIntervalSpecification getRegistrationStart() {
        return registrationStart;
    }

    /**
     * <p>
     * Sets the registration start date of contest filter.
     * </p>
     * @param registrationStart
     *            the contest filter registration start date to set.
     */
    public void setRegistrationStart(DateIntervalSpecification registrationStart) {
        this.registrationStart = registrationStart;
    }

    /**
     * <p>
     * Gets the submission end date of contest filter.
     * </p>
     * @return the submission end date of contest filter.
     */
    public DateIntervalSpecification getSubmissionEnd() {
        return submissionEnd;
    }

    /**
     * <p>
     * Sets the submission end date of contest filter.
     * </p>
     * @param submissionEnd
     *            the contest filter submission end date to set.
     */
    public void setSubmissionEnd(DateIntervalSpecification submissionEnd) {
        this.submissionEnd = submissionEnd;
    }
}
