/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Set;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.admin.Constants;

/**
 * <p>This class shows terms of use details and allow edition.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
 *   <ol>
 *     <li>Updated to use the Terms of Use DAO component instead of Terms of Use EJB.</li>
 *     <li>Added method {@link #loadTermsAgreeTypeList()} to load the list of terms agree-ability types.</li>
 *     <li>Added method {@link #loadTermsDependenciesList(String, String[])} to load the candidate and existing
 *     terms dependencies list.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, TCSASSEMBER
 * @version 1.2
 */
public class EditTerms extends Base {

    /**
     * This method will retrieve the existing terms of use (if needed) and present the edition form.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        if (tId!=null) {
            TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
            TermsOfUse terms = termsOfUseDao.getTermsOfUse(Long.parseLong(tId));

            if (terms != null) {
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, terms.getTermsOfUseTypeId());
                setDefault(Constants.TERMS, termsOfUseDao.getTermsOfUseText(terms.getTermsOfUseId()));
                setDefault(Constants.TERMS_TITLE, terms.getTitle());
                setDefault(Constants.TERMS_AGREE_TYPE_ID, terms.getAgreeabilityType().getTermsOfUseAgreeabilityTypeId());
                setDefault(Constants.TERMS_URL, terms.getUrl());
            } else {
                addError(Constants.TERMS_OF_USE_TYPE_ID, "Could not retrieve the specified terms of use.");
            }
        }
        loadTermsTypeList();
        loadTermsAgreeTypeList();
        loadTermsDependenciesList(tId, null);
        setNextPage("/editTerms.jsp");
        setIsNextPageInContext(true);
    }

    protected void loadTermsTypeList() throws Exception {
        Request r = new Request();
        r.setContentHandle("terms_of_use_type_list");
        getRequest().setAttribute("terms_of_use_type_list", getDataAccess().getData(r).get("terms_of_use_type_list"));
    }

    /**
     * This method will load the terms agree-ability types list.
     * 
     * @throws Exception if any error occurs
     * @since 1.2
     */
    protected void loadTermsAgreeTypeList() throws Exception {
        Request r = new Request();
        r.setContentHandle("terms_of_use_agree_type_list");
        getRequest().setAttribute("terms_of_use_agree_type_list", getDataAccess().getData(r).get("terms_of_use_agree_type_list"));
    }
    
    /**
     * This method will load the candidate and existing dependencies terms of use.
     * 
     * @param tid the id of dependent terms of use
     * @param depIds the IDs of the dependencies terms selected by user, null if not available. 
     * @throws Exception if any error occurs
     * @since 1.2
     */
    protected void loadTermsDependenciesList(String tid, String[] depIds) throws Exception {
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
        // the existing dependencies terms
        List<TermsOfUse> dependenciesTerms;
        // the candidate dependencies terms
        List<TermsOfUse> canBeDependenciesTerms;
        if (tid == null || tid.trim().length() == 0) {
            // when create a new terms of use, the candidate dependencies terms of use are all terms of use
            dependenciesTerms = new ArrayList<TermsOfUse>();
            canBeDependenciesTerms = termsOfUseDao.getAllTermsOfUse();
        } else {
            Long tidid = Long.parseLong(tid);
            dependenciesTerms = termsOfUseDao.getDependencyTermsOfUse(tidid);
            canBeDependenciesTerms = new ArrayList<TermsOfUse>();
            
            List<TermsOfUse> allTerms = termsOfUseDao.getAllTermsOfUse();
            Set<Long> depTerms = new HashSet<Long>();
            for (TermsOfUse term : dependenciesTerms) {
                depTerms.add(term.getTermsOfUseId());
            }
            
            for (TermsOfUse term : allTerms) {
                if (depTerms.contains(term.getTermsOfUseId())) {
                    continue;
                }
                if (String.valueOf(term.getTermsOfUseId()).equals(tid)) {
                    continue;
                }
                
                if (!isDependencyRelationShip(tidid, term.getTermsOfUseId())) {
                    // to avoid cycle dependency
                    canBeDependenciesTerms.add(term);
                }
            }
        }
        
        if (depIds != null) {
            List<TermsOfUse> candidateAndExist = new ArrayList<TermsOfUse>();
            candidateAndExist.addAll(dependenciesTerms);
            candidateAndExist.addAll(canBeDependenciesTerms);
            dependenciesTerms.clear();
            canBeDependenciesTerms.clear();
            
            Set<Long> depIdsSet = new HashSet<Long>();
            for (String depId : depIds) {
                depIdsSet.add(Long.parseLong(depId));
            }
            
            for (TermsOfUse terms : candidateAndExist) {
                if (depIdsSet.contains(terms.getTermsOfUseId())) {
                    dependenciesTerms.add(terms);
                } else {
                    canBeDependenciesTerms.add(terms);
                }
            }
        }
        getRequest().setAttribute("dependencies_terms_of_use", dependenciesTerms);
        getRequest().setAttribute("can_be_dependencies_terms_of_use", canBeDependenciesTerms);
    }
    
    /**
     * Checks whether a terms of use id dependent on another terms of use.
     * 
     * @param termsId1 the id of another terms of use
     * @param termsId2 the id of the first terms of use
     * @return true if termsId2 is dependent on termsId1
     * @throws Exception if any error occurs
     * @since 1.2
     */
    private boolean isDependencyRelationShip(long termsId1, long termsId2) throws Exception {
        Set<Long> visited = new HashSet<Long>();
        Queue<Long> queue = new LinkedList<Long>();
        queue.add(termsId2);
        
        TermsOfUseDao termsOfUseDao = getTermsOfUseDao();
        
        while (!queue.isEmpty()) {
            long tid = queue.remove();
            List<TermsOfUse> depTerms = termsOfUseDao.getDependencyTermsOfUse(tid);
            for (TermsOfUse term : depTerms) {
                if (term.getTermsOfUseId() == termsId1) {
                    return true;
                }
                if (!visited.contains(term.getTermsOfUseId())) {
                    visited.add(term.getTermsOfUseId());
                    queue.add(term.getTermsOfUseId());
                }
            }
        }
        return false;
    }
}
