/*
 * CompList.java
 *
 * Created on August 12, 2005 by Cucu
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.eligibility.ContestEligibilityServiceLocator;

import java.util.Map;

/**
 * @author cucu
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
                throw new TCWebException("You don't have permission to view the scorecard.");                        
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

        // if has eligibility and user is not eligible
        if ((ContestEligibilityServiceLocator.getServices().hasEligibility(pid, false))
              && !ContestEligibilityServiceLocator.getServices().isEligible(userId, pid, false)) {
            return false;
        }
        
        // If the project isn't finished, only administrators can view the scorecard.
        if (projectInfo.getIntItem(0, "status_id") != 7
        		&& !((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {
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

}

