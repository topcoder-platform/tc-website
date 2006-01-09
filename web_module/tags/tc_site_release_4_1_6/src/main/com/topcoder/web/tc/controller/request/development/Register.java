package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 6, 2006
 */
public class Register extends ViewRegistration {
    protected void developmentProcessing() throws TCWebException {

        try {
            //check if user can do the project (there's like 10 things to check.
            //if they can't, give them error message
            //if they can, check if they are registered for the tco
              //if they are not registered,
                //if they don't have final confirm flag
                  //add a flag to the request and send them to a confirm page
            //register and go to success page
            validation();

            boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
            if (agreed) {
                boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                if (isEligible) {
                    if (isTournamentTime()) {
                        boolean isRegisteredForTournament = getRequest().getAttribute("notRegistered")==null;
                        boolean isConfirmed = getRequest().getParameter("confirm")!=null;
                        if (isRegisteredForTournament || (!isRegisteredForTournament && isConfirmed)) {
                            register();
                            setNextPage("/dev/regSuccess.jsp");
                            setIsNextPageInContext(true);
                        } else {
                            setNextPage("/dev/tournamentConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        register();
                        setNextPage("/dev/regSuccess.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    setNextPage("/dev/message.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                getRequest().setAttribute("questionInfo", buildQuestions());
                setNextPage("/dev/regTerms.jsp");
                setNextPage("true");
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void register() {

    }
}
