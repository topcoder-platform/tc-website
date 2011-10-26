/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.topcoder.web.tc.CategoriesManager;
import com.topcoder.web.tc.CategoriesManagerException;
import com.topcoder.web.tc.Helper;

/**
 * <p>
 * This is the default implementation of CategoriesManager. It extends HibernateDaoSupport to execute HQL
 * query to get the data.
 * </p>
 * <p>
 * Thread Safety: This class is not technically thread-safe because it's mutable. However, it can be
 * considered effectively thread-safe after configuration assuming that it's not changed after configuration
 * and the passed in parameters are not changed by other threads at the same time because it holds no mutable
 * state under such assumptions
 * </p>
 *
 * <p>
 * <b>Usage:</b>
 *
 * <pre>
 * // Get the CategoriesManager from Spring
 * CategoriesManager categoriesManager = (CategoriesManager) applicationContext.getBean(&quot;categoriesManagerBean&quot;);
 *
 * // Get all catalogs
 * List&lt;String&gt; catalogs = categoriesManager.getCatalogs();
 *
 * // Get all types
 * List&lt;String&gt; types = categoriesManager.getContestTypes();
 *
 * // Get all types of catalog 'application'
 * types = categoriesManager.getContestTypes(&quot;application&quot;);
 *
 * // Get all sub-types of type 'architecture'
 * List&lt;String&gt; subTypes = categoriesManager.getContestSubTypes(&quot;architecture&quot;);
 * </pre>
 *
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER
 * @version 1.0
 */
public class CategoriesManagerImpl extends HibernateDaoSupport implements CategoriesManager {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = CategoriesManagerImpl.class.getName();

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CATALOGS = "select t.name from ProjectCatalogLookup t";

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CONTEST_TYPES = "select t.name from ProjectGroupCategoryLookup t";

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CONTEST_TYPES_WITH_CATEGORY = "select t.name from"
        + " ProjectGroupCategoryLookup t, ProjectCatalogLookup c"
        + " where t.projectCatalogId=c.projectCatalogId and c.name=?";

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CONTEST_SUBTYPES_WITH_TYPE = "select t.name from"
        + " ProjectCategoryLookup t, ProjectGroupCategoryLookup g"
        + " where t.projectGroupCategoryId=g.projectGroupCategoryId and g.name=?";

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be that constant value It is final
     * and won't change once it is initialized as part of variable declaration to:
     * Logger.getLogger(CategoriesManagerImpl.class). It is used throughout the class wherever logging is
     * needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(CategoriesManagerImpl.class);

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public CategoriesManagerImpl() {
        // Empty
    }

    /**
     * <p>
     * Get all contest catalogs.
     * </p>
     *
     * @return all catalogs. It won't be null but could be empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    @SuppressWarnings("unchecked")
    public List<String> getCatalogs() throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getCatalogs()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            List<String> result = this.getHibernateTemplate().find(SQL_QUERY_CATALOGS);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);

            return result;
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER, new CategoriesManagerException(
                "DataAccessException occurs while executing", e), signature);
        }
    }

    /**
     * <p>
     * Get all contest types.
     * </p>
     *
     * @return all contest types. It won't be null but could be empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    @SuppressWarnings("unchecked")
    public List<String> getContestTypes() throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getContestTypes()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            List<String> result = this.getHibernateTemplate().find(SQL_QUERY_CONTEST_TYPES);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);

            return result;
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER, new CategoriesManagerException(
                "DataAccessException occurs while executing", e), signature);
        }
    }

    /**
     * <p>
     * Get all contest types of a category.
     * </p>
     *
     * @param category
     *            the category under which the contest types are returned.
     * @return all contest types of the given category. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if category is null or empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    @SuppressWarnings("unchecked")
    public List<String> getContestTypes(String category) throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getContestTypes(String)";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            checkStringNotNullAndNotEmpty("category", category);

            List<String> result = this.getHibernateTemplate().find(SQL_QUERY_CONTEST_TYPES_WITH_CATEGORY,
                category);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);

            return result;
        } catch (IllegalArgumentException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER, new CategoriesManagerException(
                "DataAccessException occurs while executing", e), signature);
        }
    }

    /**
     * <p>
     * Get all contest sub-types of a contest type.
     * </p>
     *
     * @param type
     *            the type under which all sub-types are returned.
     * @return all contest sub-types of the given contest type. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if type is null or empty.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    @SuppressWarnings("unchecked")
    public List<String> getContestSubTypes(String type) throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getContestTypes(String)";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            checkStringNotNullAndNotEmpty("type", type);

            List<String> result = this.getHibernateTemplate()
                            .find(SQL_QUERY_CONTEST_SUBTYPES_WITH_TYPE, type);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);

            return result;
        } catch (IllegalArgumentException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER, new CategoriesManagerException(
                "DataAccessException occurs while executing", e), signature);
        }
    }

    /**
     * <p>
     * Throw IllegalArgumentException if the parameter is null or empty.
     * </p>
     *
     * @param param
     *            the argument to be checked
     * @param name
     *            the name of the argument showed in exception
     * @throws IllegalArgumentException
     *             if the argument does not meet the request
     */
    private static void checkStringNotNullAndNotEmpty(String name, String param) {
        if (param == null || param.trim().length() == 0) {
            throw new IllegalArgumentException("The argument " + name + " cannot be null or empty.");
        }
    }
}
