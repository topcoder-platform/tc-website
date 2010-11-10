package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.server.ejb.TestServices.LongContestServicesException;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongSubmissionData;
import com.topcoder.shared.i18n.MessageProvider;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;


public class ViewProblemSolution extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ViewProblemSolution.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            int roundId = Integer.parseInt(request.getParameter(CodingConstants.ROUND_ID));
            int submissionNumber = Integer.parseInt(request.getParameter(CodingConstants.SUBMISSION_NUMBER));
            int coderId = getUserID();
            
            if (!isUserRegisteredInContest(getContestID(), coderId)) {
                registrationNeeded("You need to be registered in order to view your solution.");
                return;
            }
            
            log.debug("coder: " + coderId + " by user " + getUser().getId());
            
            LongSubmissionData submission = LongContestServicesLocator.getService().getSubmission(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, false, submissionNumber);
            request.setAttribute("submission", submission);
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            setNextPage(Constants.PAGE_PROBLEM_SOLUTION);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (LongContestServicesException e) {
            throw new NavigationException(MessageProvider.getText(e.getLocalizableMessage()), e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
