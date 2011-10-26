/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.implement;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.type.StringType;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.AbstractContestsFilter;

/**
 * <p>
 * This is the base manager implementation which has the support for logging. It extends from HibernateDaoSupport to
 * support Hibernate.
 * </p>
 * <p>
 * This class is not technically thread-safe because it is mutable. However, it can be considered effectively
 * thread-safe after configuration assuming that the passed in parameters are not changed by other threads at the same
 * time.
 * </p>
 * @author flytoj2ee, duxiaoyang
 * @version 1.0
 */
public abstract class AbstractManagerImpl extends HibernateDaoSupport {

    /**
     * Represents the type criteria statement.
     */
    private static final String TYPE_CRITERIA = " AND pgc.name IN (:type)";

    /**
     * Represents the subtype criteria statement.
     */
    private static final String SUBTYPE_CRITERIA = " AND pc.name IN (:subtype)";

    /**
     * Represents the catalog criteria statement.
     */
    private static final String CATALOG_CRITERIA = " AND c.name IN (:catalog)";

    /**
     * Represents the registration start time before criteria statement.
     */
    private static final String REG_START_DATE_BEFORE_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) < :regStart";

    /**
     * Represents the registration start time after criteria statement.
     */
    private static final String REG_START_DATE_AFTER_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) > :regStart";

    /**
     * Represents the registration start time on criteria statement.
     */
    private static final String REG_START_DATE_ON_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) = :regStart";

    /**
     * Represents the registration start time between criteria statement.
     */
    private static final String REG_START_DATE_BETWEEN_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) BETWEEN :regStart1 AND :regStart2";

    /**
     * Represents the registration start time before current criteria statement.
     */
    private static final String REG_START_DATE_BEFORE_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) < CURRENT";

    /**
     * Represents the registration start time after current criteria statement.
     */
    private static final String REG_START_DATE_AFTER_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledStartTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) > CURRENT";

    /**
     * Represents the submission end time before criteria statement.
     */
    private static final String SUB_END_DATE_BEFORE_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) < :subEnd";

    /**
     * Represents the submission end time after criteria statement.
     */
    private static final String SUB_END_DATE_AFTER_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) > :subEnd";

    /**
     * Represents the submission end time on criteria statement.
     */
    private static final String SUB_END_DATE_ON_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) = :subEnd";

    /**
     * Represents the submission end time between criteria statement.
     */
    private static final String SUB_END_DATE_BETWEEN_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) BETWEEN :subEnd1 AND :subEnd2";

    /**
     * Represents the submission end time before current criteria statement.
     */
    private static final String SUB_END_DATE_BEFORE_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) < CURRENT";

    /**
     * Represents the submission end time after current criteria statement.
     */
    private static final String SUB_END_DATE_AFTER_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledEndTime) "
            + "FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 2) > CURRENT";

    /**
     * Represent the logger object used for logging. It has setter and getter. It is used throughout the class wherever
     * logging is needed.
     */
    private Logger logger;

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    protected AbstractManagerImpl() {
    }

    /**
     * <p>
     * Gets the logger.
     * </p>
     * @return the logger.
     */
    public Logger getLogger() {
        return logger;
    }

    /**
     * <p>
     * Sets the logger
     * </p>
     * @param logger
     *            the logger to set.
     */
    public void setLogger(Logger logger) {
        this.logger = logger;
    }

    /**
     * <p>
     * Sets the logger name.
     * </p>
     * @param name
     *            the logger name to set.
     */
    public void setLoggerName(String name) {
        logger = Logger.getLogger(name);
    }

    /**
     * <p>
     * Returns a common filter clause which can be used in an HQL statement. The returned clause will contain criteria
     * for type, subtype, catalog, registration start time, and submission end time.
     * </p>
     * @param filter
     *            the filter whose clause will be returned.
     * @return a common filter clause which can be used in an HQL statement.
     */
    protected String getCommonFilterClause(AbstractContestsFilter filter) {
        StringBuilder hql = new StringBuilder();
        if (filter.getType() != null) {
            hql.append(TYPE_CRITERIA);
        }
        if (filter.getSubtype() != null) {
            hql.append(SUBTYPE_CRITERIA);
        }
        if (filter.getCatalog() != null) {
            hql.append(CATALOG_CRITERIA);
        }
        if (filter.getRegistrationStart() != null) {
            switch (filter.getRegistrationStart().getIntervalType()) {
            case BEFORE:
                hql.append(REG_START_DATE_BEFORE_CRITERIA);
                break;
            case AFTER:
                hql.append(REG_START_DATE_AFTER_CRITERIA);
                break;
            case ON:
                hql.append(REG_START_DATE_ON_CRITERIA);
                break;
            case BETWEEN_DATES:
                hql.append(REG_START_DATE_BETWEEN_CRITERIA);
                break;
            case BEFORE_CURRENT_DATE:
                hql.append(REG_START_DATE_BEFORE_CURRENT_CRITERIA);
                break;
            case AFTER_CURRENT_DATE:
                hql.append(REG_START_DATE_AFTER_CURRENT_CRITERIA);
                break;
            }
        }
        if (filter.getSubmissionEnd() != null) {
            switch (filter.getSubmissionEnd().getIntervalType()) {
            case BEFORE:
                hql.append(SUB_END_DATE_BEFORE_CRITERIA);
                break;
            case AFTER:
                hql.append(SUB_END_DATE_AFTER_CRITERIA);
                break;
            case ON:
                hql.append(SUB_END_DATE_ON_CRITERIA);
                break;
            case BETWEEN_DATES:
                hql.append(SUB_END_DATE_BETWEEN_CRITERIA);
                break;
            case BEFORE_CURRENT_DATE:
                hql.append(SUB_END_DATE_BEFORE_CURRENT_CRITERIA);
                break;
            case AFTER_CURRENT_DATE:
                hql.append(SUB_END_DATE_AFTER_CURRENT_CRITERIA);
                break;
            }
        }
        return hql.toString();
    }

    /**
     * <p>
     * Returns a sorting clause which can be used in an HQL statement. If either columnName or sortingOrder is null or
     * columnName is empty, the sorting will be based on contestStartTime with descending order.
     * </p>
     * @param columnName
     *            the column name on which sorting will be performed.
     * @param sortingOrder
     *            the sorting order.
     * @return a sorting clause which can be used in an HQL statement.
     */
    protected String getSortingClause(String columnName, SortingOrder sortingOrder) {
        if (columnName == null || columnName.trim().length() == 0 || sortingOrder == null) {
            columnName = "contestStartTime";
            sortingOrder = SortingOrder.DESCENDING;
        }
        return " ORDER BY " + columnName + (sortingOrder == SortingOrder.ASCENDING ? " ASC" : " DESC");
    }

    /**
     * <p>
     * Sets the common criteria into the given query. It will set type, subtype, catalog, registration start time, and
     * submission end time into the given query.
     * </p>
     * @param query
     *            the query to set searching criteria.
     * @param filter
     *            the filter containing searching criteria.
     */
    protected void setCommonFilterCondition(Query query, AbstractContestsFilter filter) {
        if (filter.getType() != null) {
            query.setParameterList("type", filter.getType(), StringType.INSTANCE);
        }
        if (filter.getSubtype() != null) {
            query.setParameterList("subtype", filter.getSubtype(), StringType.INSTANCE);
        }
        if (filter.getCatalog() != null) {
            query.setParameterList("catalog", filter.getCatalog(), StringType.INSTANCE);
        }
        if (filter.getRegistrationStart() != null) {
            switch (filter.getRegistrationStart().getIntervalType()) {
            case BEFORE:
            case AFTER:
            case ON:
                query.setDate("regStart", filter.getRegistrationStart().getFirstDate());
                break;
            case BETWEEN_DATES:
                query.setDate("regStart1", filter.getRegistrationStart().getFirstDate());
                query.setDate("regStart2", filter.getRegistrationStart().getSecondDate());
                break;
            }
        }
        if (filter.getSubmissionEnd() != null) {
            switch (filter.getSubmissionEnd().getIntervalType()) {
            case BEFORE:
            case AFTER:
            case ON:
                query.setDate("subEnd", filter.getSubmissionEnd().getFirstDate());
                break;
            case BETWEEN_DATES:
                query.setDate("subEnd1", filter.getSubmissionEnd().getFirstDate());
                query.setDate("subEnd2", filter.getSubmissionEnd().getSecondDate());
                break;
            }
        }
    }
}
