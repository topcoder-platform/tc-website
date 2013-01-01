/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.commons.utils.ValidationUtility;
import com.topcoder.security.groups.model.DirectProject;
import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.model.GroupMember;
import com.topcoder.security.groups.services.AuthorizationService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.GroupMemberService;
import com.topcoder.security.groups.services.SecurityGroupConfigurationException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.GroupMemberAccessHistoricalData;
import com.topcoder.security.groups.services.dto.GroupMemberSearchCriteria;
import com.topcoder.security.groups.services.dto.GroupSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.util.DBMS;

/**
 * <p>
 * This is the implementation of interface defines the contract for the update of group members and searching of their
 * access history
 * </p>
 * 
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Security Groups Frontend - Miscellaneous) change notes:
 * <ol>
 *   <li>Updated {@link #searchHistoricalData(GroupMemberSearchCriteria, int, int)} to support fuzzy searching.</li>
 *   <li>Added {@link #userService} and its getter/setter.</li>
 *   <li>Removed dataAccessJts and its setter, {@link #userService} was used instead.</li>
 *   <li>Updated method {@link #setCriteria(List, List, int, GroupSearchCriteria, Query)} to support fuzzy searching.
 *   </li>
 *   <li>Updated {@link #afterPropertiesSet()} to add check if the {@link #userService} field was injected.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Security Groups Release 3) change notes:
 * <ol>
 *      <li>Modified method {@link #searchHistoricalData(GroupMemberSearchCriteria, int, int)} to change the data filter
 *          logic
 *      </li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Release Assembly - TopCoder Security Groups Release 4) change notes:
 * <ol>
 *      <li>Fix the bug of {@link #searchHistoricalData(GroupMemberSearchCriteria, int, int)}
 *      to filter the records on the date interval.</li>
 * </ol>
 * </p>
 *
 * @author backstretlili, TCSASSEMBLER
 * 
 * @version 1.3
 */
public class HibernateGroupMemberService extends BaseGroupService implements GroupMemberService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateGroupMemberService.class.getName();

    /**
     * An instance of AuthorizationService used to check permissions, it'll be injected by Spring.
     */
    private AuthorizationService authorizationService;

    /**
     * An instance of UserService used to get user.
     *
     * @since 1.1
     */
    private UserService userService;

    /**
     * The DataAccess used to retrieve data from corporate_oltp
     */
    private DataAccess dataAccessCorp;

    /**
     * This method updates an existing group member
     * 
     * @param member
     *            the GroupMember to update
     * @throws IllegalArgumentException
     *             If member is null
     * @throws EntityNotFoundException
     *             If the member with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public void update(GroupMember member) throws IllegalArgumentException, EntityNotFoundException,
                    SecurityGroupException {
        final String signature = CLASS_NAME + ".update(GroupMember member)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "member" }, new Object[] { member });

        if (member == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("member is null when update"), logger,
                            signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            GroupMember existing = (GroupMember) session.get(GroupMember.class, Long.valueOf(member.getId()));

            if (existing == null) {
                wrapAndLogEntityNotFoundException(new EntityNotFoundException("member not found when update"), logger,
                                signature);
            }

            session.clear();
            session.update(member);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { member });
    }

    /**
     * This method retrieves the list of historical data for the given search criteria and paging requirements. The
     * result will not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @return A result object with the list of applicable historical data and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0 or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     * 
     */
    @SuppressWarnings("rawtypes")
    public PagedResult<GroupMemberAccessHistoricalData> searchHistoricalData(GroupMemberSearchCriteria criteria,
                    int pageSize, int page) throws SecurityGroupException {
        final String signature = CLASS_NAME
                        + ".searchHistoricalData(GroupMemberSearchCriteria criteria, int pageSize, int page)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "criteria", "pageSize", "page" },
                        new Object[] { criteria, pageSize, page });

        if (page < 0 || (pageSize < 1 && page != 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("error page or pageSize"), logger,
                            signature);
        }

        PagedResult<GroupMemberAccessHistoricalData> result = new PagedResult<GroupMemberAccessHistoricalData>();
        result.setValues(new ArrayList<GroupMemberAccessHistoricalData>());
        result.setPage(page);
        result.setTotal(0);
        try {
            StringBuilder con = new StringBuilder(" from GroupMember gm ");
            // get groupMemberUserIds
            List<Long> groupMemberUserIds = GetMemberUserIds(userService, criteria.getMemberHandle());
            if (groupMemberUserIds != null && groupMemberUserIds.size() == 0)return result;
            
            // get projectIds
            if (dataAccessCorp == null)
                dataAccessCorp = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            List<Long> projectIds = GetProjectIds(dataAccessCorp, criteria.getProjectName());
            if (projectIds != null && projectIds.size() == 0)return result;

            // join billing accounts
            // only display activated rows (but can be not active)
            if (isNonNullNonEmpty(criteria.getBillingAccountName())) {
                con.append(" join gm.group.billingAccounts ba where LOWER(ba.name) ").
                    append(" like LOWER(:billingAccountName) and gm.activatedOn != null");
            } else {
                con.append(" where gm.activatedOn != null ");
            }
            if (isNonNullNonEmpty(criteria.getGroupName())) {
                con.append(" and LOWER(gm.group.name) like LOWER(:groupName) ");
            }

            // get userId
            Long userId = criteria.getUserId();
            if (userId != null) {
                if (!authorizationService.isAdministrator(userId)) {
                    String clientHql = " gm.group.client.id in (select ca.client.id from CustomerAdministrator ca where ca.userId = :userId) ";
                    con.append(" and (").append(clientHql).append(") ");
                } else {
                    // ignore it when setting parameters
                    userId = null;
                }
            }
            if (projectIds != null) {
                con.append(" and gm.group.id in (select dp.group.id from DirectProject dp ").
                    append(" where dp.directProjectId in (:projectIds)) ");
            }
            if (isNonNullNonEmpty(criteria.getClientName())) {
                con.append(" and gm.group.client.id in (select c.id from Client c where c.name = :clientName) ");
            }
            if (criteria.getPermissions() != null && criteria.getPermissions().size() > 0) {
                con.append(" and (gm.useGroupDefault = true and gm.group.defaultPermission in (:permissions) ");
                con.append(" or gm.useGroupDefault = false and gm.specificPermission in (:permissions)) ");
            }
            if (isNonNullNonEmpty(criteria.getMemberHandle())) {
                con.append(" and gm.userId in (:groupMemberUserIds) ");
            }
            if (criteria.getHadAccessFrom() != null && criteria.getHadAccessTill() != null) {
                con.append(" and (trunc(gm.activatedOn) <= :hadAccessFrom and (trunc(gm.unassignedOn) >= :hadAccessTill or gm.unassignedOn is null)) ");
            } else if (criteria.getHadAccessFrom() == null && criteria.getHadAccessTill() != null) {
                con.append(" and trunc(gm.activatedOn) <= :hadAccessTill and (trunc(gm.unassignedOn) >= :hadAccessTill or gm.unassignedOn is null) ");
            } else if (criteria.getHadAccessFrom() != null && criteria.getHadAccessTill() == null) {
                con.append(" and trunc(gm.activatedOn) <= :hadAccessFrom and (trunc(gm.unassignedOn) >= :hadAccessFrom or gm.unassignedOn is null) ");
            }
            
            // set page
            int row = 0, size = 0;
            if (page != 0) {
                row = (page - 1) * pageSize;
                size = pageSize;
            }
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery(" select distinct gm, gm.group.name " + con.toString() +
                " order by gm.group.name asc");
            
            setCriteria(projectIds, groupMemberUserIds, userId, criteria, query);
            query.setFirstResult(row);
            if (size > 0)query.setFetchSize(size).setMaxResults(size);
            List list = query.list();
            for (Object obj : list) {
                GroupMember gm = (GroupMember) ((Object[])obj)[0];
                GroupMemberAccessHistoricalData data = new GroupMemberAccessHistoricalData();
                data.setMemberUserId(gm.getUserId());
                data.setGroupId(gm.getGroup().getId());
                data.setPermission(gm.isUseGroupDefault() ? gm.getGroup().getDefaultPermission() : gm.getSpecificPermission());
                data.setBillingAccounts(gm.getGroup().getBillingAccounts());
                List<Long> dpIds = new ArrayList<Long>();
                for (DirectProject dp : gm.getGroup().getDirectProjects()) {
                    dpIds.add(dp.getDirectProjectId());
                }
                data.setFrom(gm.getActivatedOn());
                data.setTo(gm.getUnassignedOn());
                data.setDirectProjectIds(dpIds);
                data.setRestrictions(gm.getGroup().getRestrictions());
                // data.to == null means now
                result.getValues().add(data);
            }
            // set count
            if (page != 0) {
                query = session.createQuery("select count(distinct gm.id) " + con.toString());
                setCriteria(projectIds, groupMemberUserIds, userId, criteria, query);
                result.setTotal(Integer.valueOf(query.list().iterator().next().toString()).intValue());
            } else {
                result.setTotal(result.getValues().size());
            }
        } catch (Exception e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * Find a group whose effectiveGroup is the group with the given id. And if find the group must be a archived one.
     * 
     * @param id
     *            the given id
     * @return the found group,if not found null will be returned
     */
    @SuppressWarnings("unchecked")
    private Group findByEffectiveGroup(Long id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(" from Group g where g.effectiveGroup.id=:groupId");
        query.setLong("groupId", id);
        List<Group> list = (List<Group>) query.list();
        if (list.size() > 0) {
            // should be only one Group in the list
            return list.get(0);
        }
        return null;
    }

    /**
     * Set criteria to query
     * 
     * @param projectIds
     *            the project ids
     * @param groupMemberUserIds
     *            the group member user ids
     * @param userId
     *            the parameter userId
     * @param criteria
     *            the criteria
     * @param query
     *            the query to set
     */
    private void setCriteria(List<Long> projectIds, List<Long> groupMemberUserIds, Long userId,
            GroupMemberSearchCriteria criteria, Query query) {
        if (isNonNullNonEmpty(criteria.getGroupName())) {
            query.setString("groupName", getLikeString(criteria.getGroupName()));
        }
        if (isNonNullNonEmpty(criteria.getBillingAccountName())) {
            query.setString("billingAccountName", getLikeString(criteria.getBillingAccountName()));
        }
        if (userId != null) {
            query.setLong("userId", userId);
        }
        if (groupMemberUserIds != null) {
            query.setParameterList("groupMemberUserIds", groupMemberUserIds);
        }
        if (projectIds != null) {
            query.setParameterList("projectIds", projectIds);
        }
        if (isNonNullNonEmpty(criteria.getClientName())) {
            query.setString("clientName", criteria.getClientName());
        }
        if (criteria.getPermissions() != null && criteria.getPermissions().size() > 0) {
            query.setParameterList("permissions", criteria.getPermissions());
        }
        if (criteria.getHadAccessFrom() != null) {
            query.setDate("hadAccessFrom", criteria.getHadAccessFrom());
        }
        if (criteria.getHadAccessTill() != null) {
            query.setDate("hadAccessTill", criteria.getHadAccessTill());
        }
    }

    /**
     * <p>
     * This method mainly checks if the IOC operations succeeds. It's supposed to be invoked immediately after IOC
     * completes. Generally, you need to specify its name at init-method property of spring bean definition.
     * </p>
     * 
     * @throws SecurityGroupConfigurationException
     */
    public void afterPropertiesSet() throws SecurityGroupConfigurationException {
        super.afterPropertiesSet();
        ValidationUtility.checkNotNull(authorizationService, "authorizationService",
            SecurityGroupConfigurationException.class);
        ValidationUtility.checkNotNull(userService, "userService",
            SecurityGroupConfigurationException.class);
    }

    /**
     * The setter of authorizationService
     * 
     * @param authorizationService
     *            the authorizationService to set
     */
    public void setAuthorizationService(AuthorizationService authorizationService) {
        this.authorizationService = authorizationService;
    }

    /**
     * The setter of dataAccessCorp
     * 
     * @param dataAccessCorp
     *            the dataAccessCorp to set
     */
    public void setDataAccessCorp(DataAccess dataAccessCorp) {
        this.dataAccessCorp = dataAccessCorp;
    }

    /**
     * Sets the user service.
     * 
     * @param userService the user service to set
     * @since 1.1
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
