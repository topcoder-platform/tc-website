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
import com.topcoder.web.tc.ContestStatusManager;
import com.topcoder.web.tc.ContestStatusManagerException;
import com.topcoder.web.tc.Helper;
import com.topcoder.web.tc.SortingOrder;
import com.topcoder.web.tc.dto.ContestStatusDTO;
import com.topcoder.web.tc.dto.ContestStatusFilter;

/**
 * <p>
 * This is the default implementation of ContestStatusManager. It extends
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
 * // Get the ContestStatusManager from Spring
 * ContestStatusManager manager = (ContestStatusManager) applicationContext
 *                 .getBean(&quot;ContestStatusManagerBean&quot;);
 * 
 * // Create a new ActiveContestFilter
 * ContestStatusFilter filter = new ContestStatusFilter();
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
 * </pre>
 * 
 * </p>
 * 
 * <p>
 * Version 1.1 change notes:
 * <ul>
 * <li>Updated {@link #transferMapToDTO(Map)} method to set contestId.</li>
 * <li>Updated {@link #transferMapToDTO(Map)} method to set the member profile link for first and second winners.</li>
 * <li>Updated {@link #SQL_QUERY} to fix the logic to get current phase.</li>
 * <li>Updated {@link #SQL_QUERY} to get the user if of the first and second winners.</li>
 * <li>Updated {@link #SQL_QUERY} to filter the results on Active contests.</li>
 * </ul>
 * </p>
 *
 * <p>
 * Changes in Version 1.2 : Removed subType in SQL and DTO.
 * </p>
 * 
 * <p>
 * Changes in Version 1.3 : Added contestName in SQL and DTO.
 * </p>
 *
 * @author mekanizumu, TCSDEVELOPER, bugbuka
 * @version 1.3
 */
public class ContestStatusManagerImpl extends HibernateDaoSupport implements
        ContestStatusManager {
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = ContestStatusManagerImpl.class
            .getName();
    /**
     * <p>
     * Represent the sql query string.
     * </p>
     */
    private static final String SQL_QUERY = "SELECT DISTINCT new map(compCatalog.componentName as contestName,  projectNameInfo.value as contestId, projectCategory.name as type,"
            + " projectCatalog.name as catalog,"
            + " submissionPhase.scheduledEndTime as submissionDueDate,"
            + "  (SELECT MAX(finalReviewPhase.scheduledEndTime) from ProjectPhase finalReviewPhase where finalReviewPhase.projectId=project.projectId "
			+ "					and finalReviewPhase.phaseTypeId=:finalReviewPhaseTypeId) as finalReviewDueDate,  "
			+ " (SELECT name FROM PhaseType WHERE phaseTypeId = ("
			+ "          SELECT MAX(ptl.phaseTypeId) FROM PhaseType ptl, ProjectPhase currentPhase WHERE ptl.phaseTypeId = currentPhase.phaseTypeId"
			+ "		     								AND currentPhase.projectId = project.projectId AND currentPhase.phaseStatusId=:openPhaseStatusId)) as currentPhase,"
            + " (select handleInfo.value FROM ProjectInfo winnerIdInfo, Resource r1, ResourceInfo externalReferenceIdInfo,"
            + " 								ResourceInfo handleInfo where winnerIdInfo.projectId=project.projectId"
            + " 																and winnerIdInfo.projectInfoTypeId=:winnerIdInfoId"
            // this join gets the winner handle
            + " 																and r1.projectId=project.projectId and externalReferenceIdInfo.resourceId=r1.resourceId "
			+ "                                                                 and r1.resourceRoleId = :submitterRoleId "
            + " 																and externalReferenceIdInfo.resourceInfoTypeId=:externalReferenceIdInfoId"
            + " 																and externalReferenceIdInfo.value=winnerIdInfo.value"
            // this join gets the winner external reference ID
            + " 																and handleInfo.resourceId=r1.resourceId and handleInfo.resourceInfoTypeId=:handleInfoId) as firstPlaceHandle,"
            + " (select winnerIdInfo.value FROM ProjectInfo winnerIdInfo WHERE winnerIdInfo.projectId=project.projectId"
            + " 									and winnerIdInfo.projectInfoTypeId=:winnerIdInfoId) as firstPlaceHandleId,"
            // these joins get the Resource representing the winner
            + " (select secondPlaceIdInfo.value FROM ProjectInfo secondPlaceIdInfo WHERE secondPlaceIdInfo.projectId=project.projectId"
            + " 									and secondPlaceIdInfo.projectInfoTypeId=:secondPlaceIdInfoId) as secondPlaceHandleId,"
            // these joins get the Resource representing the second place
            + " firstPrizeInfo.value as firstPrize) "
			+ " FROM Project project, ProjectCategoryLookup projectCategory,"
            + " 	ProjectCatalogLookup projectCatalog, ProjectPhase registrationPhase,"
            + " 	ProjectPhase submissionPhase,"
            + " 	ProjectInfo firstPrizeInfo, ProjectInfo projectNameInfo,"
            + " 	CompCatalog compCatalog"
            + " WHERE project.projectCategoryId=projectCategory.projectCategoryId"
			+ " and project.projectStatusId = 1"
            // this join is for type
            + " and projectCategory.projectCatalogId=projectCatalog.projectCatalogId"
            // this join is for catalog
            + " and projectNameInfo.projectId=project.projectId"
            + " and projectNameInfo.value=compCatalog.componentId"
            + " and projectNameInfo.projectInfoTypeId=:projectNameInfoId"
            // this join is for getting the contest name
            + " and registrationPhase.projectId=project.projectId"
            + " and registrationPhase.phaseTypeId=:registrationPhaseTypeId"
            // this join is for getting the registration end date
            + " and submissionPhase.projectId=project.projectId"
            + " and submissionPhase.phaseTypeId=:submissionPhaseTypeId"
            // this join is for getting the submission due date
            + " and firstPrizeInfo.projectId=project.projectId"
            + " and firstPrizeInfo.projectInfoTypeId=:firstPlaceCostInfoId "
			+ " and exists (SELECT phaseTypeId from ProjectPhase pp where pp.projectId = project.projectId and pp.phaseStatusId = :openPhaseStatusId) ";
    // this join is for getting the winner prize

    /**
     * <p>
     * The Logger object used for logging. It's a constant. So it can only be
     * that constant value It is final and won't change once it is initialized
     * as part of variable declaration to:
     * Logger.getLogger(ContestStatusManagerImpl.class). It is used throughout
     * the class wherever logging is needed.
     * </p>
     */
    private static final Logger LOGGER = Logger
            .getLogger(ContestStatusManagerImpl.class);

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
     * The id of the phase_type_lu row that has name 'Submission'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setSubmissionPhaseTypeId(),
     * retrieveContestStatuses(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long submissionPhaseTypeId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Final Review'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in retrieveContestStatuses(),
     * setFinalReviewPhaseTypeId(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long finalReviewPhaseTypeId;

    /**
     * <p>
     * The id of the phase_status_lu row that has name 'Open'. It is set through
     * setter and doesn't have a getter. It must be non-negative. (Note that the
     * above statement applies only after the setter has been called as part of
     * the IoC initialization. This field's value has no restriction before the
     * IoC initialization) It does not need to be initialized when the instance
     * is created. It is used in setOpenPhaseStatusId(),
     * retrieveContestStatuses(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long openPhaseStatusId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Winner External
     * Reference ID'. It is set through setter and doesn't have a getter. It
     * must be non-negative. (Note that the above statement applies only after
     * the setter has been called as part of the IoC initialization. This
     * field's value has no restriction before the IoC initialization) It does
     * not need to be initialized when the instance is created. It is used in
     * retrieveContestStatuses(), setWinnerIdInfoId(). Its value legality is
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
     * retrieveContestStatuses(), setExternalReferenceIdInfoId(). Its value
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
     * retrieveContestStatuses(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long handleInfoId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'Runner-up External
     * Reference ID'. It is set through setter and doesn't have a getter. It
     * must be non-negative. (Note that the above statement applies only after
     * the setter has been called as part of the IoC initialization. This
     * field's value has no restriction before the IoC initialization) It does
     * not need to be initialized when the instance is created. It is used in
     * retrieveContestStatuses(), setSecondPlaceIdInfoId(). Its value legality
     * is checked in checkConfiguration() method.
     * </p>
     */
    private long secondPlaceIdInfoId;

    /**
     * <p>
     * The id of the phase_type_lu row that has name 'Registration'. It is set
     * through setter and doesn't have a getter. It must be non-negative. (Note
     * that the above statement applies only after the setter has been called as
     * part of the IoC initialization. This field's value has no restriction
     * before the IoC initialization) It does not need to be initialized when
     * the instance is created. It is used in setRegistrationPhaseTypeId(),
     * retrieveContestStatus(). Its value legality is checked in
     * checkConfiguration() method.
     * </p>
     */
    private long registrationPhaseTypeId;

    /**
     * <p>
     * The id of the project_info_type_lu row that has name 'First Place Cost'.
     * It is set through setter and doesn't have a getter. It must be
     * non-negative. (Note that the above statement applies only after the
     * setter has been called as part of the IoC initialization. This field's
     * value has no restriction before the IoC initialization) It does not need
     * to be initialized when the instance is created. It is used in
     * setFirstPlaceCostInfoId(), retrieveContestStatus(). Its value legality is
     * checked in checkConfiguration() method.
     * </p>
     */
    private long firstPlaceCostInfoId;
	
	
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
     * This is the default constructor for the class.
     * </p>
     */
    public ContestStatusManagerImpl() {
        // Empty
    }

    /**
     * <p>
     * Retrieve contest status by given filtering conditions with pagination
     * support.
     * </p>
     * 
     * @param pageSize
     *            the page size.
     * @param pageNumber
     *            the page number.
     * @param sortingOrder
     *            the sorting order. If it's null, natural order will be used.
     * @param columnName
     *            the name of the ContestStatusDTO column to sort on. If it's
     *            null or empty, natural order will be used.
     * @param filter
     *            the filtering condition. If all its properties are null or
     *            empty, all results will be returned.
     * @return the matched contest status. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if pageNumber is not positive, or not value -1 that used as
     *             the flag for returning all values, or not have the values of
     *             the constants of Filterable, or pageSize is not positive, or
     *             not have the values of the constants of Filterable, or filter
     *             is null@param sortingOrder
     * @throws ContestStatusManagerException
     *             if any error occurs
     */
    public List<ContestStatusDTO> retrieveContestStatuses(
            final String columnName, final SortingOrder sortingOrder,
            final int pageNumber, final int pageSize,
            final ContestStatusFilter filter)
            throws ContestStatusManagerException {
        // Log the entry
        final String signature = CLASS_NAME
                + ".retrieveActiveContests(String, SortingOrder, int, int, ActiveContestFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] { "columnName",
                "sortingOrder", "pageNumber", "pageSize", "filter" },
                new Object[] { columnName, sortingOrder, pageNumber, pageSize,
                        filter });
        final long startTime = System.currentTimeMillis();

        try {
            // check parameter
            Helper.checkPageNumberAndSize("pageNumber", pageNumber);
            Helper.checkPageNumberAndSize("pageSize", pageSize);
            Helper.checkNotNull("filter", filter);

            // This will hold the result to return:
            final List<ContestStatusDTO> contestStatuses = new ArrayList<ContestStatusDTO>();
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
                                            "ContestStatus");

                            // Add order
                            sql += Helper.addOrderForSQL(columnName,
                                    sortingOrder);

                            Query query = session.createQuery(sql);
                            // set the parameters of the HQL according to CS
                            // 1.3.4
                            setQueryParameters(query);

                            // Add flag for prizeLowerBound
                            boolean prizeLowerBoundFlag = false;
                            if (filter.getPrizeLowerBound() != null
                                    && filter.getPrizeLowerBound() != -1) {
                                prizeLowerBoundFlag = true;
                            }

                            // Add flag for prizeUpperBound
                            boolean prizeUpperBoundFlag = false;
                            if (filter.getPrizeUpperBound() != null
                                    && filter.getPrizeUpperBound() != -1) {
                                prizeUpperBoundFlag = true;
                            }

                            // Add flag for winner handle
                            boolean winnerHandleFlag = false;
                            if (Helper
                                    .checkStringNotNullAndNotEmptyOfBoolean(filter
                                            .getWinnerHandle())) {
                                winnerHandleFlag = true;
                            }

                            // Set the page size and number
                            if (!prizeLowerBoundFlag && !prizeUpperBoundFlag
                                    && !winnerHandleFlag) {
                                Helper.setPageForQuery(query, pageNumber,
                                        pageSize);
                            }

                            // Execute the query:
                            List<Object> result = query.list();
                            List<ContestStatusDTO> tempContestStatusDTO = new ArrayList<ContestStatusDTO>();

                            for (Object res : result) {
                                @SuppressWarnings("rawtypes")
                                Map mapRes = (Map) res;
                                String firstPrize = (String) mapRes
                                        .get("firstPrize");
                                // Add filter for prizeLowerBound
                                if (prizeLowerBoundFlag
                                        && (firstPrize == null || new Double(
                                                firstPrize) < filter
                                                .getPrizeLowerBound())) {
                                    continue;
                                }
                                // Add filter for prizeUpperBound
                                if (prizeUpperBoundFlag
                                        && (firstPrize == null || new Double(
                                                firstPrize) > filter
                                                .getPrizeUpperBound())) {
                                    continue;
                                }
                                // If the filter of winner handle is set, winner
                                // handle can not be null
                                if (winnerHandleFlag) {
                                    String winner = (String) mapRes
                                            .get("firstPlaceHandle");
                                    if (winner == null
                                            || winner.indexOf(filter
                                                    .getWinnerHandle()) == -1) {
                                        continue;
                                    }
                                }
                                tempContestStatusDTO
                                        .add(transferMapToDTO(mapRes));
                            }

                            // Get the correct page for prize filter
                            if ((prizeLowerBoundFlag || prizeUpperBoundFlag || winnerHandleFlag)
                                    && pageNumber > 0 && pageSize > 0) {
                                tempContestStatusDTO = Helper.getPageForPrize(
                                        pageNumber, pageSize,
                                        tempContestStatusDTO);
                            }

                            contestStatuses.addAll(tempContestStatusDTO);
                            return null;
                        }
                    });

            // log exit
            Helper.logExit(LOGGER, signature, startTime, contestStatuses);

            return contestStatuses;
        } catch (IllegalArgumentException e) {
            throw Helper.logException(LOGGER, e, signature);
        } catch (DataAccessException e) {
            throw Helper.logException(LOGGER,
                    new ContestStatusManagerException(
                            "DataAccessException occurs while executing", e),
                    signature);
        }
		catch (Exception e) {
            throw Helper.logException(LOGGER,
                    new ContestStatusManagerException(
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
     */
    private void setQueryParameters(Query query) {
        query.setParameter("projectNameInfoId", projectNameInfoId);
        query.setParameter("registrationPhaseTypeId", registrationPhaseTypeId);
        query.setParameter("submissionPhaseTypeId", submissionPhaseTypeId);
        query.setParameter("finalReviewPhaseTypeId", finalReviewPhaseTypeId);
        query.setParameter("openPhaseStatusId", openPhaseStatusId);
        query.setParameter("firstPlaceCostInfoId", firstPlaceCostInfoId);
        query.setParameter("winnerIdInfoId", winnerIdInfoId);
        query.setParameter("externalReferenceIdInfoId",
                externalReferenceIdInfoId);
        query.setParameter("handleInfoId", handleInfoId);
        query.setParameter("secondPlaceIdInfoId", secondPlaceIdInfoId);
		query.setParameter("submitterRoleId", submitterRoleId);
    }

    /**
     * <p>
     * Transfer the Map to ContestStatusDTO.
     * </p>
     * 
     * @param map
     *            the map
     * @return the ContestStatusDTO instance
     * @throws HibernateException
     *             if any error occurs
     */
    private static ContestStatusDTO transferMapToDTO(Map<String, Object> map) {
        ContestStatusDTO dto = new ContestStatusDTO();
        dto.setContestId(Long.parseLong((String)map.get("contestId")));
        dto.setContestName((String) map.get("contestName"));
        dto.setType((String) map.get("type"));
        dto.setCatalog((String) map.get("catalog"));
        dto.setSubmissionDueDate(Helper.getEDTTime((Date) map.get("submissionDueDate")));
        dto.setFinalReviewDueDate(Helper.getEDTTime((Date) map.get("finalReviewDueDate")));
        dto.setCurrentPhase((String) map.get("currentPhase"));
        try {
            if (map.get("firstPlaceHandleId") != null) {
                dto.setFirstPlaceHandle(Helper.getMemberProfileLink(Long.parseLong((String) map.get("firstPlaceHandleId"))));
            }
            if (map.get("secondPlaceHandleId") != null) {
                dto.setSecondPlaceHandle(Helper.getMemberProfileLink(Long.parseLong((String) map.get("secondPlaceHandleId"))));
            }
        } catch (Exception e) {
            throw new HibernateException("Error occurs when getting member profile link", e);
        }

        return dto;

    }

    /**
     * <p>
     * Retrieve contest status by given filtering conditions.
     * </p>
     * 
     * @param filter
     *            the filtering condition. If all its properties are null or
     *            empty, all results will be returned.
     * @return the matched contest status. It won't be null but could be empty.
     * @throws IllegalArgumentException
     *             if filter is null
     * @throws ContestStatusManagerException
     *             if any error occurs
     */
    public List<ContestStatusDTO> retrieveContestStatuses(
            ContestStatusFilter filter) throws ContestStatusManagerException {
        final String signature = CLASS_NAME
                + ".retrieveContestStatuses(ContestStatusFilter)";
        Helper.logEntrance(LOGGER, signature, new String[] { "filter" },
                new Object[] { filter });
        final long startTime = System.currentTimeMillis();

        List<ContestStatusDTO> result = retrieveContestStatuses(null, null, -1,
                -1, filter);

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
     *            the projectNameInfoId to set
     */
    public void setProjectNameInfoId(long projectNameInfoId) {
        this.projectNameInfoId = projectNameInfoId;
    }

    /**
     * <p>
     * Setter method for the submissionPhaseTypeId, simply set the value to the
     * namesake field.
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
     * Setter method for the finalReviewPhaseTypeId, simply set the value to the
     * namesake field.
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
     * Setter method for the openPhaseStatusId, simply set the value to the
     * namesake field.
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
     * Setter method for the secondPlaceIdInfoId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param secondPlaceIdInfoId
     *            The id of the project_info_type_lu row that has name
     *            'Runner-up External Reference ID'
     */
    public void setSecondPlaceIdInfoId(long secondPlaceIdInfoId) {
        this.secondPlaceIdInfoId = secondPlaceIdInfoId;
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
     * Setter method for the firstPlaceCostInfoId, simply set the value to the
     * namesake field.
     * </p>
     * 
     * @param firstPlaceCostInfoId
     *            the firstPlaceCostInfoId to set
     */
    public void setFirstPlaceCostInfoId(long firstPlaceCostInfoId) {
        this.firstPlaceCostInfoId = firstPlaceCostInfoId;
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
        Helper.checkNotNegativeForConfiguration("projectNameInfoId",
                projectNameInfoId);
        Helper.checkNotNegativeForConfiguration("submissionPhaseTypeId",
                submissionPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("openPhaseStatusId",
                openPhaseStatusId);
        Helper.checkNotNegativeForConfiguration("externalReferenceIdInfoId",
                externalReferenceIdInfoId);
        Helper.checkNotNegativeForConfiguration("secondPlaceIdInfoId",
                secondPlaceIdInfoId);
        Helper.checkNotNegativeForConfiguration("finalReviewPhaseTypeId",
                finalReviewPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("handleInfoId", handleInfoId);
        Helper.checkNotNegativeForConfiguration("winnerIdInfoId",
                winnerIdInfoId);
        Helper.checkNotNegativeForConfiguration("registrationPhaseTypeId",
                registrationPhaseTypeId);
        Helper.checkNotNegativeForConfiguration("firstPlaceCostInfoId",
                firstPlaceCostInfoId);
		Helper.checkNotNegativeForConfiguration("submitterRoleId",
                submitterRoleId);
    }
}
