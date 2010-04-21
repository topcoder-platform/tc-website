/*
 * ViewExampleResults
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.PredictionResultTransformer;
import com.topcoder.web.winformula.controller.PredictionsHelper;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionSummary;

/**
 * @author Diego Belfer (Mural), Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewExampleResults extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewExampleResults.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            
            String selectedWeek = StringUtils.checkNull(request.getParameter("week"));

            int coderId = getUserID();
            if (!isUserRegisteredInContest(getContestID(), coderId)) {
                registrationNeeded("You need to be registered in order to view your results.");
                return;
            }
            
            int roundId = Integer.parseInt(request.getParameter(CodingConstants.ROUND_ID));
            setDefault(CodingConstants.ROUND_ID, new Integer(roundId));
            log.debug("coder: " + coderId + " user " + getUser().getId());
            Integer subnum = getService().getLastSubmissionNumberFor(roundId, coderId);
            LongTestResult[] results = LongContestServicesLocator.getService().getLongTestResults(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, LongContestServices.LONG_TEST_RESULT_TYPE_NON_SYSTEM);
            
            PredictionSummary summary = null;
            LongTestResult result = null;
            List<ListSelectTag.Option> weeks;
            if (results != null && results.length > 0) {
                weeks = new ArrayList<ListSelectTag.Option>(results.length);
                result = results[0];
                Object o = result.getResultObject();

                // process predictions
                summary = resolvePredictions(o);
                List<Prediction> predictions = summary.getPredictions();

                if (predictions.size() > 0) {
                    int weekIndex = 0;
                    int i = 0;
                    for (Prediction p : predictions) {
                        weeks.add(new ListSelectTag.Option(String.valueOf(p.getWeek()), "Week " + p.getWeek(), String.valueOf(p.getWeek()).equals(selectedWeek)));
                        if (String.valueOf(p.getWeek()).equals(selectedWeek)) {
                            weekIndex = i;
                        }
                        i++;
                    }
                    Prediction p = predictions.get(weekIndex);
                    PredictionsHelper.sortResult(request, p);
                    result.setResultObject(p);
                } else  {
                    log.info("prediction for test case 0 was null or empty");
                    weeks = Collections.emptyList();
                }
            } else {
                log.info("results is null or empty");
                weeks = Collections.emptyList();
            }
            
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            
            // sort result

            request.setAttribute("summary", summary);
            request.setAttribute("result", result);
            request.setAttribute("weeks", weeks);
            request.setAttribute(CodingConstants.ROUND_ID, new Integer(roundId));
            request.setAttribute(CodingConstants.SUBMISSION_NUMBER, subnum);
            setNextPage(Constants.PAGE_VIEW_EXAMPLE_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    

    private  PredictionSummary resolvePredictions(Object o) {
        return PredictionResultTransformer.transformPredictions(o);
    }
}

