/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.topcoder.web.tc.CategoriesManager;
import com.topcoder.web.tc.CategoriesManagerException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.dto.CategoryDTO;

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
 * </pre>
 *
 * </p>
 *
 * <p>
 * Changes in 1.1: Removed getContestSubTypes method since it is unused.
 * </p>
 *
 * <p>
 * Changes in 1.2 : 1, Add method {@link #getCategoryName(Long)} to get category name by category id. 2, Using 
 * CategoryDTO instead of String to represent the returned category
 * </p>
 * 
 * @author mekanizumu, TCSDEVELOPER, pinoydream, bugbuka
 * @version 1.2
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
    private static final String SQL_QUERY_CONTEST_TYPES = "select t.name from ProjectCategoryLookup t";

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CONTEST_TYPES_WITH_CATEGORY = "select t.projectCategoryId as categoryId, t.name as categoryName from"
        + " ProjectCategoryLookup t, ProjectCatalogLookup c"
        + " where t.projectCatalogId=c.projectCatalogId and c.name=:catalog";

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY_CATEGORY_NAME = "select t.name from ProjectCategoryLookup t"
    	+ " where t.projectCategoryId=?";
    
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
     * Get the category name specified by the category id.
     * </p>
     *
     * @param categoryId 
     *            the specified category id
     * @return category name. if there is no corresponding category name, returns null.
     * @throws CategoriesManagerException
     *             if any error occurs
     */
    @SuppressWarnings("unchecked")
    public String getCategoryName(Long categoryId) throws CategoriesManagerException{
        // Log the entry
        final String signature = CLASS_NAME + ".getCategoryName(Long)";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();
        
        try {
            List<String> result = this.getHibernateTemplate().find(SQL_QUERY_CATEGORY_NAME, categoryId);

            // log exit
            Helper.logExit(LOGGER, signature, startTime, result);
 
            if (result != null && !result.isEmpty()) {
                return result.get(0);
            }

            return null;
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
    public List<CategoryDTO> getContestTypes() throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getContestTypes()";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            // This will hold the result to return:
            final List<CategoryDTO> categories = new ArrayList<CategoryDTO>();
            
            // This block should call this.getHibernateTemplate().execute(new
            // HibernateCallback() { ...}), the
            // anonymous HibernateCallback is defined as follows
            this.getHibernateTemplate().execute(
                    new HibernateCallback<Object>() {

                        /**
                         * <p>
                         * Do the hibernate process.
                         * </p>
                         * 
                         * @param session
                         *            the session
                         * @return null
                         * @throws HibernateException
                         *             if any error occurs
                         */
                         public Object doInHibernate(Session session)
                                 throws HibernateException {
                     
                             Query query = session.createQuery(SQL_QUERY_CONTEST_TYPES);
                     
                             // Execute the query:
                             List<Object[]> result = query.list();
                             for (Object[] row : result) {
                             	CategoryDTO dto = new CategoryDTO();
                             	dto.setCategoryId((Long)row[0]);
                                 dto.setCategoryName((String) row[1]);
                                 categories.add(dto);
                             }
                             return null;
                         }
                     });

            // log exit
            Helper.logExit(LOGGER, signature, startTime, categories);

            return categories;
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
    public List<CategoryDTO> getContestTypes(final String catalog) throws CategoriesManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".getContestTypes(String)";
        Helper.logEntrance(LOGGER, signature, null, null);
        final long startTime = System.currentTimeMillis();

        try {
            checkStringNotNullAndNotEmpty("catalog", catalog);

            // This will hold the result to return:
            final List<CategoryDTO> categories = new ArrayList<CategoryDTO>();
            
            // This block should call this.getHibernateTemplate().execute(new
            // HibernateCallback() { ...}), the
            // anonymous HibernateCallback is defined as follows
            this.getHibernateTemplate().execute(
                    new HibernateCallback<Object>() {

                        /**
                         * <p>
                         * Do the hibernate process.
                         * </p>
                         * 
                         * @param session
                         *            the session
                         * @return null
                         * @throws HibernateException
                         *             if any error occurs
                         */
                        public Object doInHibernate(Session session)
                                throws HibernateException {

                            Query query = session.createQuery(SQL_QUERY_CONTEST_TYPES_WITH_CATEGORY);
                            query.setParameter("catalog", catalog);

                            // Execute the query:
                            List<Object[]> result = query.list();
                            for (Object[] row : result) {
                            	CategoryDTO dto = new CategoryDTO();
                                dto.setCategoryId((Long)row[0]);
                                dto.setCategoryName((String) row[1]);
                                categories.add(dto);
                            }
                            return null;
                        }
                    });
            
            
            // log exit
            Helper.logExit(LOGGER, signature, startTime, categories);

            return categories;
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
