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
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.roundregistration.RoundRegistration;
import com.topcoder.web.ejb.roundregistration.RoundRegistrationLocal;
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
            RoundRegistrationLocal roundReg = (RoundRegistrationLocal) createLocalEJB(getInitialContext(), RoundRegistration.class);
            if (!isRoundOver(rd) && !roundReg.exists(getUser().getId(), rd) && !getSessionInfo().isAdmin()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
            long cid;
            if (request.getParameter(Constants.COMPONENT_ID) == null) {
                Request r = new Request();
                r.setContentHandle("long_contest_problem_component");
                r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
                cid = ((ResultSetContainer)
                        getDataAccess(false).getData(r).get("long_contest_problem_component"))
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
                ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("long_contest_recent_compilation");
                if (!rsc.isEmpty()&&rsc.getItem(0, "language_id").getResultData()!=null) {
                    lid = rsc.getIntItem(0, "language_id");
                } else {
                    Coder coder = (Coder)createEJB(getInitialContext(), Coder.class);
                    lid = coder.getLanguageId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME);
                }

            }

            Request r = new Request();
            r.setContentHandle("long_problem");
            r.setProperty(Constants.COMPONENT_ID, String.valueOf(cid));
            r.setProperty(Constants.ROUND_ID, String.valueOf(rd));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
            //let admins see the problem even if the contest isn't open
            if (!started&&!getSessionInfo().isAdmin()) {
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
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
