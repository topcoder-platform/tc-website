/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.implement;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.topcoder.commons.utils.Log4jUtility;
import com.topcoder.web.tc.ContestsServiceManagerException;
import com.topcoder.web.tc.ServicesHelper;
import com.topcoder.web.tc.SearchContestsManager;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.ContestDTO;
import com.topcoder.web.tc.dto.ContestsFilter;
import com.topcoder.web.tc.dto.Filterable;

/**
 * <p>
 * This is the default implementation of SearchContestsManager. It uses
 * Hibernate to perform the searching.
 * </p>
 * <p>
 * This class is not technically thread-safe because it's mutable. However, it
 * can be considered effectively thread-safe after configuration assuming that
 * the parameters passed in do not changed by other threads at the same time.
 * </p>
 * 
 * <p>
 * Version 1.1 change notes:
 * <ul>
 * <li>Updated {@link #transferMapToDTO(Map)} method to set contestId.</li>
 * <li>Updated {@link #BASE_HQL} to get the contest status.</li>
 * </ul>
 * </p>
 *
 * @author flytoj2ee, duxiaoyang
 * @version 1.1
 */
public class SearchContestsManagerImpl extends AbstractManagerImpl implements
        SearchContestsManager {

    /**
     * Represents the base HQL statement used to search contests.
     */
    private static final String BASE_HQL = "SELECT pgc.name AS type, pc.name AS subtype, pi.value AS contestName, c.name AS catalog,"
            + " (SELECT COUNT(*) FROM Resource r WHERE r.projectId = p.projectId AND resourceRoleId = 1) AS numberOfRegistrants,"
            + " (SELECT COUNT(*) FROM Submission s, Upload u WHERE s.uploadId = u.uploadId AND u.projectId = p.projectId"
            + " AND s.submissionTypeId = 1 AND s.submissionStatusId IN (1, 2, 3, 4)) AS numberOfSubmissions,"
            + " (SELECT COUNT(*) FROM Submission s, Upload u WHERE s.uploadId = u.uploadId AND u.projectId = p.projectId"
            + " AND s.submissionTypeId = 1 AND s.submissionStatusId IN (1, 2, 3, 4) AND s.screeningScore >= 75) AS passedScreeningCount,"
            + " wpi.value AS winnerProfileLink, pr.finalScore AS winnerScore,"
            + " (SELECT MAX(scheduledStartTime) FROM ProjectPhase WHERE projectId = p.projectId AND phaseTypeId = 1) AS contestStartTime, p.projectId as contestId,"
            + " CASE p.projectStatusId"
            + " WHEN 1 THEN"
            + "   CASE"
            + "     WHEN (SELECT CASE WHEN actualStartTime is NULL THEN scheduledStartTime ELSE actualStartTime END FROM ProjectPhase WHERE phaseTypeId = 1 AND projectId = p.projectId) < TODAY THEN 'Active'"
            + "     ELSE 'Scheduled'"
            + "   END"
            + " WHEN 2 THEN 'Draft' ELSE 'Completed' END AS status"
            + " FROM Project p, ProjectCategoryLookup pc, ProjectGroupCategoryLookup pgc, ProjectCatalogLookup c,"
            + " ProjectInfo pi, ProjectResult pr, ProjectInfo wpi"
            + " WHERE NOT EXISTS (SELECT 1 FROM ContestEligibility ce WHERE ce.studio = 0 AND ce.contestId = p.projectId)"
            + " AND p.projectStatusId IN (1, 2, 7) AND p.projectCategoryId NOT IN (27) AND (p.tcDirectProjectId IS NULL OR p.tcDirectProjectId NOT IN (840))"
            + " AND p.projectCategoryId = pc.projectCategoryId AND pc.projectGroupCategoryId = pgc.projectGroupCategoryId"
            + " AND pgc.projectCatalogId = c.projectCatalogId"
            + " AND p.projectId = pi.projectId AND pi.projectInfoTypeId = 6"
            + " AND pr.projectId = p.projectId AND pr.placed = 1"
            + " AND wpi.projectId = p.projectId AND wpi.projectInfoTypeId = 23";

    /**
     * Represents the criteria used to filter contest name.
     */
    private static final String CONTEST_NAME_CRITERIA = " AND pi.value LIKE :contestName";

    /**
     * Represents the criteria used to filter contest end date before a specific
     * date.
     */
    private static final String CONTEST_END_DATE_BEFORE_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) < :contestEnd";

    /**
     * Represents the criteria used to filter contest end date after a specific
     * date.
     */
    private static final String CONTEST_END_DATE_AFTER_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) > :contestEnd";

    /**
     * Represents the criteria used to filter contest end date on a specific
     * date.
     */
    private static final String CONTEST_END_DATE_ON_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) = :contestEnd";

    /**
     * Represents the criteria used to filter contest end date between two
     * specific dates.
     */
    private static final String CONTEST_END_DATE_BETWEEN_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) BETWEEN :contestEnd1 AND :contestEnd2";

    /**
     * Represents the criteria used to filter contest end date before current
     * date.
     */
    private static final String CONTEST_END_DATE_BEFORE_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) < CURRENT";

    /**
     * Represents the criteria used to filter contest end date after current
     * date.
     */
    private static final String CONTEST_END_DATE_AFTER_CURRENT_CRITERIA = " AND (SELECT MAX(scheduledEndTime) FROM ProjectPhase"
            + " WHERE projectId = p.projectId AND phaseTypeId = 11) > CURRENT";

    /**
     * Represents the criteria used to filter winner handle.
     */
    private static final String WINNER_HANDLE_CRITERIA = " AND wpi.value LIKE :winnerHandle";

    /**
     * Represents the winner profile link prefix.
     */
    private static final String WINNER_PROFILE_LINK_PREFIX = "http://www.topcoder.com/tc?module=MemberProfile&cr=";

    /**
     * <p>
     * Creates an instance of this class. It does nothing.
     * </p>
     */
    public SearchContestsManagerImpl() {
    }

    /**
     * <p>
     * Searches contests by given contest name condition with pagination
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
     * @param name
     *            the name of the contests to search.
     * @return a list of ContestDTO that matches given name. It will be empty if
     *         no such contest can be found.
     * @throws IllegalArgumentException
     *             if name is null or empty, or either pageNumber or pageSize is
     *             zero or negative (-1 is acceptable).
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<ContestDTO> searchContests(String columnName,
            SortingOrder sortingOrder, int pageNumber, int pageSize, String name)
            throws ContestsServiceManagerException {
        String methodName = getClass().getName()
                + ".searchContests(String, SortingOrder, int, int, String)";
        Log4jUtility.logEntrance(getLogger(), methodName,
                new String[] { "columnName", "sortingOrder", "pageNumber",
                        "pageSize", "name" }, new Object[] { columnName,
                        sortingOrder, pageNumber, pageSize, name });

        ServicesHelper.checkNumber(pageNumber, "pageNumber", methodName,
                getLogger());
        ServicesHelper.checkNumber(pageSize, "pageSize", methodName,
                getLogger());
        ServicesHelper.checkString(name, "name", methodName, getLogger());

        ContestsFilter filter = new ContestsFilter();
        filter.setContestName(name);

        List<ContestDTO> result = null;
        try {
            result = searchContests(columnName, sortingOrder, pageNumber,
                    pageSize, filter);
        } catch (ContestsServiceManagerException e) {
            throw ServicesHelper.logException(getLogger(), methodName, e);
        }

        Log4jUtility.logExit(getLogger(), methodName, new Object[] { result });
        return result;
    }

    /**
     * <p>
     * Searches contests by given contest name condition.
     * </p>
     * 
     * @param name
     *            the name of the contests to search.
     * @return a list of ContestDTO that matches given name. It will be empty if
     *         no such contest can be found.
     * @throws IllegalArgumentException
     *             if name is null or empty.
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<ContestDTO> searchContests(String name)
            throws ContestsServiceManagerException {
        String methodName = getClass().getName() + ".searchContests(String)";
        Log4jUtility.logEntrance(getLogger(), methodName,
                new String[] { "name" }, new Object[] { name });

        ServicesHelper.checkString(name, "name", methodName, getLogger());

        ContestsFilter filter = new ContestsFilter();
        filter.setContestName(name);

        List<ContestDTO> result = null;
        try {
            result = searchContests(filter);
        } catch (ContestsServiceManagerException e) {
            throw ServicesHelper.logException(getLogger(), methodName, e);
        }

        Log4jUtility.logExit(getLogger(), methodName, new Object[] { result });
        return result;
    }

    /**
     * <p>
     * Searches contests by given filtering condition with pagination support.
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
     * @return a list of ContestDTO that matches given filter. It will be empty
     *         if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null, or either pageNumber or pageSize is zero
     *             or negative (-1 is acceptable).
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<ContestDTO> searchContests(String columnName,
            SortingOrder sortingOrder, int pageNumber, int pageSize,
            ContestsFilter filter) throws ContestsServiceManagerException {
        String methodName = getClass().getName()
                + ".searchContests(String, SortingOrder, int, int, ContestsFilter)";
        Log4jUtility.logEntrance(getLogger(), methodName, new String[] {
                "columnName", "sortingOrder", "pageNumber", "pageSize",
                "filter" }, new Object[] { columnName, sortingOrder,
                pageNumber, pageSize, filter });

        ServicesHelper.checkNumber(pageNumber, "pageNumber", methodName,
                getLogger());
        ServicesHelper.checkNumber(pageSize, "pageSize", methodName,
                getLogger());
        ServicesHelper.checkObject(filter, "filter", methodName, getLogger());

        List<ContestDTO> contests = new ArrayList<ContestDTO>();
        try {
            getHibernateTemplate().execute(
                    new SearchContestsHibernateCallback(columnName,
                            sortingOrder, pageNumber, pageSize, filter,
                            contests));
        } catch (DataAccessException e) {
            throw ServicesHelper.logException(getLogger(), methodName,
                    new ContestsServiceManagerException(
                            "Error occurs while searching contests.", e));
        }

        Log4jUtility
                .logExit(getLogger(), methodName, new Object[] { contests });
        return contests;
    }

    /**
     * <p>
     * Searches contests by given filtering condition.
     * </p>
     * 
     * @param filter
     *            the filter used to make constraints on searching criteria.
     * @return a list of ContestDTO that matches given filter. It will be empty
     *         if no such contest can be found.
     * @throws IllegalArgumentException
     *             if filter is null.
     * @throws ContestsServiceManagerException
     *             is any error occurs while performing the search.
     */
    public List<ContestDTO> searchContests(ContestsFilter filter)
            throws ContestsServiceManagerException {
        String methodName = getClass().getName()
                + ".searchContests(ContestsFilter)";
        Log4jUtility.logEntrance(getLogger(), methodName,
                new String[] { "filter" }, new Object[] { filter });

        ServicesHelper.checkObject(filter, "filter", methodName, getLogger());

        List<ContestDTO> result = null;
        try {
            result = searchContests(null, null, Filterable.RETURN_ALL_PAGES,
                    Filterable.RETURN_ALL_PAGES, filter);
        } catch (ContestsServiceManagerException e) {
            throw ServicesHelper.logException(getLogger(), methodName, e);
        }

        Log4jUtility.logExit(getLogger(), methodName, new Object[] { result });
        return result;
    }

    /**
     * <p>
     * This class implements the HibernateCallback interface to perform query
     * for searching contests.
     * </p>
     * <p>
     * This class is thread-safe because all its properties are not changed
     * after initialization.
     * </p>
     * 
     * @author TCSDEVELOPER
     * @version 1.0
     */
    private class SearchContestsHibernateCallback implements
            HibernateCallback<Object> {

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
        private ContestsFilter filter;

        /**
         * Represents a list of ContestDTO to store the searching result.
         */
        private List<ContestDTO> contests;

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
         *            a list of ContestDTO to store the searching result.
         */
        public SearchContestsHibernateCallback(String columnName,
                SortingOrder sortingOrder, int pageNumber, int pageSize,
                ContestsFilter filter, List<ContestDTO> contests) {
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
            if (filter.getContestFinalization() != null) {
                switch (filter.getContestFinalization().getIntervalType()) {
                case BEFORE:
                    hql.append(CONTEST_END_DATE_BEFORE_CRITERIA);
                    break;
                case AFTER:
                    hql.append(CONTEST_END_DATE_AFTER_CRITERIA);
                    break;
                case ON:
                    hql.append(CONTEST_END_DATE_ON_CRITERIA);
                    break;
                case BETWEEN_DATES:
                    hql.append(CONTEST_END_DATE_BETWEEN_CRITERIA);
                    break;
                case BEFORE_CURRENT_DATE:
                    hql.append(CONTEST_END_DATE_BEFORE_CURRENT_CRITERIA);
                    break;
                case AFTER_CURRENT_DATE:
                    hql.append(CONTEST_END_DATE_AFTER_CURRENT_CRITERIA);
                    break;
                }
            }
            if (filter.getWinnerHandle() != null) {
                hql.append(WINNER_HANDLE_CRITERIA);
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
            if (filter.getContestFinalization() != null) {
                switch (filter.getContestFinalization().getIntervalType()) {
                case BEFORE:
                case AFTER:
                case ON:
                    query.setDate("contestEnd", filter.getContestFinalization()
                            .getFirstDate());
                    break;
                case BETWEEN_DATES:
                    query.setDate("contestEnd1", filter
                            .getContestFinalization().getFirstDate());
                    query.setDate("contestEnd2", filter
                            .getContestFinalization().getSecondDate());
                    break;
                }
            }
            if (filter.getWinnerHandle() != null) {
                query.setString("winnerHandle", "%" + filter.getWinnerHandle()
                        + "%");
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
                ContestDTO dto = new ContestDTO();
                dto.setType((String) row[0]);
                dto.setSubtype((String) row[1]);
                dto.setContestName((String) row[2]);
                dto.setCatalog((String) row[3]);
                dto.setNumberOfRegistrants(((Long) row[4]).intValue());
                dto.setNumberOfSubmissions(((Long) row[5]).intValue());
                dto.setPassedScreeningCount(((Long) row[6]).intValue());
                dto.setWinnerProfileLink(WINNER_PROFILE_LINK_PREFIX
                        + (String) row[7]);
                dto.setWinnerScore((Double) row[8]);
                dto.setContestId((Long) row[10]);
                dto.setStatus((String) row[11]);
                contests.add(dto);
            }
            return null;
        }
    }
}
