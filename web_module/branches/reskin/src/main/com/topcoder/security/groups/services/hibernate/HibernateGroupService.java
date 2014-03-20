/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.commons.utils.LoggingWrapperUtility;
import com.topcoder.commons.utils.ValidationUtility;
import com.topcoder.security.groups.model.BillingAccount;
import com.topcoder.security.groups.model.DirectProject;
import com.topcoder.security.groups.model.Group;
import com.topcoder.security.groups.model.GroupMember;
import com.topcoder.security.groups.services.AuthorizationService;
import com.topcoder.security.groups.services.EntityNotFoundException;
import com.topcoder.security.groups.services.GroupService;
import com.topcoder.security.groups.services.SecurityGroupConfigurationException;
import com.topcoder.security.groups.services.SecurityGroupException;
import com.topcoder.security.groups.services.UserService;
import com.topcoder.security.groups.services.dto.GroupSearchCriteria;
import com.topcoder.security.groups.services.dto.PagedResult;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.util.DBMS;

/**
 * <p>
 * This is the implementation of interface defines the contract for the management of groups
 * </p>
 * <p>
 * Thread Safety:Implementations are expected to be effectively thread-safe
 * </p>
 * 
 * <p>
 * Version 1.1 (TopCoder Security Groups Frontend - Create Update Group) change notes:
 * <ol>
 *   <li>Updated <code>update</code> method to return the updated <code>Group</code> instance.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Release Assembly - TopCoder Security Groups Frontend - Search Delete Groups) change notes:
 * <ol>
 *   <li>Added {@link #getLikeString(String)} to return like string used in hql.</li>
 *   <li>Added {@link #userService} and its getter/setter.</li>
 *   <li>Removed dataAccessJts and its setter, {@link #userService} was used instead.</li>
 *   <li>Updated method {@link #setCriteria(List, List, int, GroupSearchCriteria, Query)} to use projectIds,
 *   groupMemberUserIds as first two parameters.
 *   </li>
 *   <li>Updated {@link #delete(long)} to delete related group invitations.<li>
 *   <li>Updated {@link #search(GroupSearchCriteria, int, int)} to use LIKE comparison when searching groups.</li>
 * </ol>
 * </p>
 * 
 * <p>
 * Version 1.3 (Release Assembly - TopCoder Security Groups Frontend - Miscellaneous) change notes:
 * <ol>
 *   <li>Moved {@link #getLikeString(String)} to base class {@link BaseGroupService}, refactored to use helper methods
 *   {@link #GetMemberUserIds(UserService, String)}, {@link #GetProjectIds(DataAccess, String)},
 *   {@link #isNonNullNonEmpty(String)} in base class {@link BaseGroupService}.</li>
 *   <li>Added helper method {@link #persistNewMembers(Session, Group)} and updated
 *   {@link #update(Group)} to fix the members persistence logic.</li>
 *   <li>Added {@link #afterPropertiesSet()} to check if the service fields injected.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.4 (Release Assembly - TopCoder Security Groups Release 4) change notes:
 * <ol>
 *      <li>Fix the bug of {@link #update(Group)} when archiving group.</li>
 *      <li>Fix the bug of {@link #copyGroup(Group)} when setting actived date for archiving group.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Version 1.5 (TopCoder Security Groups Release 8 - Automatically Grant Permissions) change notes:
 * <ol>
 *     <li>Updated {@link #copyGroup(com.topcoder.security.groups.model.Group)} method to remove restrictions
 *         and add auto grant field.</li>
 *     <li>Updated {@link #isSubSet(com.topcoder.security.groups.model.Group, com.topcoder.security.groups.model.Group)}
 *         method to check auto grant permissions.</li>
 * </ol>
 * </p>
 *
 * @author backstretlili, flexme, freegod
 * 
 * @version 1.5
 * @since  1.0
 */
public class HibernateGroupService extends BaseGroupService implements GroupService {

    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = HibernateGroupService.class.getName();

    /**
     * A instance of AuthorizationService used to check permissions,it'll be injected by Spring
     */
    private AuthorizationService authorizationService;

    /**
     * An instance of UserService used to get user.
     *
     * @since 1.2
     */
    private UserService userService;

    /**
     * The DataAccess used to retrieve data from corporate_oltp
     */
    private DataAccess dataAccessCorp;

    /**
     * This method creates a new group, and returns its ID.
     * 
     * @param group
     *            the Group to create
     * @return the ID of the created Group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public long add(Group group) throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".add(Group group)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "group" }, new Object[] { group });

        if (group == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("group is null"), logger, signature);
        }

        try {
            Session session = sessionFactory.getCurrentSession();
            session.persist(group);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { group.getId() });

        return group.getId();
    }

    /**
     * This method updates an existing group
     * 
     * @param group
     *            the Group to update
     * @return the updated group
     * @throws IllegalArgumentException
     *             If group is null
     * @throws EntityNotFoundException
     *             If the group with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public Group update(Group group) throws IllegalArgumentException, EntityNotFoundException, SecurityGroupException {
        final String signature = CLASS_NAME + ".update(Group group)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "group" }, new Object[] { group });

        if (group == null) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("group is null when update"), logger,
                            signature);
        }

        Group retGroup = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            Group existingGroup = (Group) session.get(Group.class, Long.valueOf(group.getId()));
            if (needArchive(existingGroup, group)) {                
                // persist the new group and its members
                Group newGroup = copyGroup(group);
                session.persist(newGroup);
                
                // update the existing group
                existingGroup.setArchived(true);
                existingGroup.setArchivedOn(new Date(System.currentTimeMillis()));
                existingGroup.setEffectiveGroup(newGroup);

                // mark existing members as inactive in the archived group
                if (existingGroup.getGroupMembers() != null) {
                    for (GroupMember member : existingGroup.getGroupMembers()) {
                        if (member.getId() != 0) {
                            member.setActive(false);
                            if (member.getActivatedOn() != null && member.getUnassignedOn() == null) {
                                member.setUnassignedOn(existingGroup.getArchivedOn());
                            }
                        }
                    }
                }
                session.merge(existingGroup);
                retGroup = newGroup;
            } else {
                persistNewMembers(session, group);
                group = (Group) session.merge(group);
                retGroup = group;
            }
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { retGroup });
        return retGroup;
    }
    
    /**
     * Persists the new members of the specified group.
     * 
     * @param session the session
     * @param group the group
     * @throws HibernateException if any error occurred
     * @since 1.3
     */
    private void persistNewMembers(Session session, Group group) {
        if (group.getGroupMembers() != null) {
            for (GroupMember member : group.getGroupMembers()) {
                if (member.getId() == 0) {
                    session.persist(member);
                }
            }
        }
    }

    /**
     * Get a copy of the group to be updated,or the persist of Hibernate will not work
     * 
     * @param group
     *            the group to be copied
     * @return the new group
     */
    private Group copyGroup(Group group) {
        Group newGroup = new Group();
        newGroup.setArchived(group.getArchived());
        newGroup.setArchivedOn(group.getArchivedOn());
        newGroup.setAutoGrant(group.getAutoGrant());
        if( ! newGroup.getAutoGrant()) {
            newGroup.setBillingAccounts(group.getBillingAccounts());
            if (group.getDirectProjects() != null) {
                List<DirectProject> directProjects = new ArrayList<DirectProject>();
                for (DirectProject dp : group.getDirectProjects()) {
                    DirectProject newDP = new DirectProject();
                    newDP.setGroup(newGroup);
                    newDP.setDirectProjectId(dp.getDirectProjectId());
                    directProjects.add(newDP);
                }
                newGroup.setDirectProjects(directProjects);
            }
        } else {
            newGroup.setBillingAccounts(new ArrayList<BillingAccount>());
            newGroup.setDirectProjects(new ArrayList<DirectProject>());
        }
        newGroup.setClient(group.getClient());
        newGroup.setDefaultPermission(group.getDefaultPermission());
        newGroup.setName(group.getName());

        List<GroupMember> newMembers = new ArrayList<GroupMember>();
        if (group.getGroupMembers() != null) {
            for (GroupMember member : group.getGroupMembers()) {
                // copy all members not unassigned yet
                if (member.getUnassignedOn() == null) {
                    GroupMember newMember = new GroupMember();
                    newMember.setActivatedOn(member.getActivatedOn() == null ? null : new Date(System.currentTimeMillis()));
                    newMember.setActive(member.getActive());
                    newMember.setSpecificPermission(member.getSpecificPermission());
                    newMember.setUnassignedOn(member.getUnassignedOn());
                    newMember.setUseGroupDefault(member.isUseGroupDefault());
                    newMember.setUserId(member.getUserId());
                    newMember.setGroup(newGroup);
                    newMembers.add(newMember);
                }
            }
        }
        newGroup.setGroupMembers(newMembers);
        return newGroup;
    }

    /**
     * Check if a group's defaultPermissions, billingAccounts, directProjectIds, or restrictions are updated
     * 
     * @param existingGroup
     *            the existing Group
     * @param group
     *            the updated Group
     * @return boolean updated or not
     */
    private boolean needArchive(Group existingGroup, Group group) {
        return !(isSubSet(existingGroup, group) && isSubSet(group, existingGroup));
    }

    /**
     * Check if a group's defaultPermissions, billingAccounts, directProjectIds, or restrictions is sub set of the other
     * one's
     * 
     * @param group1
     *            the one Group
     * @param group2
     *            the other Group
     * @return boolean is sub set or not
     */
    private boolean isSubSet(Group group1, Group group2) {
        // check defaultPermission
        if (group1.getDefaultPermission() != group2.getDefaultPermission())
            return false;

        //check auto granted permissions
        if(group1.getAutoGrant() != group2.getAutoGrant()) {
            return false;
        }

        // check billingAccounts
        Set<Long> accountIds = new HashSet<Long>();
        for (BillingAccount account : group1.getBillingAccounts()) {
            accountIds.add(Long.valueOf((account.getId())));
        }
        for (BillingAccount account : group2.getBillingAccounts()) {
            if (!accountIds.contains(Long.valueOf(account.getId())))
                return false;
        }
        // check directProjects
        Set<Long> projectIds = new HashSet<Long>();
        for (DirectProject project : group1.getDirectProjects()) {
            projectIds.add(Long.valueOf(project.getId()));
        }
        for (DirectProject project : group2.getDirectProjects()) {
            if (!projectIds.contains(Long.valueOf(project.getId())))
                return false;
        }

        return true;
    }

    /**
     * This method gets a group. If not found, returns null.
     * 
     * @param id
     *            the ID for the group to be retrieved
     * @return the requested Group
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public Group get(long id) throws SecurityGroupException {
        final String signature = CLASS_NAME + ".get(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        Group result = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            result = (Group) session.get(Group.class, Long.valueOf(id));
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { result });

        return result;
    }

    /**
     * This method deletes an existing group
     * 
     * @param id
     *            the ID for the group to be retrieved
     * @throws EntityNotFoundException
     *             If a group with the given ID was not found
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    public void delete(long id) throws EntityNotFoundException, SecurityGroupException {
        final String signature = CLASS_NAME + ".delete(long id)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "id" }, new Object[] { id });

        Group group = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            group = (Group) session.get(Group.class, Long.valueOf(id));
            if (group == null) {
                throw new EntityNotFoundException("group not found");
            }
            
            // delete related group invitations
            Query query = session.createQuery("delete GroupInvitation gi where gi.groupMember.id in " +
            		"(select gm.id from GroupMember gm where gm.group.id=:groupId)");
            query.setLong("groupId", group.getId());
            query.executeUpdate();
            
            // delete group
            session.delete(group);
        } catch (HibernateException e) {
            wrapAndLogSecurityException(e, logger, signature);
        }

        LoggingWrapperUtility.logExit(logger, signature, new Object[] { group });
    }

    /**
     * This method retrieves the list of Groups for the given search criteria and paging requirements. The result will
     * not be null, and the inner list will also never be null.
     * 
     * @param criteria
     *            the filter with the search criteria: if null, assume no filtering
     * @param pageSize
     *            the size of the page to return. Will be a positive number, but ignored if page=0
     * @param page
     *            the 1-based number of the page to return. If 0, then all pages are returned
     * @return A result object with the list of applicable groups and the page and total data
     * @throws IllegalArgumentException
     *             If page < 0,or If pageSize < 1 unless page = 0
     * @throws SecurityGroupException
     *             If there are any errors during the execution of this method
     */
    @SuppressWarnings("unchecked")
    public PagedResult<Group> search(GroupSearchCriteria criteria, int pageSize, int page)
                    throws IllegalArgumentException, SecurityGroupException {
        final String signature = CLASS_NAME + ".search(GroupSearchCriteria criteria, int pageSize, int page)";
        LoggingWrapperUtility.logEntrance(logger, signature, new String[] { "criteria", "pageSize", "page" },
            new Object[] { criteria, pageSize, page });
        if (page < 0 || (pageSize < 1 && page != 0)) {
            wrapAndLogIllegalArgumentException(new IllegalArgumentException("error page or pageSize"), logger,
                            signature);
        }

        PagedResult<Group> result = new PagedResult<Group>();
        result.setPage(page);
        result.setTotal(0);
        result.setValues(new ArrayList<Group>());
        try {
            StringBuilder con = new StringBuilder(" from Group g ");
            // get groupMemberUserIds
            List<Long> groupMemberUserIds = GetMemberUserIds(userService, criteria.getGroupMemberHandle());
            if (groupMemberUserIds != null && groupMemberUserIds.size() == 0)return result;
            
            // get projectIds
            if (dataAccessCorp == null)
                dataAccessCorp = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            List<Long> projectIds = GetProjectIds(dataAccessCorp, criteria.getProjectName());
            if (projectIds != null && projectIds.size() == 0)return result;
            
            // filter
            if (isNonNullNonEmpty(criteria.getBillingAccountName())) {
                con.append(" join g.billingAccounts ba where LOWER(ba.name) ").
                    append(" like LOWER(:billingAccountName) and g.archived != true ");
            } else {
                con.append(" where g.archived != true ");
            }
            if (isNonNullNonEmpty(criteria.getGroupName())) {
                con.append(" and LOWER(g.name) like LOWER(:groupName) ");
            }
            Long userId = criteria.getUserId();
            if (userId != null) {
                if (!authorizationService.isAdministrator(userId)) {
                    String clientHql = " g.client.id in (select ca.client.id from CustomerAdministrator ca where ca.userId = :userId) ";
                    String groupHql = " g.id in (SELECT gm.group.id FROM GroupMember gm WHERE " 
                                    + " ((gm.useGroupDefault = false AND gm.specificPermission = 'FULL') "
                                    + " OR (gm.useGroupDefault = true AND gm.group.defaultPermission = 'FULL')) "
                                    + " AND gm.active = true AND gm.userId = :userId) ";
                    con.append(" and ((").append(clientHql).append(") or (").append(groupHql).append(")) ");
                } else {
                    // ignore it when setting parameters
                    userId = null;
                }
            }
            if (projectIds != null) {
                con.append(" and g.id in (select dp.group.id from DirectProject dp ").
                    append(" where dp.directProjectId in (:projectIds)) ");
            }
            if (isNonNullNonEmpty(criteria.getClientName())) {
                con.append(" and g.client.id in (select c.id from Client c ").
                    append(" where LOWER(c.name) like LOWER(:clientName)) ");
            }
            if(null != criteria.getClientId()) {
                con.append(" and g.client.id = :clientId ");
            }
            if (criteria.getPermissions() != null && criteria.getPermissions().size() > 0) {
                con.append(" and (g.defaultPermission in (:permissions)) ");
            }
            if (isNonNullNonEmpty(criteria.getGroupMemberHandle())) {
                con.append(" and (g.id in (SELECT gm.group.id FROM GroupMember gm WHERE " 
                        +" gm.userId in (:groupMemberUserIds))) ");
            }
            
            // set page
            int row = 0, size = 0;
            if (page != 0) {
                row = (page - 1) * pageSize;
                size = pageSize;
            }
            Session session = sessionFactory.getCurrentSession();
            Query query = session.createQuery("select distinct g " + con.toString());
            setCriteria(projectIds, groupMemberUserIds, userId, criteria, query);
            query.setFirstResult(row);
            if (size > 0)query.setFetchSize(size).setMaxResults(size);
            List<Group> list = (List<Group>) query.list();
            result.setValues(list);
            // set count 
            if (page != 0) {
                query = session.createQuery("select count(distinct g.id) " + con.toString());
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
     * Set criteria to query
     * 
     * @param projectIds
     *            the project ids
     * @param groupMemberUserIds
     *            the group member user ids
     * @param userId
     *            the user id
     * @param criteria
     *            the criteria
     * @param query
     *            the query to set
     */
    private void setCriteria(List<Long> projectIds, List<Long> groupMemberUserIds, Long userId,
            GroupSearchCriteria criteria, Query query) {
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
            query.setString("clientName", getLikeString(criteria.getClientName()));
        }
        if (criteria.getPermissions() != null && criteria.getPermissions().size() > 0) {
            query.setParameterList("permissions", criteria.getPermissions());
        }
        if(null != criteria.getClientId()) {
            query.setParameter("clientId", criteria.getClientId());
        }
    }

    /**
     * <p>
     * This method mainly checks if the IOC operations succeeds. It's supposed to be invoked immediately after IOC
     * completes. Generally, you need to specify its name at init-method property of spring bean definition.
     * </p>
     * 
     * @throws SecurityGroupConfigurationException
     * @since 1.3
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
     * @since 1.2
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * Gets the user service.
     * 
     * @return the user service
     * @since 1.2
     */
    public UserService getUserService() {
        return userService;
    }
}
