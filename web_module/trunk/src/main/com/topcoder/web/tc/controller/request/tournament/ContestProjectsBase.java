package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.StatBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class ContestProjectsBase extends StatBase {

    protected abstract String getContestPrefix();
        
    protected String getCommandName() {
        return "contest_projects";
    }

    protected String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/component/contestProjects.jsp";
    }

    protected void statProcessing() throws com.topcoder.web.common.TCWebException {
        String event = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID));
        Long eventId;
        try {
            eventId = Long.parseLong(event);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event id parameter.");                
        }

        getRequest().setAttribute("event_id", eventId);
    }

}
