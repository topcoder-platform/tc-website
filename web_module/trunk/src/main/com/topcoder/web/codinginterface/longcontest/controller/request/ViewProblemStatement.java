package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;
import com.topcoder.web.common.render.ProblemRenderer;

import java.io.StringReader;
import java.util.Map;


public class ViewProblemStatement extends Base {
    protected static final Logger log = Logger.getLogger(ViewProblemStatement.class);

    /**
     * @throws com.topcoder.web.common.TCWebException
     *
     */
    protected void longContestProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            TCRequest request = getRequest();
            CacheClient cc = null;
            String html = null;
            int cid;
            if (request.getParameter(Constants.COMPONENT_ID) == null) {
                Request r = new Request();
                r.setContentHandle("long_contest_problem_component");
                r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
                cid = ((ResultSetContainer)
                        getDataAccess(false).getData(r).get("long_contest_problem_component"))
                        .getIntItem(0, "component_id");
            } else {
                cid = Integer.parseInt(request.getParameter(Constants.COMPONENT_ID));
            }
            int rd = Integer.parseInt(request.getParameter(Constants.ROUND_ID));
            int lid = JavaLanguage.ID;  // Default to Java
            if (!"".equals(StringUtils.checkNull(request.getParameter(Constants.LANGUAGE_ID)))) {
                lid = Integer.parseInt(request.getParameter(Constants.LANGUAGE_ID));
            }
            boolean hasCacheConnection = true;
            String key = "LongProblem_" + rd + "_" + cid + "_" + lid;
            try {
                cc = CacheClientFactory.createCacheClient();
                html = (String) cc.get(key);
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                hasCacheConnection = false;
            }
            if (html == null) {
                Request r = new Request();
                r.setContentHandle("long_problem");
                r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
                r.setProperty(Constants.ROUND_ID, String.valueOf(rd));
                DataAccessInt dataAccess = getDataAccess(false);
                Map m = dataAccess.getData(r);
                boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
                if (!started) {
                    throw new NavigationException("The contest has not started yet.");
                }
                ResultSetContainer rsc = null;
                rsc = (ResultSetContainer) m.get("long_problem_xml");
                ResultSetContainer.ResultSetRow rr = null;
                rr = rsc.getRow(0);
                String problemText = rr.getStringItem("component_text");
                //log.debug("test: " + problemText);
                StringReader reader = new StringReader(problemText);
                ProblemComponent pc [] = new ProblemComponent[1];
                pc[0] = new ProblemComponentFactory().buildFromXML(reader, true);
                Problem problem = new Problem();
                problem.setProblemComponents(pc);
                ProblemRenderer pr = new ProblemRenderer(problem);
                //pr.setTdclass("statText");
                html = pr.toHTML(BaseLanguage.getLanguage(lid));
                if (hasCacheConnection) {
                    cc.set(key, html, 1000 * 60 * Constants.PROBLEM_REFRESH);
                }
            }
            request.setAttribute(Constants.PROBLEM_STATEMENT_KEY, html);

            String popup = request.getParameter("popup");
            if ("true".equalsIgnoreCase(popup)) {
                setNextPage(Constants.PAGE_PROBLEM_STATEMENT_CONTENT);
            } else {
                setNextPage(Constants.PAGE_PROBLEM_STATEMENT);
            }
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
