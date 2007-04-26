package com.topcoder.web.admin.controller.request;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;

public class CreateIntroEventCompPayments extends ShortHibernateProcessor {

    @Override
    protected void dbProcessing() throws Exception {
        Long eid = new Long(getRequest().getParameter("eid"));
        
        Event event = DAOUtil.getFactory().getEventDAO().find(eid);
        
        Request r = new Request();
        r.setContentHandle("event_contest_status");
        
        r.setProperty("eid", eid + "");
        ResultSetContainer status = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("event_contest_status");
        
        List<ContestInfo> completeContests = new ArrayList<ContestInfo>();
        List<ContestInfo> incompleteContests = new ArrayList<ContestInfo>();
        for (ResultSetContainer.ResultSetRow row : status) {
            ContestInfo ci = new ContestInfo(row.getLongItem("contest_id"), row.getStringItem("contest_name"),
                    row.getBooleanItem("time_over"), row.getIntItem("active_projects"));
            
            if (ci.isTimeOver() && ci.getActiveProjects() == 0) {
                completeContests.add(ci);
            } else {
                incompleteContests.add(ci);
            }
        }
        
        getRequest().setAttribute("completeContests",completeContests); 
        getRequest().setAttribute("incompleteContests",incompleteContests); 
        getRequest().setAttribute("event",event); 
        setNextPage("/createIntroEventCompPayments.jsp");
        
        setIsNextPageInContext(true);

    }

    public class ContestInfo {
        private long id;
        private String name;
        private boolean timeOver;
        private int activeProjects;
        
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
        
        
    }
}
