package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coder.Coder;

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
            long rd = Long.parseLong(request.getParameter(Constants.ROUND_ID));

            long cid;
            if (request.getParameter(Constants.COMPONENT_ID) == null) {
                Request r = new Request();
                r.setContentHandle("long_contest_problem_component");
                r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
                cid = getDataAccess(false).getData(r).get("long_contest_problem_component")
                    .getIntItem(0, "component_id");
            } else {
                cid = Long.parseLong(request.getParameter(Constants.COMPONENT_ID));
            }
            int lid = JavaLanguage.ID;  // Default to Java
            if (!"".equals(StringUtils.checkNull(request.getParameter(Constants.LANGUAGE_ID)))) {
                lid = Integer.parseInt(request.getParameter(Constants.LANGUAGE_ID));
            } else {
                Request r = new Request();
                r.setContentHandle("long_contest_recent_compilation");
                r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
                r.setProperty(Constants.ROUND_ID, String.valueOf(rd));
                r.setProperty(Constants.CODER_ID, String.valueOf(getUser().getId()));
                ResultSetContainer rsc = getDataAccess().getData(r).get("long_contest_recent_compilation");
                if (!rsc.isEmpty()&&rsc.getItem(0, "language_id").getResultData()!=null) {
                    lid = rsc.getIntItem(0, "language_id");
                } else {
                    Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
                    try {
                        Integer lang = coder.getLanguageId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);
                        if (lang != null) {
                            lid = lang;
                        }
                    } catch (RowNotFoundException e) {
                        lid = JavaLanguage.ID;
                    }

                }

            }

            //todo consider adding some more security.  right now, the only thing
            //todo stopping someone from getting components from other rounds is the join
            //todo in the query below
            Request r = new Request();
            r.setContentHandle("long_problem");
            r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
            r.setProperty(Constants.ROUND_ID, String.valueOf(rd));
            DataAccessInt dataAccess = getDataAccess(false);
            Map<String, ResultSetContainer> m = dataAccess.getData(r);
            boolean started = m.get("long_contest_started").getBooleanItem(0, 0);
            //let admins see the problem even if the contest isn't open
            if (!started&&!getSessionInfo().isAdmin()) {
                throw new NavigationException("The contest has not started yet.");
            }
            ResultSetContainer rsc = new ResultSetContainer(m.get("long_problem_xml"), new RoundDisplayNameCalculator("display_name"));
            ResultSetContainer.ResultSetRow rr = rsc.getRow(0);
            request.setAttribute("infoRow", rr);

            String problemText = rr.getStringItem("component_text");
            //log.debug("test: " + problemText);
            StringReader reader = new StringReader(problemText);
            ProblemComponent pc [] = new ProblemComponent[1];
            pc[0] = new ProblemComponentFactory().buildFromXML(reader, true);
            Problem problem = new Problem();
            problem.setProblemTypeID(Problem.TYPE_LONG);
            problem.setProblemComponents(pc);
            request.setAttribute(Constants.PROBLEM_STATEMENT_KEY, problem);
            request.setAttribute(Constants.LANGUAGE_ID, BaseLanguage.getLanguage(lid));

            String popup = request.getParameter("popup");
            if ("true".equalsIgnoreCase(popup)) {
                setNextPage(Constants.PAGE_PROBLEM_STATEMENT_CONTENT);
            } else {
                setNextPage(Constants.PAGE_PROBLEM_STATEMENT);
            }
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Throwable e) {
            throw new TCWebException(e);
        }
    }
}