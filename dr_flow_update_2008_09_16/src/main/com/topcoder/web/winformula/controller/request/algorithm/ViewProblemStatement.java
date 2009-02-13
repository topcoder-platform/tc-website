package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;


public class ViewProblemStatement extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewProblemStatement.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            ProblemComponent problemComponent = getService().getProblemComponent(Constants.COMPONENT_ID_DEFAULT);
            int languageId = resolveLanguage();
            ProblemComponent pc [] = new ProblemComponent[] {problemComponent};
            Problem problem = new Problem();
            problem.setProblemTypeID(Problem.TYPE_LONG);
            problem.setProblemComponents(pc);
            getRequest().setAttribute("problem", problem);
            getRequest().setAttribute(CodingConstants.LANGUAGE_ID, BaseLanguage.getLanguage(languageId));
            String popup = getRequest().getParameter("popup");
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