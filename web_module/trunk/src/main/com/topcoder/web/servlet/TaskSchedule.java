package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;


public final class TaskSchedule {

    private static Logger log = Logger.getLogger(TaskSchedule.class);

    static String process(HttpServletRequest request,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            RecordTag schedTag = new RecordTag("SCHEDULE");
            DataCache dcHome = Cache.get();

            ArrayList rounds = dcHome.getRounds();
            if (rounds != null && rounds.size() > 0) {
                schedTag.addTag(RecordTag.getListXML("Rounds", rounds));
            }

            ArrayList contests = dcHome.getAdContests();
            if (contests != null && contests.size() > 0) {
                schedTag.addTag(Data.getDynamicContestInfo(contests));
            }

            String id = request.getParameter("ContestId");

            if (id == null)
                id = Conversion.checkNull(request.getParameter("RoundId"));

            schedTag.addTag(new ValueTag("RoundId", id));
            document.addTag(schedTag);
            result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
        } catch (NavigationException ne) {
            log.error("TaskSchedule:ERROR:\n" + ne);
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskSchedule:process:");
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


}
