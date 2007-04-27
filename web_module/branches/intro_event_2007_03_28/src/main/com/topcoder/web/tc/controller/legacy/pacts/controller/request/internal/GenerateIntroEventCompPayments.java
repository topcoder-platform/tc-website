package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

public class GenerateIntroEventCompPayments extends BaseProcessor implements PactsConstants {

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
            
           PrizeInfo pi = new PrizeInfo(row.getIntItem("place"), row.getDoubleItem("prize_amount"), 7545675, false); 
           ci.addPrize(pi); 
        }
        
        getRequest().setAttribute("completeContests",completeContests); 
        getRequest().setAttribute("incompleteContests",incompleteContests); 
        setNextPage(INTERNAL_GENERATE_INTRO_EVENT_COMPONENT_PAYMENTS);
        
        setIsNextPageInContext(true);

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
        private int place;
        private double amount;
        private long winnerId;
        boolean isPaid;
        
        
        public PrizeInfo(int place, double amount, long winnerId, boolean isPaid) {
            super();
            this.place = place;
            this.amount = amount;
            this.winnerId = winnerId;
            this.isPaid = isPaid;
        }
        public double getAmount() {
            return amount;
        }
        public boolean isPaid() {
            return isPaid;
        }
        public int getPlace() {
            return place;
        }
        public long getWinnerId() {
            return winnerId;
        }
        
        public int compareTo(Object o) {
            return new Integer(((PrizeInfo) o).getPlace()).compareTo(getPlace());
        }
        
        @Override
        public boolean equals(Object obj) {
            if (!(obj instanceof PrizeInfo)) return false;
            
            return ((PrizeInfo) obj).getPlace() == getPlace();
        }
        
        
        
    }

}
