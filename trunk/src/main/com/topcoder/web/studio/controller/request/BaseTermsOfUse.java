/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cronos.termsofuse.dao.ProjectTermsOfUseDao;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.ProjectTermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.studio.Constants;

/**
 * <p>This class is an abstract class providing the basic functions to support terms
 * of use.</p>
 * 
 * @author TCSASSEMBER
 * @version 1.0
 */
public abstract class BaseTermsOfUse extends ShortHibernateProcessor {
    /**
     * The <code>TermsOfUseDao</code> instance.
     */
    private TermsOfUseDao termsOfUseDao = null;
    
    /**
     * The <code>UserTermsOfUseDao</code> instance.
     */
    private UserTermsOfUseDao userTermsOfUseDao = null;
    
    /**
     * The <code>ProjectTermsOfUseDao</code> instance.
     */
    private ProjectTermsOfUseDao projectTermsOfUseDao = null;
    
    /**
     * <p>Gets the data access instance (not cached).</p>
     * 
     * @return the data access instance (not cache).
     * @throws Exception if any error occurs
     */
    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, false);
    }

    /**
     * <p>Gets the data access instance.</p>
     * 
     * @param cached whether to use cache data access
     * @return the data access instance.
     * @throws Exception if any error occurs
     */
    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, cached);
    }

    /**
     * <p>Gets the data access instance.</p>
     * 
     * @param datasource the data source
     * @param cached whether to use cache data access
     * @return the data access instance.
     * @throws Exception if any error occurs
     */
    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached) {
            dAccess = new CachedDataAccess(datasource);
        } else {
            dAccess = new DataAccess(datasource);
        }
        return dAccess;
    }
    
    /**
     * <p>This helper method returns if the specified user is banned from accepting the specified terms of use.</p>
     *
     * @param userId the user id that is requesting the registration
     * @param termsOfUseId the terms of use id the user agreed to
     * @throws Exception if any error occurs
     */
    protected boolean hasTermsOfUseBan(long userId, long termsOfUseId)
            throws Exception {

        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        return userTermsOfUseDao.hasTermsOfUseBan(userId, termsOfUseId);
    }

    /**
     * <p>This helper method will go create the user terms of use association for a given user id, terms of use id.</p>
     *
     * @param userId the user id that is requesting the registration
     * @param termsOfUseId the terms of use id the user agreed to
     * @throws Exception if any error occurs
     */
    protected void saveUserTermsOfUse(long userId, long termsOfUseId)
            throws Exception {

        // check if the user agreed to all terms of use
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
        TermsOfUse nt = termsOfUseDao.getTermsOfUse(termsOfUseId);
        if (nt.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() != Constants.ELEC_AGREEABLE_TERMS_TYPE_ID) {
            throw new NavigationException("This terms of use is not electronically agreeable.");
        }
        if (!userTermsOfUseDao.hasTermsOfUse(userId, termsOfUseId)) {
            List<TermsOfUse> depTermsOfUses = termsOfUseDao.getDependencyTermsOfUse(termsOfUseId);
            for (TermsOfUse term : depTermsOfUses) {
                if (!userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId())) {
                    throw new NavigationException("You can not agree this terms of use because some dependency terms of use have not been agreed.");
                }
            }
            userTermsOfUseDao.createUserTermsOfUse(userId, termsOfUseId);
        }
    }
    
    /**
     * <p>Checks whether a terms group is non-agreeable.</p>
     * 
     * @param terms the terms group
     * @return true if the terms group is non-agreeable, false otherwise
     */
    private static boolean isNonAgreeableTOUGroup(List<TermsOfUse> terms) {
        for (TermsOfUse term : terms) {
            if (term.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * <p>Process a terms of use for a specified project and role.</p>
     * 
     * @param termsGroup the terms groups of the specified project and role
     * @param userId the id of current user
     * @param termsStatus a map used to get the terms status, the key is the ID of the terms, the value is a flag
     *        indicates whether user has agreed on the terms
     * @param allTerms a map used to get all the terms in the group, the key is the ID of the terms, the value is
     *        the terms instance 
     * @param agreeableTOUGroup a <code>List</code> used to get all the agreeable terms group in the provided terms groups
     * @param groupTermsHasAgreed a <code>List<code> used to get the status that whether the user has agreed on the terms group
     * @return the terms group which user has agreed, if no terms group has been agreed, null will return
     * @throws Exception if any error occurs
     */
    private List<TermsOfUse> processTermsOfUse(Map<Integer, List<TermsOfUse>> termsGroup, long userId, Map<Long, Boolean> termsStatus, Map<Long, TermsOfUse> allTerms,
            List<List<TermsOfUse>> agreeableTOUGroup, List<Boolean> groupTermsHasAgreed)
        throws Exception {
        
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        
        // the group which user has agreed
        List<TermsOfUse> allAgreedGroup = null;
        for (Map.Entry<Integer, List<TermsOfUse>> entry : termsGroup.entrySet()) {
            List<TermsOfUse> terms = entry.getValue();
            boolean allAgreed = true;
            boolean hasAgreed = false;
            for (TermsOfUse term : terms) {
                boolean status = userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId());
                termsStatus.put(term.getTermsOfUseId(), status);
                allTerms.put(term.getTermsOfUseId(), term);
                if (!status) {
                    allAgreed = false;
                } else {
                    hasAgreed = true;
                }
            }
            if (allAgreed) {
                allAgreedGroup = entry.getValue();
            }
            if (!isNonAgreeableTOUGroup(terms)) {
                // only display agreeable TOU group to user
                agreeableTOUGroup.add(terms);
                groupTermsHasAgreed.add(hasAgreed);
            }
        }
        return allAgreedGroup;
    }
    
    /**
     * <p>Gets the string representation of the terms in a group.</p>
     *  
     * @param group the terms group
     * @return the string representation of the terms in a group.
     */
    private static String getGroupSortedTermsId(List<TermsOfUse> group) {
        long[] ids = new long[group.size()];
        for (int i = 0; i < group.size(); i++) {
            ids[i] = group.get(i).getTermsOfUseId(); 
        }
        Arrays.sort(ids);
        StringBuilder sb = new StringBuilder();
        for (long id : ids) {
            sb.append("_").append(id);
        }
        return sb.toString();
    }
    
    /**
     * <p>Checks whether two terms group are equal.</p>
     * 
     * @param group1 the first terms group
     * @param group2 the second terms group
     * @return true if the two terms groups are equal, false otherwise
     */
    private static boolean termsGroupEqual(List<TermsOfUse> group1, List<TermsOfUse> group2) {
        return getGroupSortedTermsId(group1).equals(getGroupSortedTermsId(group2));
    }
    
    /**
     * <p>Checks whether two group of terms group are equal.</p>
     * 
     * @param group1 the first group of the terms group
     * @param group2 the second group of the terms group
     * @return true if the two group of terms group are equal, false otherwise
     */
    private static boolean termsGroupEqual(Map<Integer, List<TermsOfUse>> group1, Map<Integer, List<TermsOfUse>> group2) {
        if (group1.size() != group2.size()) {
            return false;
        }
        List<String> group1Terms = new ArrayList<String>();
        List<String> group2Terms = new ArrayList<String>();
        for (Map.Entry<Integer, List<TermsOfUse>> entry : group1.entrySet()) {
            group1Terms.add(getGroupSortedTermsId(entry.getValue()));
        }
        for (Map.Entry<Integer, List<TermsOfUse>> entry : group2.entrySet()) {
            group2Terms.add(getGroupSortedTermsId(entry.getValue()));
        }
        Collections.sort(group1Terms);
        Collections.sort(group2Terms);
        return group1Terms.equals(group2Terms);
    }
    
    /**
     * <p>Gets the readable resource role names from a list of resource role IDs.</p>
     * 
     * @param roleIds the resource role IDs
     * @return the readable resource role names
     * @throws Exception if any error occurs
     */
    private String getResourceRoleNames(List<Integer> roleIds) throws Exception {
        Request r = new Request();
        ResultSetContainer detail = null;

         r.setContentHandle("resource_role_names");
         StringBuilder sb = new StringBuilder();
         for (int i = 0; i < roleIds.size(); i++) {
             if (i > 0) {
                 sb.append(",");
             }
             sb.append(roleIds.get(i));
         }
         r.setProperty(Constants.RESOURCE_ROLE_IDS, sb.toString());
         Map results = getDataAccess().getData(r);

         detail = (ResultSetContainer) results.get("resource_role_names");
         StringBuilder rn = new StringBuilder();
         for (int i = 0; i < detail.size(); i++) {
             if (i > 0) {
                 if (i == detail.size() - 1) {
                     rn.append(" and ");
                 } else {
                     rn.append(", ");
                 }
             }
             rn.append(detail.getStringItem(i, "name"));
         }
         return rn.toString();
    }
    
    /**
     * <p>Checks whether the user has pre-pending dependent terms of use to agree. If so, the page will
     * be redirect to the dependent terms of use to let the user agree.</p>
     * 
     * @param viewRegModule the module to let the user agree terms of use
     * @return true if the user has pre-pending dependent terms of use to agree
     */
    protected boolean hasPrePendingTerm(String viewRegModule) {
        String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
        if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
            // no pre-pending term
            return false;
        }
        
        String[] terms = prePendingTerms.split(",");
        if (terms.length == 0) {
            return false;
        }
        long term = Long.valueOf(terms[terms.length - 1]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < terms.length - 1; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append(terms[i]);
        }
        getRequest().setAttribute(Constants.PRE_PENDING_TERMS, sb.toString());
        
        // redirect to agree the pre-pending term
        StringBuilder url = new StringBuilder();
        url.append("/?").append(Constants.MODULE_KEY).append("=").append(viewRegModule);
        url.append("&").append(Constants.CONTEST_ID).append("=").append(getRequest().getParameter(Constants.CONTEST_ID));
        url.append("&").append(Constants.TERMS_OF_USE_ID).append("=").append(term);
        url.append("&").append(Constants.PRE_PENDING_TERMS).append("=").append(sb.toString());
        setNextPage(url.toString());
        setIsNextPageInContext(false);
        
        return true;
    }
    
    /**
     * <p>This helper method will go through all required terms of use and check whether the user has agreed to
     * them or not. Both lists will be added to the request so that the user can review the terms he agreed to
     * and agree to those he has pending.</p>
     *
     * @param projectId the project id the user is registering to
     * @param userId the user id that is requesting the registration
     * @param currentTermsId the id of current terms of use to agree
     * @return true if the user has pending terms to agree to
     * @throws Exception if any error occurs
     */
    protected boolean processTermsOfUse(String projectId, long userId, Integer[] roleIds, long currentTermsId)
            throws Exception {

        // check if the user agreed to all terms of use
        ProjectTermsOfUseDao projectTermsOfUseDao = getProjectTermsOfUseDao();
        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();

        List<Map<Integer, List<TermsOfUse>>> roleTOUs = new ArrayList<Map<Integer, List<TermsOfUse>>>();
        List<Integer> newRoleIds = new ArrayList<Integer>();
        
        // Get the terms of use group for all roles
        for (int roleId : roleIds) {
            Map<Integer, List<TermsOfUse>> tous = projectTermsOfUseDao.getTermsOfUse(Integer.parseInt(projectId), roleId,
                    new int[] {Constants.NON_AGREEABLE_TERMS_TYPE_ID, Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID, Constants.ELEC_AGREEABLE_TERMS_TYPE_ID});
            if (tous.size() > 0) {
                newRoleIds.add(roleId);
                roleTOUs.add(tous);
            }
        }
        
        // the key is the id of the terms of use, the value is the flag indicates whether the user has agreed the terms of use
        Map<Long, Boolean> termsStatus = new HashMap<Long, Boolean>();
        // the terms of use groups for each role
        List<List<TermsOfUse>> penddingTermsGroup = null;
        List<Boolean> penddingTermsGroupHasAgreed = null;
        List<Integer> penddingTermsRoleIds = new ArrayList<Integer>();
        // the map from the id of the terms of use to the terms of use
        Map<Long, TermsOfUse> allTerms = new HashMap<Long, TermsOfUse>();
        
        List<List<TermsOfUse>> allAgreedGroups = new ArrayList<List<TermsOfUse>>();
        for (int i = 0; i < roleTOUs.size(); i++) {
            List<List<TermsOfUse>> agreeableTOUGroup = new ArrayList<List<TermsOfUse>>();
            List<Boolean> hasAgreed = new ArrayList<Boolean>();
            List<TermsOfUse> allAgreedGroup;
            if ((allAgreedGroup = processTermsOfUse(roleTOUs.get(i), userId, termsStatus, allTerms, agreeableTOUGroup, hasAgreed)) == null) {
                if (agreeableTOUGroup.size() == 0) {
                    throw new NavigationException("Cannot register for this project due to Terms of Use restrictions");
                }
                penddingTermsGroup = agreeableTOUGroup;
                penddingTermsGroupHasAgreed = hasAgreed;
                penddingTermsRoleIds.add(newRoleIds.get(i));
                // get the common groups
                for (int j = i + 1; j < roleTOUs.size(); j++) {
                    if (termsGroupEqual(roleTOUs.get(i), roleTOUs.get(j))) {
                        penddingTermsRoleIds.add(newRoleIds.get(j));
                    }
                }
                break;
            } else {
                allAgreedGroups.add(allAgreedGroup);
            }
        }
        
        getRequest().setAttribute(Constants.TERMS_STATUS, termsStatus);
        
        if (currentTermsId > 0 && !userTermsOfUseDao.hasTermsOfUse(userId, currentTermsId)) {
            TermsOfUse curTerm = termsOfUseDao.getTermsOfUse(currentTermsId);
            if (curTerm.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                throw new NavigationException("The term is not agreeable.");
            }
            List<TermsOfUse> dependenciesTerms = termsOfUseDao.getDependencyTermsOfUse(currentTermsId);
            List<TermsOfUse> dependenciesTermsAgreed = new ArrayList<TermsOfUse>();
            List<TermsOfUse> dependenciesTermsPendding = new ArrayList<TermsOfUse>();
            // pre-pending terms need to be agreed
            String prePendingTerms = getRequest().getParameter(Constants.PRE_PENDING_TERMS);
            
            for (TermsOfUse term : dependenciesTerms) {
                if (userTermsOfUseDao.hasTermsOfUse(userId, term.getTermsOfUseId())) {
                    dependenciesTermsAgreed.add(term);
                } else {
                    if (term.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId() == Constants.NON_AGREEABLE_TERMS_TYPE_ID) {
                        // the dependency term is non-agreeable, redirect to error page
                        throw new NavigationException("Cannot register for this project due to Terms of Use restrictions");
                    }
                    dependenciesTermsPendding.add(term);
                }
            }
            if (dependenciesTermsPendding.size() > 0) {
                if (prePendingTerms == null || prePendingTerms.trim().length() == 0) {
                    prePendingTerms = String.valueOf(currentTermsId);
                } else {
                    prePendingTerms = prePendingTerms + "," + String.valueOf(currentTermsId);
                }
            }
            getRequest().setAttribute(Constants.PRE_PENDING_TERMS, prePendingTerms);
            getRequest().setAttribute(Constants.TERMS, termsOfUseDao.getTermsOfUse(currentTermsId));
            getRequest().setAttribute(Constants.DEPENDENCIES_TERMS_AGREED, dependenciesTermsAgreed);
            getRequest().setAttribute(Constants.DEPENDENCIES_TERMS_PENDING, dependenciesTermsPendding);
            return true;
        }
        
        if (penddingTermsGroup != null) {
            // there some pending terms of use group
            getRequest().setAttribute(Constants.TERMS_GROUP, penddingTermsGroup);
            getRequest().setAttribute(Constants.TERMS_GROUP_HAS_AGREED, penddingTermsGroupHasAgreed);
            getRequest().setAttribute(Constants.COMMON_RESOURCE_ROLES, getResourceRoleNames(penddingTermsRoleIds));
            return true;
        }
        
        List<List<TermsOfUse>> termsAgreedGlobal = new ArrayList<List<TermsOfUse>>();
        List<String> termsAgreedResourceRoles = new ArrayList<String>();
        boolean[] hasSelected = new boolean[allAgreedGroups.size()];
        for (int i = 0; i < allAgreedGroups.size(); i++) {
            if (hasSelected[i]) {
                continue;
            }
            hasSelected[i] = true;
            List<Integer> roles = new ArrayList<Integer>();
            roles.add(newRoleIds.get(i));
            for (int j = i + 1; j < allAgreedGroups.size(); j++) {
                if (termsGroupEqual(allAgreedGroups.get(i), allAgreedGroups.get(j))) {
                    hasSelected[j] = true;
                    roles.add(newRoleIds.get(j));
                }
            }
            termsAgreedGlobal.add(allAgreedGroups.get(i));
            termsAgreedResourceRoles.add(getResourceRoleNames(roles));
        }
        
        getRequest().setAttribute(Constants.TERMS_AGREED, termsAgreedGlobal);
        getRequest().setAttribute(Constants.TERMS_AGREED_ROLES, termsAgreedResourceRoles);
        
        return false;
    }
    
    /**
     * <p>Gets the <code>TermsOfUseDao</code> instance.</p>
     * 
     * @return the <code>TermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    protected TermsOfUseDao getTermsOfUseDao() throws Exception {
        if (termsOfUseDao == null) {
            termsOfUseDao = new TermsOfUseDaoImpl(getConfiguration(Constants.TERMS_OF_USE_DAO_NS));
        }
        return termsOfUseDao;
    }
    
    /**
     * <p>Gets the <code>UserTermsOfUseDao</code> instance.</p>
     * 
     * @return the <code>UserTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    protected UserTermsOfUseDao getUserTermsOfUseDao() throws Exception {
        if (userTermsOfUseDao == null) {
            userTermsOfUseDao = new UserTermsOfUseDaoImpl(getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS));
        }
        return userTermsOfUseDao;
    }
    
    /**
     * <p>Gets the <code>ProjectTermsOfUseDao</code> instance.</p>
     * 
     * @return the <code>ProjectTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    protected ProjectTermsOfUseDao getProjectTermsOfUseDao() throws Exception {
        if (projectTermsOfUseDao == null) {
            projectTermsOfUseDao = new ProjectTermsOfUseDaoImpl(getConfiguration(Constants.PROJECT_TERMS_OF_USE_DAO_NS));
        }
        return projectTermsOfUseDao;
    }
    
    /**
     * <p>Gets the configuration object by the configuration namespace.</p>
     * 
     * @param namespace the configuration namespace
     * @return the configuration object
     * @throws Exception if any error occurs
     */
    private ConfigurationObject getConfiguration(String namespace) throws Exception {
        return new ConfigurationFileManager(
                Constants.CONFIGURATION_FILE).getConfiguration(namespace)
                .getChild(namespace);
    }
}
