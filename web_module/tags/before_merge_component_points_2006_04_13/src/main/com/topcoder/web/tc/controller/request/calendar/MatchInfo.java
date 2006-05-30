/*
 * MatchDetails.java
 *
 * Created on February 22, 2006, 12:20 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.calendar;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;

import javax.naming.Context;
import java.util.Map;
/**
 *
 * @author cstjohn
 */
public abstract class MatchInfo extends Base {
    private static Logger log = Logger.getLogger(MatchInfo.class);
    protected abstract void setForwardPage();  // defined by subclasses
    
    protected void businessProcessing() throws TCWebException {
        String result = null;
        Request dataRequest = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;
        Context ctx = null;

        try {
            String rd = StringUtils.checkNull(getRequest().getParameter("rd"));
            dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest = new Request();
            dataRequest.setContentHandle("schedule_srms");
            dataRequest.setProperty("rd", rd.trim());
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Schedule_SRMS");
            getRequest().setAttribute("rsc", rsc);

            ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow)rsc.get(0);
            String time = "";
            time += "&day=" + rsr.getStringItem("day");
            time += "&month=" + rsr.getStringItem("month");
            time += "&year=" + rsr.getStringItem("year");
            time += "&hour=" + rsr.getStringItem("hour");
            time += "&min=" + rsr.getStringItem("minute");
            time += "&sec=0";
            getRequest().setAttribute("time", time);
            
            /*
            getRequest().setAttribute("contest_name", rsr.getStringItem("contest_name"));
            getRequest().setAttribute("round_id", new Integer(rsr.getIntItem("round_id")));
            getRequest().setAttribute("path",  rsr.getStringItem("path"));
            getRequest().setAttribute("link",  rsr.getStringItem("link"));
            getRequest().setAttribute("width", new Integer(rsr.getIntItem("width")));
            getRequest().setAttribute("height", new Integer(rsr.getIntItem("height")));
            getRequest().setAttribute("time", time);
            getRequest().setAttribute("reg_begin", rsr.getStringItem("reg_begin"));
            getRequest().setAttribute("date", rsr.getStringItem("date"));
            getRequest().setAttribute("coding_begin", rsr.getStringItem("coding_begin"));
            getRequest().setAttribute("forum_id", new Integer(rsr.getIntItem("forum_id")));
            getRequest().setAttribute("reg_date", rsr.getStringItem("reg_date"));
            */
            
            /*ArrayList contests = dcHome.getAdContests();
            if (contests != null && contests.size() > 0) {
                schedTag.addTag(Data.getDynamicContestInfo(contests));
            }*/

            setForwardPage();
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }    
}
