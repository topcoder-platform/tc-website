package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author Cucu
 */
public class ListDRPayments extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {        
        try {
            int desActiveCount = 0;
            int devActiveCount = 0;
            List<Contest> contests = new ArrayList<Contest>();
            
            if (getRequest().getParameter(Constants.STAGE_ID) != null) {
                int stageId = Integer.parseInt(getRequest().getParameter(Constants.STAGE_ID));
                 desActiveCount = getStageActiveProjects(stageId, 112);
                 if (desActiveCount == 0) {
                     contests.addAll(getStageContests(stageId, 112));
                 }
                 
                 devActiveCount = getStageActiveProjects(stageId, 113);
                 if (devActiveCount == 0) {
                     contests.addAll(getStageContests(stageId, 113));
                 }
                 
            } else if (getRequest().getParameter(Constants.SEASON_ID) != null) {
                
            } else {
                throw new TCWebException("Either " + Constants.STAGE_ID + " or " + Constants.SEASON_ID + " expected.");
            }
            
            
getRequest().setAttribute("contests", contests);
            getRequest().setAttribute("desActiveCount", desActiveCount);
            getRequest().setAttribute("devActiveCount", devActiveCount);
            setNextPage(INTERNAL_LIST_DR_PAYMENTS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    /**
     * Get the number of active projects for a stage and a phase
     * 
     * @param stageId
     * @param phaseId
     * @return
     * @throws Exception
     */
    private int getStageActiveProjects(int stageId, int phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_stage_active_projects");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_stage_active_projects");

        return rsc.getIntItem(0, 0);        
    }
    
    private List<Contest> getStageContests(int stageId, int phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contests_for_stage");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_contests_for_stage");

        List<Contest> contests = new ArrayList<Contest>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            contests.add(new Contest(row.getIntItem("contest_id"), row.getIntItem("contest_type_id"), row.getStringItem("contest_name")));
        }
        
        return contests;
        
    }
    
    /**
     * Class to hold data of a contest and its results.
     * 
     * @author Cucu
     *
     */
    public static class Contest {
        private int id;
        private int typeId;
        private String name;
        private List<ContestResult> results;
        
        public Contest(int id, int typeId, String name) {
            this.id = id;
            this.typeId = typeId;
            this.name = name;
            results = new ArrayList<ContestResult>();
        }

        public int getId() {
            return id;
        }

        public int getTypeId() {
            return typeId;
        }

        public String getName() {
            return name;
        }

        public List<ContestResult> getResults() {
            return results;
        }
        
        public void addResult(ContestResult result) {
            results.add(result);
        }
        
    }
    
    public static class ContestResult {
    
    }
    
}

