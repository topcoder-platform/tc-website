package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.pacts.IntroEventCompPayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

public class ListIntroEventCompPayments extends BaseProcessor implements PactsConstants {

    @Override
    protected void businessProcessing() throws Exception {
        Long eid = new Long(getRequest().getParameter("eid"));
               
        DataInterfaceBean dib = new DataInterfaceBean();
        ResultSetContainer rsc = dib.getContestsInfo(eid);
        Map<Long, ContestInfo> contestsMap = new  HashMap<Long, ContestInfo>();
        
        List<ContestInfo> completeContests = new ArrayList<ContestInfo>();
        List<ContestInfo> incompleteContests = new ArrayList<ContestInfo>();
        
        for (ResultSetContainer.ResultSetRow row : rsc) {
            ContestInfo ci = contestsMap.get(row.getLongItem("contest_id")); 
            
            if (ci == null) {
                ci = new ContestInfo(row.getLongItem("contest_id"), row.getStringItem("contest_name"),
                    row.getBooleanItem("time_over"), row.getIntItem("active_projects"));
            
                contestsMap.put(row.getLongItem("contest_id"), ci);
                if (ci.isTimeOver() && ci.getActiveProjects() == 0) {
                    completeContests.add(ci);
                } else {
                    incompleteContests.add(ci);
                    continue;
                }
                                
           }
            
           PrizeInfo pi = new PrizeInfo(row.getLongItem("contest_prize_id"), row.getIntItem("place"), row.getDoubleItem("prize_amount")); 
           ci.addPrize(pi); 
        }

        for (ContestInfo ci : completeContests) {
            fillResults(ci);
            fillPaid(ci);
        }

        getRequest().setAttribute("completeContests",completeContests); 
        getRequest().setAttribute("incompleteContests",incompleteContests); 
        setNextPage(INTERNAL_LIST_INTRO_EVENT_COMPONENT_PAYMENTS);
        
        setIsNextPageInContext(true);

    }

    private void fillResults(ContestInfo ci) throws Exception {
        Request r = new Request();
        r.setContentHandle("intro_event_comp_results");
        r.setProperty("ct", ci.getId() + "");
        
        ResultSetContainer rsc = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("intro_event_comp_results");
                
        int i = 0;
        for (PrizeInfo pi : ci.getPrizes()) {
            if (i >= rsc.size() || rsc.getItem(i, "points").getResultData() == null) break;
            
            pi.setWinnerId(rsc.getLongItem(i, "user_id"));
            pi.setPoints(rsc.getIntItem(i, "points"));
            i++;
        }      
    }

    @SuppressWarnings("unchecked")
    private void fillPaid(ContestInfo ci) throws Exception {
        DataInterfaceBean dib = new DataInterfaceBean();
        List<IntroEventCompPayment> l = dib.findPayments(INTRO_EVENT_COMP_PAYMENT, ci.getId());

        for (PrizeInfo pi :ci.getPrizes()) {
            if (pi.getWinnerId() != null) {
                for (IntroEventCompPayment payment : l) {
                    if (pi.getWinnerId() == payment.getCoderId()) {
                        pi.setPaymentId(payment.getId());
                    }
                }
            }
        }
        log.debug("end fillPaid");
    }
    
    public class ContestInfo {
        private long id;
        private String name;
        private boolean timeOver;
        private int activeProjects;
        private Set<PrizeInfo> prizes = new TreeSet<PrizeInfo>();
        
        public ContestInfo(long id, String name, boolean timeOver, int activeProjects) {
            super();
            this.id = id;
            this.name = name;
            this.timeOver = timeOver;
            this.activeProjects = activeProjects;
        }

        public int getActiveProjects() {
            return activeProjects;
        }

        public long getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public boolean isTimeOver() {
            return timeOver;
        }
        
        public void addPrize(PrizeInfo pi) {
            prizes.add(pi);
        }
        
        public Set<PrizeInfo> getPrizes() {
            return prizes;
        }      
    }
    
    public class PrizeInfo implements Comparable {        
        private Long id = null;
        private int place;
        private double amount;
        private Long winnerId = null;
        private Integer points =null;
        private Long paymentId = null;
        private boolean passedMinimum;
        
        public PrizeInfo(long id, int place, double amount) {
            super();
            this.id = id;
            this.place = place;
            this.amount = amount;
        }
        public double getAmount() {
            return amount;
        }
        public int getPlace() {
            return place;
        }
        public Long getWinnerId() {
            return winnerId;
        }
        
        public int compareTo(Object o) {
            return new Integer(getPlace()).compareTo(((PrizeInfo) o).getPlace());
        }
        
        @Override
        public boolean equals(Object obj) {
            if (!(obj instanceof PrizeInfo)) return false;
            
            return ((PrizeInfo) obj).getPlace() == getPlace();
        }
        
        public Integer getPoints() {
            return points;
        }
        public void setPoints(Integer points) {
            this.points = points;
            passedMinimum = points >= INTRO_EVENT_MIN_POINTS;
        }
        public void setWinnerId(Long winnerId) {
            this.winnerId = winnerId;
        }
        
        public Long getPaymentId() {
            return paymentId;
        }
        
        public void setPaymentId(Long paymentId) {
            this.paymentId = paymentId;
        }
        public boolean isPassedMinimum() {
            return passedMinimum;
        }
        public Long getId() {
            return id;
        }
        
        
        
    }

}
