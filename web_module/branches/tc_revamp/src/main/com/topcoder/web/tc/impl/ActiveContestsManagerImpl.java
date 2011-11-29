/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.topcoder.web.tc.ActiveContestsManager;
import com.topcoder.web.tc.ActiveContestsManagerException;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.dto.ActiveContestDTO;
import com.topcoder.web.tc.dto.ActiveContestFilter;
import com.topcoder.web.tc.dto.BaseFilter;

/**
 * <p>
 * This is the default implementation of ActiveContestsManager. It extends HibernateDaoSupport to execute HQL
 * query to get the data.
 * </p>
 * <p>
 * Thread Safety: This class is not technically thread-safe because it's mutable. However, it can be
 * considered effectively thread-safe after configuration assuming that it's not changed after configuration
 * and the passed in parameters are not changed by other threads at the same time because it holds no mutable
 * state under such assumptions.
 * </p>
 * <p>
 * <b>Usage:</b>
 *
 * <pre>
 * // Get the ActiveContestsManager from Spring
 * ActiveContestsManager manager = (ActiveContestsManager) applicationContext
 *                 .getBean(&quot;activeContestsManagerBean&quot;);
 *
 * // Create a new ActiveContestFilter
 * ActiveContestFilter filter = new ActiveContestFilter();
 *
 * // The filtered contests' name should start with &quot;TC Refactoring&quot;
 * filter.setContestName(&quot;TC Refactoring&quot;);
 * // The lower bound of the prize is -infinite
 * filter.setPrizeLowerBound(Filterable.OPEN_INTERVAL);
 * // The upper bound of the prize is 1000
 * filter.setPrizeUpperBound(1000);
 *
 * // This call retrieves all active contests whose name starts with &quot;TC Refactoring&quot; and prize &lt;= 1000
 * // sorted in ascending order by &quot;contestName&quot; property. The page size is 10 and only the 2nd page
 * // should be returned.
 * List&lt;ActiveContestDTO&gt; activeContests = manager.retrieveActiveContests(&quot;projectCategory.name&quot;,
 *     SortingOrder.ASCENDING, 2, 10, filter);
 * </pre>
 *
 * </p>
 *
 * <p>
 * Changes in Version 1.1 : Updated {@link #transferMapToDTO(Map)} method to set contestId.
 * </p>
 *
 * <p>
 * Changes in Version 1.2 : Removed subType in SQL and DTO.
 * </p>
 *
 * @author mekanizumu, pinoydream
 * @version 1.2
 */
public class ActiveContestsManagerImpl extends HibernateDaoSupport implements ActiveContestsManager {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = ActiveContestsManagerImpl.class.getName();

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY = "SELECT DISTINCT new map(project.projectId as contestId, projectCategory.name as type,"
        + " projectCatalog.name as catalog, projectNameInfo.value as contestName,"
        + " (select count(*) from Submission s, Upload u where u.projectId=project.projectId"
        + " and u.uploadId=s.uploadId and s.submissionTypeId=:contestSubmissionTypeId"
        + " and s.submissionStatusId in (:activeSubmissionStatusId, :failedScreeningSubmissionStatusId,"
        + " :failedReviewSubmissionStatusId, :completedWithoutWinSubmissionStatusId)) as numberOfSubmissions,"
        // get the number of submissions
        + " (select count(*) from r2 where r2.projectId=project.projectId and"
        + " r2.resourceRoleId=:submitterRoleId) as numberOfRegistrants,"
        // gets the number of registrants
        + " registrationPhase.scheduledEndTime as registrationEndDate,"
        + " submissionPhase.scheduledEndTime as submissionEndDate, firstPrizeInfo.value as firstPrize,"
        + " reliabilityBonusInfo.value as reliabilityBonus, digitalRunInfo.value as digitalRunPoints,"
        + " digitalRunFlagInfo.value as digitalRunFlag, paymentsInfo.value as payments) from Project project,"
        + " ProjectCategoryLookup projectCategory,"
        + " ProjectCatalogLookup projectCatalog, ProjectInfo projectNameInfo,"
        // +" Upload as u, Submission s,"
        + " Resource r2, ProjectPhase registrationPhase, ProjectPhase submissionPhase,"
        + " ProjectPhase finalReviewPhase, ProjectInfo firstPrizeInfo, ProjectInfo reliabilityBonusInfo,"
        + " ProjectInfo digitalRunInfo, ProjectInfo paymentsInfo, ProjectInfo digitalRunFlagInfo"
        + " where project.projectStatusId=:activeStatusId"
        // this condition means only active projects are returned.
        + " and project.projectCategoryId=projectCategory.projectCategoryId"
        // catalog id
        + " and projectCategory.projectCatalogId=projectCatalog.projectCatalogId"
        // this join is for type
        + " and projectNameInfo.projectId=project.projectId"
        + " and projectNameInfo.projectInfoTypeId=:projectNameInfoId"
        // and u.projectId=project.projectId"
        // this join is for getting the contest name
        + " and registrationPhase.projectId=project.projectId"
        + " and registrationPhase.phaseTypeId=:registrationPhaseTypeId"
        // this join is for getting the registration end date
        + " and submissionPhase.projectId=project.projectId"
        + " and submissionPhase.phaseTypeId=:submissionPhaseTypeId"
        // this join is for getting the submission end date
        + " and finalReviewPhase.projectId=project.projectId"
        // this join is for getting the final review phase
        + " and firstPrizeInfo.projectId=project.projectId"
        + " and firstPrizeInfo.projectInfoTypeId=:firstPlaceCostInfoId"
        // this join is for getting the winner prize
        + " and reliabilityBonusInfo.projectId=project.projectId"
        + " and reliabilityBonusInfo.projectInfoTypeId=:reliabilityBonusCostInfoId"
        // this join is for getting the reliability bonus
        + " and digitalRunInfo.projectId=project.projectId"
        + " and digitalRunInfo.projectInfoTypeId=:digitalRunPointInfoId"
        // this join is for getting the digital run points
        + " and paymentsInfo.projectId=project.projectId and paymentsInfo.projectInfoTypeId=:paymentsInfoId"
        // this join is for getting the payments
        + " and digitalRunFlagInfo.projectId=project.projectId"
        + " and digitalRunFlagInfo.projectInfoTypeId=:digitalRunFlagInfoId"
        // this join is for getting the flag denoting whether DR is on or not
        + " and (submissionPhase.phaseStatusId=:openPhaseStatusId"
        + " or registrationPhase.phaseStatusId=:openPhaseStatusId)"
        // these two means only active contests are returned
        + " and not exists (from ContestEligibility contestEligibility where contestEligibility.studio=1"
        + " and contestEligibility.contestId=project.projectId)"; // this filters out the studio contests

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be that constant value It is final
     * and won't change once it is initialized as part of variable declaration to:
     * Logger.getLogger(ActiveContestsManagerImpl.class). It is used throughout the class wherever logging is
     * needed.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(ActiveContestsManagerImpl.class);

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Project Name'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setProjectNameInfoId(), retrieveActiveContests(). Its value legality is checked in checkConfiguration()
     * method.
     * </p>
     */
    private long projectNameInfoId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Registration'. It is set through setter and doesn't have
     * a getter. It must be non-negative. (Note that the above statement applies only after the setter has
     * been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setRegistrationPhaseTypeId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long registrationPhaseTypeId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Submission'. It is set through setter and doesn't have a
     * getter. It must be non-negative. (Note that the above statement applies only after the setter has been
     * called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setSubmissionPhaseTypeId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long submissionPhaseTypeId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'First Place Cost'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setFirstPlaceCostInfoId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long firstPlaceCostInfoId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Payments'. It is set through setter and doesn't
     * have a getter. It must be non-negative. (Note that the above statement applies only after the setter
     * has been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setPaymentsInfoId(), retrieveActiveContests(). Its value legality is checked in checkConfiguration()
     * method.
     * </p>
     */
    private long paymentsInfoId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Digital Run Flag'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setDigitalRunFlagInfoId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long digitalRunFlagInfoId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Reliability Bonus Cost'. It is set through setter
     * and doesn't have a getter. It must be non-negative. (Note that the above statement applies only after
     * the setter has been called as part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when the instance is created. It is
     * used in setReliabilityBonusCostInfoId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long reliabilityBonusCostInfoId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'DR points'. It is set through setter and doesn't
     * have a getter. It must be non-negative. (Note that the above statement applies only after the setter
     * has been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setDigitalRunPointInfoId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long digitalRunPointInfoId;

    /**
     * <p>
     * The id of the project_status_lu row that has name 'Active'. It is set through setter and doesn't have a
     * getter. It must be non-negative. (Note that the above statement applies only after the setter has been
     * called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setActiveStatusId(), retrieveActiveContests(). Its value legality is checked in checkConfiguration()
     * method.
     * </p>
     */
    private long activeStatusId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Final Review'. It is set through setter and doesn't have
     * a getter. It must be non-negative. (Note that the above statement applies only after the setter has
     * been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setFinalReviewPhaseTypeId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long finalReviewPhaseTypeId;

    /**
     * <p>
     * The id of the phase_status_lu row that has name 'Open'. It is set through setter and doesn't have a
     * getter. It must be non-negative. (Note that the above statement applies only after the setter has been
     * called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setOpenPhaseStatusId(), retrieveActiveContests(). Its value legality is checked in checkConfiguration()
     * method.
     * </p>
     */
    private long openPhaseStatusId;

    /**
     * <p>
     * The id of the resource_role_lu row that has name 'Submitter'. It is set through setter and doesn't have
     * a getter. It must be non-negative. (Note that the above statement applies only after the setter has
     * been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setSubmitterRoleId(), retrieveActiveContests(). Its value legality is checked in checkConfiguration()
     * method.
     * </p>
     */
    private long submitterRoleId;

    /**
     * <p>
     * The id of the submission_type_lu row that has name 'Contest Submission'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setContestSubmissionTypeId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long contestSubmissionTypeId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Active'. It is set through setter and doesn't
     * have a getter. It must be non-negative. (Note that the above statement applies only after the setter
     * has been called as part of the IoC initialization. This field's value has no restriction before the IoC
     * initialization) It does not need to be initialized when the instance is created. It is used in
     * setActiveSubmissionStatusId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long activeSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Failed Screening'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setFailedScreeningSubmissionStatusId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long failedScreeningSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Failed Review'. It is set through setter and
     * doesn't have a getter. It must be non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's value has no restriction before
     * the IoC initialization) It does not need to be initialized when the instance is created. It is used in
     * setFailedReviewSubmissionStatusId(), retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long failedReviewSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Completed Without Win'. It is set through setter
     * and doesn't have a getter. It must be non-negative. (Note that the above statement applies only after
     * the setter has been called as part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when the instance is created. It is
     * used in retrieveActiveContests(), setCompletedWithoutWinSubmissionStatusId(). Its value legality is
     * checked in checkConfiguration() method.
     * </p>
     */
    private long completedWithoutWinSubmissionStatusId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public ActiveContestsManagerImpl() {
        // Empty
    }

    /**
     * <p>
     * Retrieve active contests by given filtering conditions with pagination support.
     * </p>
     *
     * @param sortingOrder
     *            the sorting order. If it's null, natural order will be used.
     * @param pageSize
     *            the page size.
     * @param pageNumber
     *            the page number.
     * @param columnName
     *            the name of the ActiveContestDTO column to sort on. If it's null or empty, natural order
     *            will be used.
     * @param filter
     *            the filtering condition. If all its properties are null or empty, all results will be
     *            returned.
     * @return matched active contests. It won't be null but could be empty
     * @throws IllegalArgumentException
     *             if pageNumber is not positive, or not value -1 that used as the flag for returning all
     *             values, or not have the values of the constants of Filterable, or pageSize is not positive,
     *             or not have the values of the constants of Filterable, or filter is null
     * @throws ActiveContestsManagerException
     *             if any error occurs
     */
    public List<ActiveContestDTO> retrieveActiveContests(final String columnName,
                    final SortingOrder sortingOrder, final int pageNumber, final int pageSize,
                    final ActiveContestFilter filter) throws ActiveContestsManagerException {
        // Log the entry
        final String signature = CLASS_NAME
            + ".retrieveActiveContests(String, SortingOrder, int, int, ActiveContestFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] {"columnName", "sortingOrder", "pageNumber",
            "pageSize", "filter"}, new Object[] {columnName, sortingOrder, pageNumber, pageSize, filter});
        final long startTime = System.currentTimeMillis();

        try {
            // check parameter
            Helper.checkPageNumberAndSize("pageNumber", pageNumber);
            Helper.checkPageNumberAndSize("pageSize", pageSize);
            Helper.checkNotNull("filter", filter);

            // This will hold the result to return:
            final List<ActiveContestDTO> activeContests = new ArrayList<ActiveContestDTO>();
            // This block should call this.getHibernateTemplate().execute(new HibernateCallback() { ...}), the
            // anonymous HibernateCallback is defined as follows
            this.getHibernateTemplate().execute(new HibernateCallback<Object>() {

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
                @SuppressWarnings("unchecked")
                public Object doInHibernate(Session session) throws HibernateException {
                    // Create the sql
                    String sql = SQL_QUERY + Helper.addFilterForSQL(filter, "ActiveContest");

                    // Add order
                    sql += Helper.addOrderForSQL(columnName, sortingOrder);

                    Query query = session.createQuery(sql);
                    // set the parameters of the HQL according to CS 1.3.2
                    setQueryParameters(query, filter);

                    // Add flag for prizeLowerBound
                    boolean prizeLowerBoundFlag = false;
                    if (filter.getPrizeLowerBound() != null && filter.getPrizeLowerBound() != -1) {
                        prizeLowerBoundFlag = true;
                    }

                    // Add flag for prizeUpperBound
                    boolean prizeUpperBoundFlag = false;
                    if (filter.getPrizeUpperBound() != null && filter.getPrizeUpperBound() != -1) {
                        prizeUpperBoundFlag = true;
                    }

                    // Set the page size and number
                    if (!prizeLowerBoundFlag && !prizeUpperBoundFlag) {
                        Helper.setPageForQuery(query, pageNumber, pageSize);
                    }

                    // Execute the query:
                    List<Object> result = query.list();
                    List<ActiveContestDTO> tempActiveContestDTO = new ArrayList<ActiveContestDTO>();

                    for (Object res : result) {
                        @SuppressWarnings("rawtypes")
                        Map mapRes = (Map) res;
                        String firstPrize = (String) mapRes.get("firstPrize");
                        // Add filter for prizeLowerBound
                        if (prizeLowerBoundFlag
                            && (firstPrize == null || new Double(firstPrize) < filter.getPrizeLowerBound())) {
                            continue;
                        }
                        // Add filter for prizeUpperBound
                        if (prizeUpperBoundFlag
                            && (firstPrize == null || new Double(firstPrize) > filter.getPrizeUpperBound())) {
                            continue;
                        }
                        tempActiveContestDTO.add(transferMapToDTO(mapRes));
                    }

                    // Get the correct page for prize filter
                    if ((prizeLowerBoundFlag || prizeUpperBoundFlag) && pageNumber > 0 && pageSize > 0) {
                        tempActiveContestDTO = Helper.getPageForPrize(pageNumber, pageSize,
                            tempActiveContestDTO);
                    }

                    activeContests.addAll(tempActiveContestDTO);
                    return null;
                }
            });

            // log exit
            Helper.logExit(LOGGER, signature, startTime, activeContests);

            return activeContests;
        } catch (IllegalArgumentException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER, new ActiveContestsManagerException(
                "DataAccessException occurs while executing", e), signature);
        }
    }

    /**
     * <p>
     * Set the query parameters.
     * </p>
     *
     * @param query
     *            the query
     * @param filter
     *            the filter
     */
    private void setQueryParameters(Query query, BaseFilter filter) {
        query.setParameter("activeStatusId", activeStatusId);
        query.setParameter("projectNameInfoId", projectNameInfoId);
        query.setParameter("contestSubmissionTypeId", contestSubmissionTypeId);
        query.setParameter("activeSubmissionStatusId", activeSubmissionStatusId);
        query.setParameter("failedScreeningSubmissionStatusId", failedScreeningSubmissionStatusId);
        query.setParameter("failedReviewSubmissionStatusId", failedReviewSubmissionStatusId);
        query.setParameter("completedWithoutWinSubmissionStatusId", completedWithoutWinSubmissionStatusId);
        query.setParameter("submitterRoleId", submitterRoleId);
        query.setParameter("registrationPhaseTypeId", registrationPhaseTypeId);
        query.setParameter("submissionPhaseTypeId", submissionPhaseTypeId);
        query.setParameter("firstPlaceCostInfoId", firstPlaceCostInfoId);
        query.setParameter("reliabilityBonusCostInfoId", reliabilityBonusCostInfoId);
        query.setParameter("digitalRunPointInfoId", digitalRunPointInfoId);
        query.setParameter("paymentsInfoId", paymentsInfoId);
        query.setParameter("digitalRunFlagInfoId", digitalRunFlagInfoId);
        query.setParameter("openPhaseStatusId", openPhaseStatusId);
        if (filter.getContestFinalizationDate() != null) {
            query.setParameter("finalReviewPhaseTypeId", finalReviewPhaseTypeId);
        }
    }

    /**
     * <p>
     * Transfer the Map to ActiveContestDTO.
     * </p>
     *
     * @param map
     *            the map
     * @return the ActiveContestDTO instance
     * @throws HibernateException
     *             if any error occurs
     */
    private static ActiveContestDTO transferMapToDTO(Map<String, Object> map) {
        ActiveContestDTO dto = new ActiveContestDTO();
        // Fetch the values in map for each property of dto. Use the aliases in the "select" statement in CS
        // 1.3.2 as the key of the map. These key names are the same as the properties of dto so it's straight
        // forward to populate each property. Note that some columns from the database are string but the
        // properties are numeric. In this case, proper conversion should be performed. A special case is
        // ActiveContestDTO.digitalRunPoints. If digitalRunFlag is "On", then if digitalRunPoints is not null,
        // use it as the value of ActiveContestDTO.digitalRunPoints, else use payments as the value. If
        // digitalRunFlag is not "On", use null as the value of ActiveContestDTO.digitalRunPoints.
        dto.setContestId((Long) map.get("contestId"));
        dto.setType((String) map.get("type"));
        dto.setCatalog((String) map.get("catalog"));
        dto.setContestName((String) map.get("contestName"));
        dto.setNumberOfSubmissions(((Long) map.get("numberOfSubmissions")).intValue());
        dto.setNumberOfRegistrants(((Long) map.get("numberOfRegistrants")).intValue());
        dto.setRegistrationEndDate(Helper.getEDTTime((Date) map.get("registrationEndDate")));
        dto.setSubmissionEndDate(Helper.getEDTTime((Date) map.get("submissionEndDate")));
        dto.setFirstPrize(getDoubleFromMap(map, "firstPrize"));
        dto.setReliabilityBonus(getDoubleFromMap(map, "reliabilityBonus"));

        if ("On".equals(map.get("digitalRunFlag"))) {
            if (map.get("digitalRunPoints") != null) {
                dto.setDigitalRunPoints(getDoubleFromMap(map, "digitalRunPoints"));
            } else {
                dto.setDigitalRunPoints(getDoubleFromMap(map, "payments"));
            }
        }
        return dto;

    }

    /**
     * <p>
     * Transfer the string into double.
     * </p>
     *
     * @param map
     *            the map
     * @param key
     *            the key
     * @return the double
     * @throws HibernateException
     *             if any error occurs
     */
    private static double getDoubleFromMap(Map<String, Object> map, String key) {
        try {
            String res = (String) map.get(key);
            if (res == null) {
                throw new HibernateException("The [" + key + "] in database's result Map can not be null");
            }
            return new Double(res);
        } catch (NumberFormatException e) {
            throw new HibernateException("NumberFormatException occurs while transfering map's [" + key
                + "] to dto", e);
        }
    }

    /**
     * <p>
     * Retrieve active contests by given filtering conditions.
     * </p>
     *
     * @param filter
     *            the filtering condition. If all its properties are null or empty, all results will be
     *            returned.
     * @return matched active contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if filter is null;
     * @throws ActiveContestsManagerException
     *             if any error occurs
     */
    public List<ActiveContestDTO> retrieveActiveContests(ActiveContestFilter filter)
        throws ActiveContestsManagerException {
        // Log the entry
        final String signature = CLASS_NAME + ".retrieveActiveContests(ActiveContestFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] {"filter"}, new Object[] {filter});
        final long startTime = System.currentTimeMillis();

        List<ActiveContestDTO> result = retrieveActiveContests(null, null, -1, -1, filter);

        // log exit
        Helper.logExit(LOGGER, signature, startTime, result);

        return result;
    }

    /**
     * <p>
     * Setter method for the projectNameInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param projectNameInfoId
     *            The id of the project_info_type_lu row that has name 'Project Name'
     */
    public void setProjectNameInfoId(long projectNameInfoId) {
        this.projectNameInfoId = projectNameInfoId;
    }

    /**
     * <p>
     * Setter method for the registrationPhaseTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param registrationPhaseTypeId
     *            The id of the phase_type_lu row that has name 'Registration'
     */
    public void setRegistrationPhaseTypeId(long registrationPhaseTypeId) {
        this.registrationPhaseTypeId = registrationPhaseTypeId;
    }

    /**
     * <p>
     * Setter method for the submissionPhaseTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param submissionPhaseTypeId
     *            The id of the phase_type_lu row that has name 'Submission'
     */
    public void setSubmissionPhaseTypeId(long submissionPhaseTypeId) {
        this.submissionPhaseTypeId = submissionPhaseTypeId;
    }

    /**
     * <p>
     * Setter method for the firstPlaceCostInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param firstPlaceCostInfoId
     *            The id of the project_info_type_lu row that has name 'First Place Cost'
     */
    public void setFirstPlaceCostInfoId(long firstPlaceCostInfoId) {
        this.firstPlaceCostInfoId = firstPlaceCostInfoId;
    }

    /**
     * <p>
     * Setter method for the paymentsInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param paymentsInfoId
     *            The id of the project_info_type_lu row that has name 'Payments'
     */
    public void setPaymentsInfoId(long paymentsInfoId) {
        this.paymentsInfoId = paymentsInfoId;
    }

    /**
     * <p>
     * Setter method for the digitalRunFlagInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param digitalRunFlagInfoId
     *            The id of the project_info_type_lu row that has name 'Digital Run Flag'
     */
    public void setDigitalRunFlagInfoId(long digitalRunFlagInfoId) {
        this.digitalRunFlagInfoId = digitalRunFlagInfoId;
    }

    /**
     * <p>
     * Setter method for the reliabilityBonusCostInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param reliabilityBonusCostInfoId
     *            The id of the project_info_type_lu row that has name 'Reliability Bonus Cost'
     */
    public void setReliabilityBonusCostInfoId(long reliabilityBonusCostInfoId) {
        this.reliabilityBonusCostInfoId = reliabilityBonusCostInfoId;
    }

    /**
     * <p>
     * Setter method for the digitalRunPointInfoId, simply set the value to the namesake field.
     * </p>
     *
     * @param digitalRunPointInfoId
     *            The id of the project_info_type_lu row that has name 'DR points'
     */
    public void setDigitalRunPointInfoId(long digitalRunPointInfoId) {
        this.digitalRunPointInfoId = digitalRunPointInfoId;
    }

    /**
     * <p>
     * Setter method for the activeStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param activeStatusId
     *            The id of the project_status_lu row that has name 'Active'
     */
    public void setActiveStatusId(long activeStatusId) {
        this.activeStatusId = activeStatusId;
    }

    /**
     * <p>
     * Setter method for the finalReviewPhaseTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param finalReviewPhaseTypeId
     *            The id of the phase_type_lu row that has name 'Final Review'
     */
    public void setFinalReviewPhaseTypeId(long finalReviewPhaseTypeId) {
        this.finalReviewPhaseTypeId = finalReviewPhaseTypeId;
    }

    /**
     * <p>
     * Setter method for the openPhaseStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param openPhaseStatusId
     *            The id of the phase_status_lu row that has name 'Open'
     */
    public void setOpenPhaseStatusId(long openPhaseStatusId) {
        this.openPhaseStatusId = openPhaseStatusId;
    }

    /**
     * <p>
     * Setter method for the submitterRoleId, simply set the value to the namesake field.
     * </p>
     *
     * @param submitterRoleId
     *            The id of the resource_role_lu row that has name 'Submitter'
     */
    public void setSubmitterRoleId(long submitterRoleId) {
        this.submitterRoleId = submitterRoleId;
    }

    /**
     * <p>
     * Setter method for the contestSubmissionTypeId, simply set the value to the namesake field.
     * </p>
     *
     * @param contestSubmissionTypeId
     *            The id of the submission_type_lu row that has name 'Contest Submission'
     */
    public void setContestSubmissionTypeId(long contestSubmissionTypeId) {
        this.contestSubmissionTypeId = contestSubmissionTypeId;
    }

    /**
     * <p>
     * Setter method for the activeSubmissionStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param activeSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Active'
     */
    public void setActiveSubmissionStatusId(long activeSubmissionStatusId) {
        this.activeSubmissionStatusId = activeSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the failedScreeningSubmissionStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param failedScreeningSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Failed Screening'
     */
    public void setFailedScreeningSubmissionStatusId(long failedScreeningSubmissionStatusId) {
        this.failedScreeningSubmissionStatusId = failedScreeningSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the failedReviewSubmissionStatusId, simply set the value to the namesake field.
     * </p>
     *
     * @param failedReviewSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Failed Review'
     */
    public void setFailedReviewSubmissionStatusId(long failedReviewSubmissionStatusId) {
        this.failedReviewSubmissionStatusId = failedReviewSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the completedWithoutWinSubmissionStatusId, simply set the value to the namesake
     * field.
     * </p>
     *
     * @param completedWithoutWinSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Completed Without Win'
     */
    public void setCompletedWithoutWinSubmissionStatusId(long completedWithoutWinSubmissionStatusId) {
        this.completedWithoutWinSubmissionStatusId = completedWithoutWinSubmissionStatusId;
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
        Helper.checkNotNegativeForConfiguration("failedScreeningSubmissionStatusId",
            failedScreeningSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("firstPlaceCostInfoId", firstPlaceCostInfoId);
        Helper.checkNotNegativeForConfiguration("failedReviewSubmissionStatusId",
            failedReviewSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("registrationPhaseTypeId", registrationPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("digitalRunFlagInfoId", digitalRunFlagInfoId);
        Helper.checkNotNegativeForConfiguration("activeSubmissionStatusId", activeSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("digitalRunPointInfoId", digitalRunPointInfoId);
        Helper.checkNotNegativeForConfiguration("completedWithoutWinSubmissionStatusId",
            completedWithoutWinSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("submissionPhaseTypeId", submissionPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("projectNameInfoId", projectNameInfoId);
        Helper.checkNotNegativeForConfiguration("finalReviewPhaseTypeId", finalReviewPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("paymentsInfoId", paymentsInfoId);
        Helper.checkNotNegativeForConfiguration("reliabilityBonusCostInfoId", reliabilityBonusCostInfoId);
        Helper.checkNotNegativeForConfiguration("submitterRoleId", submitterRoleId);
        Helper.checkNotNegativeForConfiguration("activeStatusId", activeStatusId);
        Helper.checkNotNegativeForConfiguration("contestSubmissionTypeId", contestSubmissionTypeId);
        Helper.checkNotNegativeForConfiguration("openPhaseStatusId", openPhaseStatusId);
    }
}
