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

import com.topcoder.web.tc.ContestServicesConfigurationException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.PastContestsManager;
import com.topcoder.web.tc.PastContestsManagerException;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.PastContestDTO;
import com.topcoder.web.tc.dto.PastContestFilter;

/**
 * <p>
 * This is the default implementation of PastContestsManager. It extends
 * HibernateDaoSupport to execute HQL query to get the data.
 * </p>
 * <p>
 * Thread Safety: This class is not technically thread-safe because it's
 * mutable. However, it can be considered effectively thread-safe after
 * configuration assuming that it's not changed after configuration and the
 * passed in parameters are not changed by other threads at the same time
 * because it holds no mutable state under such assumptions
 * </p>
 * <p>
 * <b>Usage:</b>
 * 
 * <pre>
 * // Get the PastContestsManager from Spring
 * PastContestsManager manager = (PastContestsManager) applicationContext
 *                 .getBean(&quot;PastContestsManagerBean&quot;);
 * 
 * // Create a new ActiveContestFilter
 * PastContestsFilter filter = new PastContestsFilter();
 * 
 * // The filtered contests' name should start with &quot;TC Refactoring&quot;
 * filter.setContestName(&quot;TC Refactoring&quot;);
 * // The winner handlw should &quotwinnerId&quot
 * filter.setWinnerHandle(&quotwinnerId&quot);
 * 
 * // This call retrieves all active contests whose name starts with &quot;TC Refactoring&quot; and prize &lt;= 1000
 * // sorted in ascending order by &quot;contestName&quot; property. The page size is 10 and only the 2nd page
 * // should be returned.
 * //

 * List&ltPastContestsDTO&gt; pastContestses = manager.retrievePastContests(&quot;projectGroupCategory.name&quot;,
 *     SortingOrder.ASCENDING, 2, 10, filter);
 * </pre>
 * 
 * </p>
 * 
 * <p>
 * Version 1.1 change notes:
 * <ul>
 * <li>Updated {@link #transferMapToDTO(Map)} method to set contestId.</li>
 * <li>Removed <code>winnerProfileLinkTemplate</code> field.</li>
 * <li>Updated {@link #transferMapToDTO(Map)} method to set the member profile link for the winner.</li>
 * </ul>
 * </p>
 *
 * <p>
 * Changes in Version 1.2 : Removed subType in SQL and DTO.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER, pinoydream
 * @version 1.2
 */
public class PastContestsManagerImpl extends HibernateDaoSupport implements
        PastContestsManager {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = PastContestsManagerImpl.class
            .getName();

    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY = "SELECT DISTINCT new map(project.projectId as contestId, projectCategory.name as type,"
            + " projectCatalog.name as catalog, projectNameInfo.value as contestName,"
            + " (select count(*) from Submission s, Upload u where u.projectId=project.projectId"
            + "                       and u.uploadId=s.uploadId and s.submissionTypeId=:contestSubmissionTypeId"
            + "                       and s.submissionStatusId in (:activeSubmissionStatusId, :failedScreeningSubmissionStatusId,"
            + "                                                    :failedReviewSubmissionStatusId, :completedWithoutWinSubmissionStatusId)) as numberOfSubmissions,"
            // get the number of submissions
            + " (select count(*) from Resource r2 where r2.projectId=project.projectId and r2.resourceRoleId=:submitterRoleId)"
            + "            as numberOfRegistrants,"
            // gets the number of registrants
            + " approvalPhase.actualEndTime as completionDate,"
            + " handleInfo.value as winnerHandle,"
            + " (select count(*) from Resource r3, ResourceSubmission rs2, Submission s2"
            + "                             where r3.projectId=project.projectId and rs2.resourceId=r3.resourceId"
            + "                                   and s2.submissionId=rs2.submissionId"
            + "                                    and s2.screeningScore >= :passingScreeningScore) as passedScreeningCount,"
            + " winnerIdInfo.value as winnerExternalReferenceId, projectResult.finalScore as winnerScore)"
            + " FROM Project project,"
            + "              ProjectCategoryLookup projectCategory,"
            + "              ProjectCatalogLookup projectCatalog, ProjectInfo projectNameInfo,"
            + "              ProjectPhase registrationPhase, ProjectPhase submissionPhase,"
            + "              ProjectPhase approvalPhase, ProjectInfo winnerIdInfo,"
            + "              ProjectResult projectResult,Resource r4, ResourceInfo externalReferenceIdInfo,"
            + "              ResourceInfo handleInfo "
			+ " WHERE project.projectStatusId=:completedStatusId"
            // this condition means only completed projects are returned.
            + " and project.projectCategoryId=projectCategory.projectCategoryId"
            // this join is for type
            + " and projectCategory.projectCatalogId=projectCatalog.projectCatalogId"
            + " and projectNameInfo.projectId=project.projectId"
            + " and projectNameInfo.projectInfoTypeId=:projectNameInfoId"
            // this join is for getting the contest name
            + " and registrationPhase.projectId=project.projectId"
            + " and registrationPhase.phaseTypeId=:registrationPhaseTypeId"
            // this join is for getting the registration end date
            + " and submissionPhase.projectId=project.projectId"
            + " and submissionPhase.phaseTypeId=:submissionPhaseTypeId"
            // this join is for getting the submission end date
            + " and approvalPhase.projectId=project.projectId"
            + " and approvalPhase.phaseTypeId=:approvalPhaseTypeId"
            // this join is for getting the approval phase
            + " and winnerIdInfo.projectId=project.projectId and winnerIdInfo.projectInfoTypeId=:winnerIdInfoId"
            // this join gets the winner external reference ID
            + " and projectResult.projectId=project.projectId and projectResult.placed=1"
            // this join gets the project result
            + " and r4.projectId=project.projectId and externalReferenceIdInfo.resourceId=r4.resourceId"
            + " and handleInfo.resourceId=r4.resourceId"
            + " and handleInfo.resourceInfoTypeId=:handleInfoId"
            + " and externalReferenceIdInfo.resourceInfoTypeId=:externalReferenceIdInfoId"
            + " and externalReferenceIdInfo.value=winnerIdInfo.value"
            // these joins get the Resource representing the winner
            + " and not exists (from ContestEligibility contestEligibility where contestEligibility.contestId=project.projectId)";// this
                                                                     // filters
                                                                     // out the
                                                                     // studio
                                                                     // contests
    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(PastContestsManagerImpl.class). It is used throughout
     * the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(PastContestsManagerImpl.class);

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Project Name'. It
     * is set through setter and doesn't have a getter. It must be non-negative.
     * (Note that the above statement applies only after the setter has been
     * called as part of the IoC initialization. This field's value has no
     * restriction before the IoC initialization) It does not need to be
     * initialized when the instance is created. It is used in
     * setProjectNameInfoId(), retrievePastContests(). Its value legality is
     * checked in checkConfiguration() method.
     * </p>
     */
    private long projectNameInfoId;

    /**
     * <p>
     * The id of the phase_status_lu row that has name 'Completed'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in retrievePastContests(),
     * setCompletedStatusId(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long completedStatusId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Approval'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setApprovalPhaseTypeId(),
     * retrievePastContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long approvalPhaseTypeId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Winner External
     * Reference ID'. It is set through setter and doesn't have a getter. It
     * must be non-negative. (Note that the above statement applies only after
     * the setter has been called as part of the IoC initialization. This
     * field's value has no restriction before the IoC initialization) It does
     * not need to be initialized when the instance is created. It is used in
     * retrievePastContests(), setWinnerIdInfoId(). Its value legality is
     * checked in checkConfiguration() method.
     * </p>
     */
    private long winnerIdInfoId;

    /**
     * <p>
     * The id of the resource_info_type_lu row that has name 'External Reference
     * ID'. It is set through setter and doesn't have a getter. It must be
     * non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It does not need
     * to be initialized when the instance is created. It is used in
     * setExternalReferenceIdInfoId(), retrievePastContests(). Its value
     * legality is checked in checkConfiguration() method.
     * </p>
     */
    private long externalReferenceIdInfoId;

    /**
     * <p>
     * The id of the resource_info_type_lu row that has name 'Handle'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setHandleInfoId(),
     * retrievePastContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long handleInfoId;

    /**
     * <p>
     * The id of the resource_role_lu row that has name 'Submitter'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setSubmitterRoleId(),
     * retrievePastContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long submitterRoleId;

    /**
     * <p>
     * The id of the submission_type_lu row that has name 'Contest Submission'.
     * It is set through setter and doesn't have a getter. It must be
     * non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It does not need
     * to be initialized when the instance is created. It is used in
     * setContestSubmissionTypeId(), retrievePastContests(). Its value legality
     * is checked in checkConfiguration() method.
     * </p>
     */
    private long contestSubmissionTypeId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Active'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setActiveSubmissionStatusId(),
     * retrievePastContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long activeSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Failed Screening'.
     * It is set through setter and doesn't have a getter. It must be
     * non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It does not need
     * to be initialized when the instance is created. It is used in
     * setFailedScreeningSubmissionStatusId(), retrievePastContests(). Its value
     * legality is checked in checkConfiguration() method.
     * </p>
     */
    private long failedScreeningSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Failed Review'. It
     * is set through setter and doesn't have a getter. It must be non-negative.
     * (Note that the above statement applies only after the setter has been
     * called as part of the IoC initialization. This field's value has no
     * restriction before the IoC initialization) It does not need to be
     * initialized when the instance is created. It is used in
     * setFailedReviewSubmissionStatusId(), retrievePastContests(). Its value
     * legality is checked in checkConfiguration() method.
     * </p>
     */
    private long failedReviewSubmissionStatusId;

    /**
     * <p>
     * The id of the submission_status_lu row that has name 'Completed Without
     * Win'. It is set through setter and doesn't have a getter. It must be
     * non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It does not need
     * to be initialized when the instance is created. It is used in
     * retrievePastContests(), setCompletedWithoutWinSubmissionStatusId(). Its
     * value legality is checked in checkConfiguration() method.
     * </p>
     */
    private long completedWithoutWinSubmissionStatusId;

    /**
     * <p>
     * The minimal screening score that passes screening. It is set through
     * setter and doesn't have a getter. It must be non-negative. (Note that the
     * above statement applies only after the setter has been called as part of
     * the IoC initialization. This field's value has no restriction before the
     * IoC initialization) It does not need to be initialized when the instance
     * is created. It is used in setPassingScreeningScore(),
     * retrievePastContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private double passingScreeningScore;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Registration'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setRegistrationPhaseTypeId(),
     * retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long registrationPhaseTypeId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Submission'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setSubmissionPhaseTypeId(),
     * retrieveActiveContests(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long submissionPhaseTypeId;

    /**
     * <p>
     * This is the default constructor for the class.
     * </p>
     */
    public PastContestsManagerImpl() {
        // Empty
    }

    /**
     * <p>
     * Retrieve past contests by given filtering conditions with pagination
     * support.
     * </p>
     * 
     * @param sortingOrder
     *            the sorting order. If it's null, natural order will be used.
     * @param pageSize
     *            the page size.
     * @param pageNumber
     *            the page number.
     * @param columnName
     *            the name of the PastContestDTO column to sort on. If it's null
     *            or empty, natural order will be used.
     * @param filter
     *            the filtering condition. If all its properties are null or
     *            empty, all results will be returned.
     * @return the matched past contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if pageNumber is not positive, or not value -1 that used as
     *             the flag for returning all values, or not have the values of
     *             the constants of Filterable, or pageSize is not positive, or
     *             not have the values of the constants of Filterable, or filter
     *             is null
     * @throws PastContestsManagerException
     *             if any error occurs
     */
    public List<PastContestDTO> retrievePastContests(final String columnName,
            final SortingOrder sortingOrder, final int pageNumber,
            final int pageSize, final PastContestFilter filter)
            throws PastContestsManagerException {
        // Log the entry
        final String signature = CLASS_NAME
                + ".retrieveActiveContests(String, SortingOrder, int, int, ActiveContestFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] { "columnName",
                "sortingOrder", "pageNumber", "pageSize", "filter" },
                new Object[] { columnName, sortingOrder, pageNumber, pageSize,
                        filter });
        final long startTime = System.currentTimeMillis();

        // This method is almost the same as the pagination version of
        // ActiveContestsManagerImpl.retrieveActiveContests(). The difference is
        // that a different HQL should
        // be used, and the populated DTO class is PastContestDTO. The HQL to
        // use is given in CS 1.3.3.
        // Special care should be taken for PastContestDTO.winnerProfileLink.
        // The "%id%" in
        // this.winnerProfileLinkTemplate should be replaced with the value of
        // winnerExternalReferenceId of
        // the HQL to form the real link and set to
        // PastContestDTO.winnerProfileLink.
        try {
            // check parameter
            Helper.checkPageNumberAndSize("pageNumber", pageNumber);
            Helper.checkPageNumberAndSize("pageSize", pageSize);
            Helper.checkNotNull("filter", filter);

            // This will hold the result to return:
            final List<PastContestDTO> pastContests = new ArrayList<PastContestDTO>();
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
                        @SuppressWarnings("unchecked")
                        public Object doInHibernate(Session session)
                                throws HibernateException {
                            // Create the sql
                            String sql = SQL_QUERY
                                    + Helper.addFilterForSQL(filter,
                                            "PastContest");
                            // Add filter to winner handle
                            if (Helper
                                    .checkStringNotNullAndNotEmptyOfBoolean(filter
                                            .getWinnerHandle())) {
                                sql += " and handleInfo.value LIKE '%"
                                        + filter.getWinnerHandle() + "%'";
                            }

                            // Add order
                            sql += Helper.addOrderForSQL(columnName,
                                    sortingOrder);

                            Query query = session.createQuery(sql);
                            // set the parameters of the HQL according to CS
                            // 1.3.3
                            setQueryParameters(query, filter);

                            // Set the page size and number
                            Helper.setPageForQuery(query, pageNumber, pageSize);

                            // Execute the query:
                            List<Object> result = query.list();

                            for (Object res : result) {
                                @SuppressWarnings("rawtypes")
                                Map mapRes = (Map) res;
                                pastContests.add(transferMapToDTO(mapRes));
                            }
                            return null;
                        }
                    });

            // log exit
            Helper.logExit(LOGGER, signature, startTime, pastContests);

            return pastContests;
        } catch (IllegalArgumentException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (DataAccessException e) {
            throw Helper
                    .logException(LOGGER, new PastContestsManagerException(
                            "DataAccessException occurs while executing", e),
                            signature);
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
    private void setQueryParameters(Query query, PastContestFilter filter) {
        query.setParameter("completedStatusId", completedStatusId);
        query.setParameter("projectNameInfoId", projectNameInfoId);
        query.setParameter("contestSubmissionTypeId", contestSubmissionTypeId);
        query.setParameter("activeSubmissionStatusId", activeSubmissionStatusId);
        query.setParameter("failedScreeningSubmissionStatusId",
                failedScreeningSubmissionStatusId);
        query.setParameter("failedReviewSubmissionStatusId",
                failedReviewSubmissionStatusId);
        query.setParameter("completedWithoutWinSubmissionStatusId",
                completedWithoutWinSubmissionStatusId);
        query.setParameter("submitterRoleId", submitterRoleId);
        query.setParameter("approvalPhaseTypeId", approvalPhaseTypeId);
        query.setParameter("passingScreeningScore", passingScreeningScore);
        query.setParameter("winnerIdInfoId", winnerIdInfoId);
        query.setParameter("registrationPhaseTypeId", registrationPhaseTypeId);
        query.setParameter("submissionPhaseTypeId", submissionPhaseTypeId);
        query.setParameter("externalReferenceIdInfoId",
                    externalReferenceIdInfoId);
        query.setParameter("handleInfoId", handleInfoId);
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
    private PastContestDTO transferMapToDTO(Map<String, Object> map) {
        PastContestDTO dto = new PastContestDTO();
        dto.setContestId((Long) map.get("contestId"));
        dto.setType((String) map.get("type"));
        dto.setCatalog((String) map.get("catalog"));
        dto.setContestName((String) map.get("contestName"));
        dto.setNumberOfSubmissions(((Long) map.get("numberOfSubmissions"))
                .intValue());
        dto.setNumberOfRegistrants(((Long) map.get("numberOfRegistrants"))
                .intValue());
        dto.setCompletionDate(Helper.getEDTTime((Date) map.get("completionDate")));
        dto.setPassedScreeningCount(((Long) map.get("passedScreeningCount"))
                .intValue());
        String winnerExternalReferenceId = (String) map
                .get("winnerExternalReferenceId");
        if (winnerExternalReferenceId != null) {
            try {
                dto.setWinnerProfileLink(Helper.getMemberProfileLink(Long.parseLong(winnerExternalReferenceId)));
            } catch (Exception e) {
                throw new HibernateException("Error occurs when getting member profile link", e);
            }
        }
        dto.setWinnerHandle((String) map.get("winnerHandle"));
        dto.setWinnerScore((Double) map.get("winnerScore"));

        return dto;

    }

    /**
     * <p>
     * Retrieve past contests by given filtering conditions.
     * </p>
     * 
     * @param filter
     *            the filtering condition. If all its properties are null or
     *            empty, all results will be returned.
     * @return the matched past contests. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if filter is null
     * @throws PastContestsManagerException
     *             if any error occurs
     */
    public List<PastContestDTO> retrievePastContests(PastContestFilter filter)
            throws PastContestsManagerException {
        final String signature = CLASS_NAME
                + ".retrievePastContests(PastContestFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] { "filter" },
                new Object[] { filter });
        final long startTime = System.currentTimeMillis();

        List<PastContestDTO> result = retrievePastContests(null, null, -1, -1,
                filter);

        // log exit
        Helper.logExit(LOGGER, signature, startTime, result);

        return result;
    }

    /**
     * <p>
     * Setter method for the projectNameInfoId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param projectNameInfoId
     *            The id of the project_info_type_lu row that has name 'Project
     *            Name'
     */
    public void setProjectNameInfoId(long projectNameInfoId) {
        this.projectNameInfoId = projectNameInfoId;
    }

    /**
     * <p>
     * Setter method for the completedStatusId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param completedStatusId
     *            The id of the phase_status_lu row that has name 'Completed'
     */
    public void setCompletedStatusId(long completedStatusId) {
        this.completedStatusId = completedStatusId;
    }

    /**
     * <p>
     * Setter method for the approvalPhaseTypeId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param approvalPhaseTypeId
     *            The id of the phase_type_lu row that has name 'Approval'
     */
    public void setApprovalPhaseTypeId(long approvalPhaseTypeId) {
        this.approvalPhaseTypeId = approvalPhaseTypeId;
    }

    /**
     * <p>
     * Setter method for the winnerIdInfoId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param winnerIdInfoId
     *            The id of the project_info_type_lu row that has name 'Winner
     *            External Reference ID'
     */
    public void setWinnerIdInfoId(long winnerIdInfoId) {
        this.winnerIdInfoId = winnerIdInfoId;
    }

    /**
     * <p>
     * Setter method for the externalReferenceIdInfoId, simply set the value to
     * the namesake field.
     * </p>
     * 
     * @param externalReferenceIdInfoId
     *            The id of the resource_info_type_lu row that has name
     *            'External Reference ID'
     */
    public void setExternalReferenceIdInfoId(long externalReferenceIdInfoId) {
        this.externalReferenceIdInfoId = externalReferenceIdInfoId;
    }

    /**
     * <p>
     * Setter method for the handleInfoId, simply set the value to the namesake
     * field.
     * </p>
     * 
     * @param handleInfoId
     *            The id of the resource_info_type_lu row that has name 'Handle'
     */
    public void setHandleInfoId(long handleInfoId) {
        this.handleInfoId = handleInfoId;
    }

    /**
     * <p>
     * Setter method for the submitterRoleId, simply set the value to the
     * namesake field.
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
     * Setter method for the contestSubmissionTypeId, simply set the value to
     * the namesake field.
     * </p>
     * 
     * @param contestSubmissionTypeId
     *            The id of the submission_type_lu row that has name 'Contest
     *            Submission'
     */
    public void setContestSubmissionTypeId(long contestSubmissionTypeId) {
        this.contestSubmissionTypeId = contestSubmissionTypeId;
    }

    /**
     * <p>
     * Setter method for the activeSubmissionStatusId, simply set the value to
     * the namesake field.
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
     * Setter method for the failedScreeningSubmissionStatusId, simply set the
     * value to the namesake field.
     * </p>
     * 
     * @param failedScreeningSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Failed
     *            Screening'
     */
    public void setFailedScreeningSubmissionStatusId(
            long failedScreeningSubmissionStatusId) {
        this.failedScreeningSubmissionStatusId = failedScreeningSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the failedReviewSubmissionStatusId, simply set the
     * value to the namesake field.
     * </p>
     * 
     * @param failedReviewSubmissionStatusId
     *            The id of the submission_status_lu row that has name 'Failed
     *            Review'
     */
    public void setFailedReviewSubmissionStatusId(
            long failedReviewSubmissionStatusId) {
        this.failedReviewSubmissionStatusId = failedReviewSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the completedWithoutWinSubmissionStatusId, simply set
     * the value to the namesake field.
     * </p>
     * 
     * @param completedWithoutWinSubmissionStatusId
     *            The id of the submission_status_lu row that has name
     *            'Completed Without Win'
     */
    public void setCompletedWithoutWinSubmissionStatusId(
            long completedWithoutWinSubmissionStatusId) {
        this.completedWithoutWinSubmissionStatusId = completedWithoutWinSubmissionStatusId;
    }

    /**
     * <p>
     * Setter method for the passingScreeningScore, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param passingScreeningScore
     *            The minimal screening score that passes screening
     */
    public void setPassingScreeningScore(double passingScreeningScore) {
        this.passingScreeningScore = passingScreeningScore;
    }

    /**
     * <p>
     * Setter method for the registrationPhaseTypeId, simply set the value to
     * the namesake field.
     * </p>
     * 
     * @param registrationPhaseTypeId
     *            the registrationPhaseTypeId to set
     */
    public void setRegistrationPhaseTypeId(long registrationPhaseTypeId) {
        this.registrationPhaseTypeId = registrationPhaseTypeId;
    }

    /**
     * <p>
     * Setter method for the submissionPhaseTypeId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param submissionPhaseTypeId
     *            the submissionPhaseTypeId to set
     */
    public void setSubmissionPhaseTypeId(long submissionPhaseTypeId) {
        this.submissionPhaseTypeId = submissionPhaseTypeId;
    }

    /**
     * <p>
     * This method is called right after the dependency of this class is fully
     * injected. It checks if the injected values are valid.
     * </p>
     * 
     * @throws ContestServicesConfigurationException
     *             if any of the injected values is invalid.
     */
    public void checkConfiguration() {
        // Check the value of the following fields according to their legal
        // value specification in the field
        // variable documentation:
        Helper.checkNotNegativeForConfiguration("handleInfoId", handleInfoId);
        Helper.checkNotNegativeForConfiguration("submitterRoleId",
                submitterRoleId);
        Helper.checkNotNegativeForConfiguration("contestSubmissionTypeId",
                contestSubmissionTypeId);
        Helper.checkNotNegativeForConfiguration("externalReferenceIdInfoId",
                externalReferenceIdInfoId);
        Helper.checkNotNegativeForConfiguration(
                "failedReviewSubmissionStatusId",
                failedReviewSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("completedStatusId",
                completedStatusId);
        Helper.checkNotNegativeForConfiguration("activeSubmissionStatusId",
                activeSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("winnerIdInfoId",
                winnerIdInfoId);
        Helper.checkNotNegativeForConfiguration(
                "failedScreeningSubmissionStatusId",
                failedScreeningSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("approvalPhaseTypeId",
                approvalPhaseTypeId);
        Helper.checkNotNegativeForConfiguration(
                "completedWithoutWinSubmissionStatusId",
                completedWithoutWinSubmissionStatusId);
        Helper.checkNotNegativeForConfiguration("projectNameInfoId",
                projectNameInfoId);
        Helper.checkNotNegativeForConfiguration("registrationPhaseTypeId",
                registrationPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("submissionPhaseTypeId",
                submissionPhaseTypeId);

        if (passingScreeningScore < 0) {
            throw new ContestServicesConfigurationException(
                    "The argument passingScreeningScore must be non-negative.");
        }
    }
}
