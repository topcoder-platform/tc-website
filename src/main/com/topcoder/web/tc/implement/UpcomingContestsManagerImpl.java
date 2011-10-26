/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.implement;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.web.tc.ContestsServiceManagerException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.ServicesHelper;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.UpcomingContestsManager;
import com.topcoder.web.tc.dto.Filterable;
import com.topcoder.web.tc.dto.UpcomingContestDTO;
import com.topcoder.web.tc.dto.UpcomingContestsFilter;

/**
 * <p>
 * This is the default implementation of UpcomingContestsManager. It uses
 * Hibernate to perform the searching.
 * </p>
 * <p>
 * This class is not technically thread-safe because it's mutable. However, it
 * can be considered effectively thread-safe after configuration assuming that
 * the parameters passed in do not changed by other threads at the same time.
 * </p>
 * 
 * <p>
 * Changes in Version 1.1 : Updated {@link #transferMapToDTO(Map)} method to set contestId.
 * </p>
 *
 * @author flytoj2ee, duxiaoyang
 * @version 1.1
 */
public class UpcomingContestsManagerImpl extends AbstractManagerImpl implements
        UpcomingContestsManager {

    /**
     * Represents the base HQL statement used to search contests.
     */
    private static final String BASE_HQL = "SELECT pgc.name AS type, pc.name AS subtype,"
            + " (SELECT MAX(scheduledStartTime) FROM ProjectPhase WHERE phaseTypeId = 1 AND projectId = p.projectId) AS registrationStart,"
            + " (SELECT MAX(scheduledEndTime) FROM ProjectPhase WHERE phaseTypeId = 2 AND projectId = p.projectId) AS submissionEnd,"
            + " CONCAT(pi6.value, ' ', pi7.value) AS contestName, CAST(technology_list(pi1.value) AS string) AS technologies, CAST(pi36.value AS double) AS firstPrize,"
            + " CASE ps.projectStatusId WHEN 1 THEN 'Draft' WHEN 2 THEN 'Scheduled' ELSE ps.name END AS status,"
            + " (SELECT MAX(scheduledStartTime) FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) AS contestStartTime, p.projectId as contestId"
            + " FROM Project p, ProjectCategoryLookup pc, ProjectGroupCategoryLookup pgc, ProjectStatusLookup ps, ProjectCatalogLookup c,"
            + " ProjectInfo pi6, ProjectInfo pi7, ProjectInfo pi1, ProjectInfo pi36"
            + " WHERE p.projectStatusId IN (1, 2, 7) AND p.projectCategoryId NOT IN (27) AND (p.tcDirectProjectId IS NULL OR p.tcDirectProjectId NOT IN (840))"
            + " AND p.projectCategoryId = pc.projectCategoryId AND pc.projectGroupCategoryId = pgc.projectGroupCategoryId"
            + " AND pgc.projectCatalogId = c.projectCatalogId AND p.projectStatusId = ps.projectStatusId"
            + " AND p.projectId = pi6.projectId AND pi6.projectInfoTypeId = 6 AND LOWER(pi6.value) NOT LIKE '%delete%'"
            + " AND p.projectId = pi7.projectId AND pi7.projectInfoTypeId = 7 AND p.projectId = pi1.projectId AND pi1.projectInfoTypeId = 1"
            + " AND p.projectId = pi36.projectId AND pi36.projectInfoTypeId = 36"
            + " AND NOT EXISTS (SELECT 1 FROM ContestEligibility ce WHERE ce.studio = 0 AND ce.contestId = p.projectId)"
            + " AND (SELECT MAX(scheduledStartTime) FROM ProjectPhase WHERE phaseTypeId = 1 AND projectId = p.projectId) BETWEEN (TODAY - 1) AND (TODAY + 365)";

    /**
     * Represents the criteria used to filter contest name.
     */
    private static final String CONTEST_NAME_CRITERIA = " AND CONCAT(pi6.value, ' ', pi7.value) LIKE :contestName";

    /**
     * Represents the criteria used to filter start value of first prize.
     */
    private static final String PRIZE_START_CRITERIA = " AND CAST(pi36.value AS double) >= :prizeStart";

    /**
     * Represents the criteria used to filter end value of first prize.
     */
    private static final String PRIZE_END_CRITERIA = " AND CAST(pi36.value AS double) <= :prizeEnd";

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public UpcomingContestsManagerImpl() {
    }

    /**
     * <p>
     * Searches upcoming contests by given filtering condition with pagination
     * support.
     * </p>
     * 
     * @param columnName
     *            the name of the column to sort on. If it is null or empty, the
     *            sorting will based on registration start time.
     * @param sortingOrder
     *            the order of sorting. If it is null, descending order will be
     *            used.
     * @param pageNumber
     *            the number of page to retrieve. -1 means all page will be
     *            retrieved.
     * @param pageSize
     *            the number of records in each page. -1 means all records
     *            should be retrieved.
     * @param filter
     *            the filter used to make constraints on searching criteria.
     * @return a list of UpcomingContestDTO that matches given filter. It will
     *         be empty if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null, or either pageNumber or pageSize is zero
     *             or negative (-1 is acceptable).
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<UpcomingContestDTO> retrieveUpcomingContests(String columnName,
            SortingOrder sortingOrder, int pageNumber, int pageSize,
            UpcomingContestsFilter filter)
            throws ContestsServiceManagerException {
        String methodName = getClass().getName()
                + ".retrieveUpcomingContests(String, SortingOrder, int, int, UpcomingContestsFilter)";
        Log4jUtility.logEntrance(getLogger(), methodName, new String[] {
                "columnName", "sortingOrder", "pageNumber", "pageSize",
                "filter" }, new Object[] { columnName, sortingOrder,
                pageNumber, pageSize, filter });

        ServicesHelper.checkNumber(pageNumber, "pageNumber", methodName,
                getLogger());
        ServicesHelper.checkNumber(pageSize, "pageSize", methodName,
                getLogger());
        ServicesHelper.checkObject(filter, "filter", methodName, getLogger());

        List<UpcomingContestDTO> contests = new ArrayList<UpcomingContestDTO>();
        try {
            getHibernateTemplate().execute(
                    new RetrieveUpcomingContestsHibernateCallback(columnName,
                            sortingOrder, pageNumber, pageSize, filter,
                            contests));
        } catch (DataAccessException e) {
            throw ServicesHelper.logException(getLogger(), methodName,
                    new ContestsServiceManagerException(
                            "error occurs while retrieving upcoming contests",
                            e));
        }

        Log4jUtility
                .logExit(getLogger(), methodName, new Object[] { contests });
        return contests;
    }

    /**
     * <p>
     * Searches upcoming contests by given filtering condition.
     * </p>
     * 
     * @param filter
     *            the filter used to make constraints on searching criteria.
     * @return a list of UpcomingContestDTO that matches given filter. It will
     *         be empty if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null.
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<UpcomingContestDTO> retrieveUpcomingContests(
            UpcomingContestsFilter filter)
            throws ContestsServiceManagerException {
        String methodName = getClass().getName()
                + ".retrieveUpcomingContests(UpcomingContestsFilter)";
        Log4jUtility.logEntrance(getLogger(), methodName,
                new String[] { "filter" }, new Object[] { filter });

        ServicesHelper.checkObject(filter, "filter", methodName, getLogger());

        List<UpcomingContestDTO> result = null;
        try {
            result = retrieveUpcomingContests(null, null,
                    Filterable.RETURN_ALL_PAGES, Filterable.RETURN_ALL_PAGES,
                    filter);
        } catch (ContestsServiceManagerException e) {
            throw ServicesHelper.logException(getLogger(), methodName, e);
        }

        Log4jUtility.logExit(getLogger(), methodName, new Object[] { result });
        return result;
    }

    /**
     * <p>
     * This class implements the HibernateCallback interface to perform query
     * for searching upcoming contests.
     * </p>
     * <p>
     * This class is thread-safe because all its properties are not changed
     * after initialization.
     * </p>
     * 
     * @author TCSDEVELOPER
     * @version 1.0
     */
    private class RetrieveUpcomingContestsHibernateCallback implements
            HibernateCallback<Object> {

        /**
         * Represents millisecond in a day.
         */
        private static final long MILLISECOND_IN_A_DAY = 24 * 60 * 60 * 1000;

        /**
         * Represents the column name on which the sorting is performed.
         */
        private String columnName;

        /**
         * Represents the sorting order.
         */
        private SortingOrder sortingOrder;

        /**
         * Represents the number of page to be retrieved.
         */
        private int pageNumber;

        /**
         * Represents the number of records in each page.
         */
        private int pageSize;

        /**
         * Represents the filter used to make constraints on searching result.
         */
        private UpcomingContestsFilter filter;

        /**
         * Represents a list of UpcomingContestDTO to store the searching
         * result.
         */
        private List<UpcomingContestDTO> contests;

        /**
         * <p>
         * Creates an instance of this class using given parameters.
         * </p>
         * 
         * @param columnName
         *            the column name on which sorting is performed.
         * @param sortingOrder
         *            the sorting order.
         * @param pageNumber
         *            the number of page to be retrieved.
         * @param pageSize
         *            the number of records in each page.
         * @param filter
         *            the filter used to make constraints on searching result.
         * @param contests
         *            a list of UpcomingContestDTO to store the searching
         *            result.
         */
        public RetrieveUpcomingContestsHibernateCallback(String columnName,
                SortingOrder sortingOrder, int pageNumber, int pageSize,
                UpcomingContestsFilter filter, List<UpcomingContestDTO> contests) {
            this.columnName = columnName;
            this.sortingOrder = sortingOrder;
            this.pageNumber = pageNumber;
            this.pageSize = pageSize;
            this.filter = filter;
            this.contests = contests;
        }

        /**
         * <p>
         * Performing searching using Hibernate.
         * </p>
         * 
         * @param session
         *            the Hibernate session.
         * @return Object always return null.
         * @throws HibernateException
         *             if any error occurs while performing searching.
         */
        public Object doInHibernate(Session session) throws HibernateException {
            // construct the HQL statement
            StringBuilder hql = new StringBuilder(BASE_HQL);
            hql.append(getCommonFilterClause(filter));
            if (filter.getContestName() != null
                    && filter.getContestName().trim().length() != 0) {
                hql.append(CONTEST_NAME_CRITERIA);
            }
            if (filter.getPrizeStart() != null
                    && filter.getPrizeStart() != Filterable.OPEN_INTERVAL) {
                hql.append(PRIZE_START_CRITERIA);
            }
            if (filter.getPrizeEnd() != null
                    && filter.getPrizeEnd() != Filterable.OPEN_INTERVAL) {
                hql.append(PRIZE_END_CRITERIA);
            }
            hql.append(getSortingClause(columnName, sortingOrder));

            // construct the Query object
            Query query = session.createQuery(hql.toString());
            setCommonFilterCondition(query, filter);
            if (filter.getContestName() != null
                    && filter.getContestName().trim().length() != 0) {
                query.setString("contestName", "%" + filter.getContestName()
                        + "%");
            }
            if (filter.getPrizeStart() != null
                    && filter.getPrizeStart() != Filterable.OPEN_INTERVAL) {
                query.setInteger("prizeStart", filter.getPrizeStart());
            }
            if (filter.getPrizeEnd() != null
                    && filter.getPrizeEnd() != Filterable.OPEN_INTERVAL) {
                query.setInteger("prizeEnd", filter.getPrizeEnd());
            }

            // pagination support
            if (pageNumber != Filterable.RETURN_ALL_PAGES
                    && pageSize != Filterable.RETURN_ALL_PAGES) {
                query.setMaxResults(pageSize);
                query.setFirstResult((pageNumber - 1) * pageSize);
            }

            // perform the query, and fill the result into the given list
            @SuppressWarnings("unchecked")
            List<Object[]> result = query.list();
            for (Object[] row : result) {
                UpcomingContestDTO dto = new UpcomingContestDTO();
                dto.setType((String) row[0]);
                dto.setSubtype((String) row[1]);
                dto.setRegisterDate(Helper.getEDTTime((Date) row[2]));
                dto.setSubmitDate(Helper.getEDTTime((Date) row[3]));
                dto.setDuration((int) ((dto.getSubmitDate().getTime() - dto
                        .getRegisterDate().getTime()) / MILLISECOND_IN_A_DAY));
                dto.setContestName((String) row[4]);
                dto.setTechnologies((String) row[5]);
                dto.setFirstPrize((Double) row[6]);
                dto.setStatus((String) row[7]);
                dto.setContestId((Long)row[9]); 
                contests.add(dto);
            }
            return null;
        }
    }
}
