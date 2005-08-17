package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.util.Cache;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.util.Data;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Map;


public final class TaskSchedule {

    private static Logger log = Logger.getLogger(TaskSchedule.class);

    static String process(HttpServletRequest request,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        Request dataRequest = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        Map resultMap = null;
        Context ctx = null;

        try {

            RecordTag schedTag = new RecordTag("SCHEDULE");
            DataCache dcHome = Cache.get();

            String roundids = Conversion.checkNull(request.getParameter("rds"));
            String sortCol = request.getParameter("sc");
            String sortDir = request.getParameter("sdir");
            if (!roundids.equals("")) {
                ctx = TCContext.getInitial();
                dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                dataRequest = new Request();
                dataRequest.setContentHandle("tourney_advancers");
                dataRequest.setProperty("rds", roundids.trim());
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Tourney_Advancers");
                if (sortCol != null && sortDir != null)
                    rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc"));
                schedTag.addTag(rsc.getTag("Advancers", "Advancer"));
            }

            String roundId = Conversion.checkNull(request.getParameter("RoundId"));
            schedTag.addTag(new ValueTag("RoundId", roundId));

            String command = Conversion.checkNull(request.getParameter("c"));
            if (command.equals("srm") || command.equals("srm_rules")) {
                ctx = TCContext.getInitial();
                dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
                dataRequest = new Request();
                dataRequest.setContentHandle("schedule_srms");
                dataRequest.setProperty("rd", roundId.trim());
                resultMap = dai.getData(dataRequest);
                rsc = (ResultSetContainer) resultMap.get("Schedule_SRMS");
                schedTag.addTag(rsc.getTag("Round", "Details"));
            } else {
                ArrayList rounds = dcHome.getRounds();
                if (rounds != null && rounds.size() > 0) {
                    schedTag.addTag(RecordTag.getListXML("Rounds", rounds));
                }
            }

            ArrayList contests = dcHome.getAdContests();
            if (contests != null && contests.size() > 0) {
                schedTag.addTag(Data.getDynamicContestInfo(contests));
            }


            document.addTag(schedTag);
//log.debug(document.getXML(2));

            result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
        } catch (NavigationException ne) {
            log.error("TaskSchedule:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            throw new NavigationException(e);
        }
        return result;
    }


}
