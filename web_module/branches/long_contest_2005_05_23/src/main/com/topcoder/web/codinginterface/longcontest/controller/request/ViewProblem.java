package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.common.web.render.ProblemRenderer;
import java.io.StringReader;


public class ViewProblem extends Base{
    protected static final Logger log = Logger.getLogger(ViewProblem.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            CacheClient cc = null;
            String html = null;
            int cid = Integer.parseInt(request.getParameter(Constants.COMPONENT_ID));
            int rd = Integer.parseInt(request.getParameter(Constants.ROUND_ID));
            boolean hasCacheConnection = true;
            boolean isAdmin = false;//getUser().isAdmin();  TODO fix this
            String key = "LongProblem_"+rd+"_"+cid;
            try {
                cc = CacheClientFactory.createCacheClient();
                html = (String)cc.get(key);
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                hasCacheConnection = false;
            }
            if(html == null){
                Request r = new Request();
                r.setContentHandle("long_problem");
                DataAccessInt dataAccess = getDataAccess(false);
                Map m = dataAccess.getData(r);
                ResultSetContainer rsc = (ResultSetContainer) m.get("long_problem_xml");
                ResultSetContainer.ResultSetRow rr = null;
                rr = rsc.getRow(0);
                String className = rr.getItem("class_name").toString();
                String problemText = rr.getItem("problem_text").toString();
                StringReader reader = new StringReader(problemText);
                ProblemComponent pc [] = new ProblemComponent[1];
                pc[0] = new ProblemComponentFactory().buildFromXML(reader, true);
                Problem problem = new Problem();
                problem.setProblemComponents(pc);
                ProblemRenderer pr = new ProblemRenderer(problem);
                //pr.setTdclass("statText");
                html = pr.toHTML(JavaLanguage.JAVA_LANGUAGE);
                if(hasCacheConnection){
                    cc.set(key,html, 1000*60*Constants.PROBLEM_REFRESH);
                }
                setNextPage(Constants.PROBLEM_STATEMENT_JSP);
                setIsNextPageInContext(true);
            }
            request.setAttribute(Constants.PROBLEM_STATEMENT_KEY,html);
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
