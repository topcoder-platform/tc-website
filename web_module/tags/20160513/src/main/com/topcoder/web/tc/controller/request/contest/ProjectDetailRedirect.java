package com.topcoder.web.tc.controller.request.contest;


import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * <p>
 * This class retrieves project id and redirect to the new
 * challenge details page
 * </p>
 *
 * @author Veve
 * @version 1.0
 */
public class ProjectDetailRedirect extends Base {

    /**
     * <p>
     * Process the request of displaying member profile page.
     * </p>
     */
    protected void developmentProcessing() throws TCWebException {
        try {
            String projectId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID));
            getRequest().setAttribute("projectId", Long.parseLong(projectId));

            if (projectId.equals("")) {
                throw new TCWebException("parameter " + Constants.PROJECT_ID + " expected.");
            }


            setNextPage("http://" + com.topcoder.shared.util.ApplicationServer.SERVER_NAME + "/challenge-details/" +
                    projectId + "/?type=develop");
            setIsNextPageInContext(false);


        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
