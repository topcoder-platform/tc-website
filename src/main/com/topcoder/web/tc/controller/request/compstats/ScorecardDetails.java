/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.compstats;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

import javax.ejb.EJBException;

import com.cronos.termsofuse.dao.ProjectTermsOfUseDao;
import com.cronos.termsofuse.dao.TermsOfUsePersistenceException;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.tc.Constants;

/**
 * <p><strong>Purpose</strong>: This processor handle registration to a specific project.</p>
 *
 * <p>
 *   Version 1.1 (BUGR-3062) Change notes:
 *   <ol>
 *     <li>Added terms of use validation with the following logic:
 *         to determine if a user u has the required terms for a project p's scorecards: 
 *         for r in possible roles in a project (not just submitter or reviewer, any role):
 *            if u has all of the terms listed for role r in project p, return true
 *            return false.
 *     </li>
 *   </ol>
 * </p>
 *
 * @author cucu, pulky
 * @version 1.1
 */
public class ScorecardDetails extends Base {
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String projectId = StringUtils.checkNull(getRequest().getParameter("pj"));
            String userId = StringUtils.checkNull(getRequest().getParameter("uid"));
            String reviewerId = getRequest().getParameter("rid");

            r.setContentHandle("get_scorecard");
            r.setProperty("pj", projectId);
            r.setProperty("cr", userId);

            ResultSetContainer rscScorecard = null;

            if (reviewerId == null) {
                // screening
                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_screening_scorecard");
                reviewerId = rscScorecard.getStringItem(0, "reviewer_id");

            } else {
                // review
                r.setProperty("rw", reviewerId);
                rscScorecard = (ResultSetContainer) getDataAccess(true).getData(r).get("get_review_scorecard");
            }

            if (rscScorecard.isEmpty()) {
                throw new NavigationException("Sorry, invalid information specified in request.");
            }
            String scorecardId = rscScorecard.getStringItem(0, "scorecard_id");
            String scorecardTemplateId = rscScorecard.getStringItem(0, "scorecard_template_id");

            r = new Request();
            r.setContentHandle("scorecard_details");
            r.setProperty("pj", projectId);
            r.setProperty("scr", scorecardId);
            r.setProperty("scrt", scorecardTemplateId);

            Map result = getDataAccess(true).getData(r);

            // check if the project is completed
            ResultSetContainer projectInfo = (ResultSetContainer) result.get("project_info");
            if ((projectInfo.getIntItem(0, "status_id") != 4) &&
                    (projectInfo.getIntItem(0, "status_id") != 5) &&
                    (projectInfo.getIntItem(0, "status_id") != 7)) {
                throw new NavigationException("The project is not finished");

            }

            if (!isAuthorized(projectId, userId, getRequest().getParameter("rid"))) {
                throw new NavigationException("You don't have permission to view the scorecard.");                        
            }
            

            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("rid", reviewerId);
            getRequest().setAttribute("uid", userId);

            setNextPage("/compstats/scorecardDetails.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    private ResultSetContainer findProjects(String compId, String versId, String phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("find_projects");

        // Find all the projects that match with the component id, version and phase
        r.setProperty("compid", compId);
        r.setProperty("vr", versId);
        r.setProperty(Constants.PHASE_ID, phaseId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        return (ResultSetContainer) result.get("find_projects");
    }
    
    
    private boolean isAuthorized(String projId, String coderId, String reviewerId) throws Exception {
        long userId = getUser().getId();
        long pid = new Long(projId);
        
        // admins can view everything
        if (getSessionInfo().isAdmin()) {
            return true;
        }

        // you can always view your own scorecard
        if (coderId.equals("" + userId)) {
            return true;
        }
        
        // reviewers can view what they reviewed
        if (reviewerId != null && reviewerId.equals("" + userId)) {
            return true;
        }
        

        Request r = new Request();
        r.setContentHandle("comp_contest_details");

        r.setProperty("pj", projId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);

        ResultSetContainer projectInfo = (ResultSetContainer) result.get("project_info");
        ResultSetContainer dates = findProjects(projectInfo.getStringItem(0, "component_id"),
                                                projectInfo.getStringItem(0, "version_id"),
                                                projectInfo.getStringItem(0, "phase_id"));
        
        // Require a login to view custom project scorecards.
        // TODO: Include new generic catalogs.
        if (getUser().isAnonymous()
        		&& projectInfo.getIntItem(0, "category_id") != WebConstants.JAVA_CATALOG
        		&& projectInfo.getIntItem(0, "category_id") != WebConstants.NET_CATALOG
        		&& projectInfo.getIntItem(0, "category_id") != WebConstants.FLASH_CATALOG) {
            return false;
        }

        // check if the user has necessary terms agreed
        if (!hasRequiredTerms(pid, userId)) {
            return false;
        }

        // scorecards for unifished projects are not viewable
        if (projectInfo.getIntItem(0, "status_id") != 7) {
        	return false;
        }
        
        // check if there is a completed or suspended version of the component
        for (int i=0; i < dates.size(); i++) {
            if (dates.getIntItem(i, "status_id") == 7 || dates.getIntItem(i, "suspended_ind") == 1) {
                return true;
            }
        }
        
        // if trying to view a screening scorecard
        if (reviewerId == null) {
            
            // if he is a reviewer for the project, he can view screenings
            ResultSetContainer reviewers = (ResultSetContainer) result.get("reviewers_for_project");
            for (int i = 0; i < reviewers.size(); i++) {
                if (reviewers.getLongItem(i, "reviewer_id") == userId) {
                    return true;
                }
            }
        }
        
        return false;        
        
    }

    /**
     * Helper method to check if a user agreed do all terms in any associated project role 
     * 
     * @param projectId the projectId to look for
     * @param userId the userId to look for
     * @return true if the user agreed do all terms in any associated project role and false otherwise
     * @throws Exception if any error occurs
     * 
     * @since 1.1
     */
    private boolean hasRequiredTerms(long projectId, long userId) throws Exception {
        // check if the user agreed to all terms of use
        ProjectTermsOfUseDao projectRoleTermsOfUse = TermsOfUseUtil.getProjectTermsOfUseDao();
        UserTermsOfUseDao userTermsOfUse = TermsOfUseUtil.getUserTermsOfUseDao();

        ResultSetContainer roleIds = getPossibleRolesIds(projectId);
        for (ResultSetRow roleIdRow : roleIds) {
            if (checkTermsForRole(projectRoleTermsOfUse, userTermsOfUse, 
                roleIdRow.getIntItem("resource_role_id"), projectId, userId)) { 
                return true;
            }
        }
        
        return false;
    }

    /**
     * This method retrieves matching role ids for a specific project
     * 
     * @param projectId the projectId to look for
     *
     * @return a ResultSetContainer with matching role ids for a specific project
     * 
     * @throws Exception if any error occurs
     * 
     * @since 1.1
     */
    private ResultSetContainer getPossibleRolesIds(long projectId) throws Exception {
        Request r = new Request();
        r.setContentHandle("project_role_ids");

        // Find all the projects that match with the component id, version and phase
        r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));

        DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, false);
        Map<String, ResultSetContainer> result = dai.getData(r);
        return (ResultSetContainer) result.get("project_role_ids");
    }

    /**
     * Helper method to check if a user agreed to all terms associated to a particular role
     * 
     * @param projectRoleTermsOfUse the ProjectTermsOfUseDao used to call service
     * @param userTermsOfUse the UserTermsOfUseDao used to call service
     * @param roleIds the roleId to look for
     * @param projectId the projectId to look for
     * @param userId the userId to look for
     * @return true if the user agreed to all terms for the role or false otherwise
     * 
     * @throws EJBException if any error occurs during EJB call
     * @throws RemoteException if any error occurs during remote EJB call
     * @throws TermsOfUsePersistenceException if any error occurs when retrieving terms of use data
     * 
     * @since 1.1
     */
    private boolean checkTermsForRole(ProjectTermsOfUseDao projectRoleTermsOfUse, UserTermsOfUseDao userTermsOfUse, 
            int roleId, long projectId, long userId) throws EJBException, RemoteException, TermsOfUsePersistenceException {

        // iterate through all terms for this role
        // for (int roleId : roleIds) {
            Map<Integer, List<TermsOfUse>> tou = projectRoleTermsOfUse.getTermsOfUse((int) projectId, roleId, null);
            boolean valid = false;
            for (List<TermsOfUse> terms : tou.values()) {
                boolean ok = true;
                for (TermsOfUse term : terms) {
                    if (!userTermsOfUse.hasTermsOfUse(userId, term.getTermsOfUseId())) {
                        ok = false;
                        break;
                    }
                }
                if (ok) {
                    valid = true;
           //         break;
                }
            }
            if (!valid) {
                return false;
            }
        //}
        return true;
    }
}
