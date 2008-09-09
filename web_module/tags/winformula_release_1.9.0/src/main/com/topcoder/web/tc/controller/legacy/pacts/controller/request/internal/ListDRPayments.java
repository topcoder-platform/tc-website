package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import java.util.ArrayList;
import java.util.List;

/**
 * It takes either a stage or season as a parameter, finds the contests for it, and displays
 * a list of the people that won money for the contest.  It checks if the user was already 
 * paid for it, and if not, it shows a check box so that it can be paid.
 * If projects are still active for the contest, it will display a message and it won't 
 * be possible to pay it.
 * 
 * @author Cucu
 */
public class ListDRPayments extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {        
        try {
            int periodId = 0;
            int desActiveCount = 0;
            int devActiveCount = 0;
            int asmActiveCount = 0;
            List<Contest> contests = new ArrayList<Contest>();
            
            if (getRequest().getParameter(Constants.STAGE_ID) != null) {
                 periodId = Integer.parseInt(getRequest().getParameter(Constants.STAGE_ID));
                 desActiveCount = getStageActiveProjects(periodId, 1);
                 if (desActiveCount == 0) {
                     contests.addAll(getStageContests(periodId, 1));
                 }
                 
                 devActiveCount = getStageActiveProjects(periodId, 2);
                 if (devActiveCount == 0) {
                     contests.addAll(getStageContests(periodId, 2));
                 }
                 
                 asmActiveCount = getStageActiveProjects(periodId, 14);
                 if (asmActiveCount == 0) {
                     contests.addAll(getStageContests(periodId, 14));
                 }
                 
                 getRequest().setAttribute(Constants.STAGE_ID, getRequest().getParameter(Constants.STAGE_ID));
                 
            } else if (getRequest().getParameter(Constants.SEASON_ID) != null) {
                periodId = Integer.parseInt(getRequest().getParameter(Constants.SEASON_ID));
                desActiveCount = getSeasonActiveProjects(periodId, 112);
                if (desActiveCount == 0) {
                    contests.addAll(getSeasonContests(periodId, 112));
                }
                
                devActiveCount = getSeasonActiveProjects(periodId, 113);
                if (devActiveCount == 0) {
                    contests.addAll(getSeasonContests(periodId, 113));
                }

                getRequest().setAttribute(Constants.SEASON_ID, getRequest().getParameter(Constants.SEASON_ID));

            } else {
                throw new TCWebException("Either " + Constants.STAGE_ID + " or " + Constants.SEASON_ID + " expected.");
            }
            
            for (Contest c : contests) {
                loadResults(c);
                fillPaid(c, periodId);
            }
            
            getRequest().setAttribute("contests", contests);
            getRequest().setAttribute("desActiveCount", desActiveCount);
            getRequest().setAttribute("devActiveCount", devActiveCount);
            getRequest().setAttribute("asmActiveCount", asmActiveCount);
            
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
     * @param projectCategoryId
     * @return
     * @throws Exception
     */
    private int getStageActiveProjects(int stageId, int projectCategoryId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_stage_active_projects");
        r.setProperty(Constants.PROJECT_TYPE_ID, projectCategoryId + "");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_stage_active_projects"); 

        return rsc.getIntItem(0, 0);        
    }

    /**
     * Get the number of active projects for a season and a phase
     * 
     * @param seasonId
     * @param phaseId
     * @return
     * @throws Exception
     */
    private int getSeasonActiveProjects(int seasonId, int phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_season_active_projects");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        r.setProperty(Constants.SEASON_ID, seasonId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_season_active_projects"); 

        return rsc.getIntItem(0, 0);        
    }
    
    
    /**
     * Get the contests for the specified stage.
     * 
     * @param stageId
     * @param projectCategoryId
     * @return
     * @throws Exception
     */
    private List<Contest> getStageContests(int stageId, int projectCategoryId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contests_for_stage");
        r.setProperty(Constants.PROJECT_TYPE_ID, projectCategoryId + "");
        r.setProperty(Constants.STAGE_ID, stageId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_contests_for_stage");

        List<Contest> contests = new ArrayList<Contest>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            contests.add(new Contest(row.getIntItem("contest_id"), row.getIntItem("contest_type_id"), row.getStringItem("contest_name")));
        }
        
        return contests;
        
    }

    /**
     * Get the contests for the specified season.
     * 
     * @param seasonId
     * @param phaseId
     * @return
     * @throws Exception
     */
    private List<Contest> getSeasonContests(int seasonId, int phaseId) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contests_for_season");
        r.setProperty(Constants.PHASE_ID, phaseId + "");
        r.setProperty(Constants.SEASON_ID, seasonId + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_contests_for_season");

        List<Contest> contests = new ArrayList<Contest>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            contests.add(new Contest(row.getIntItem("contest_id"), row.getIntItem("contest_type_id"), row.getStringItem("contest_name")));
        }
        
        return contests;
        
    }

    /**
     * In the contest results list of the contest, fills the payment id's of the prizes that are already paid.
     * 
     * @param contest
     * @param periodId
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    private void fillPaid(Contest contest, int periodId) throws Exception {
        DataInterfaceBean dib = new DataInterfaceBean();
        
        int paymentType;
        if (contest.getTypeId() == Constants.CONTEST_TYPE_DR_STAGE) {
            paymentType = DIGITAL_RUN_PRIZE_PAYMENT;
            
        } else  if (contest.getTypeId() == Constants.CONTEST_TYPE_DR_TOP_PERFORMERS) {
            paymentType = DIGITAL_RUN_TOP_THIRD_PAYMENT;
            
        } else  if (contest.getTypeId() == Constants.CONTEST_TYPE_DR_ROOKIE) {
            paymentType = DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT;
            
        } else {
            throw new Exception("Invalid contest type: " + contest.getTypeId());
        }
            
        List<BasePayment> l = dib.findPayments(paymentType, periodId);

        for (ContestResult cr :contest.getResults()) {
            for (BasePayment payment : l) {                
                if (cr.getCoderId() == payment.getCoderId()) {
                    cr.setPaymentId(payment.getId());
                }
            }
        }
    }
    

    /**
     * Loads the results of a contest in the contest object.
     * 
     * @param contest
     * @throws Exception
     */
    private void loadResults(Contest contest) throws Exception {
        Request r = new Request();
        r.setContentHandle("dr_contest_payments");
        r.setProperty(Constants.CONTEST_ID, contest.getId() + "");
        
        ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME).getData(r).get("dr_contest_payments");
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            // round the amount to 2 decimals
            double prize = Math.round(row.getDoubleItem("prize") * 100) / 100.0;
            ContestResult cr = new ContestResult(row.getIntItem("place"), row.getLongItem("coder_id"), prize);
            
            contest.addResult(cr);
        }
        
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
        private double totalPrizes = 0.0;
        
        public double getTotalPrizes() {
            return totalPrizes;
        }

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
            totalPrizes += result.getPrize();
        }
        
    }
    
    /**
     * Class to hold a result for a contest.
     * 
     * @author Cucu
     */
    public static class ContestResult {
        int place;
        long coderId;
        double prize;
        Long paymentId;
        
        
        public ContestResult(int place, long coderId, double prize) {
            super();
            this.place = place;
            this.coderId = coderId;
            this.prize = prize;
        }
        
        public Long getPaymentId() {
            return paymentId;
        }
        public void setPaymentId(Long paymentId) {
            this.paymentId = paymentId;
        }
        public int getPlace() {
            return place;
        }
        public double getPrize() {
            return prize;
        }
        public long getCoderId() {
            return coderId;
        }
        
    }
    
}

