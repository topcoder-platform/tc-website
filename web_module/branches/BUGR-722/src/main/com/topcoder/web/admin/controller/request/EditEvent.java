package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.VisaLetterEventDAO;
import com.topcoder.web.common.model.VisaLetterEvent;

/**
 * @author cucu
 */
public class EditEvent extends ShortHibernateProcessor {

    public static final String END_DATE = "end_date";
    public static final String START_DATE = "start_date";
    public static final String NAME = "name";
    public static final String CONTEST_ID = "cid";
    public static final String EID = "eid";

    protected void dbProcessing() throws Exception {

        // the user is editing (not adding!)
        if (getRequest().getParameter(EID) != null) {
            VisaLetterEventDAO eventDAO = DAOUtil.getFactory().getVisaLetterEventDAO();
            VisaLetterEvent event = eventDAO.find(new Long(getRequest().getParameter(EID)));

            setDefault(NAME, event.getName());
            setDefault(START_DATE, event.getStartDate());
            setDefault(END_DATE, event.getEndDate());
            setDefault(CONTEST_ID, event.getContestId());
        }

        Request r = new Request();
        r.setContentHandle("tournament_contests");
        getRequest().setAttribute("tournament_contests", new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tournament_contests"));

        setNextPage("/editEvent.jsp");
        setIsNextPageInContext(true);

    }


}
