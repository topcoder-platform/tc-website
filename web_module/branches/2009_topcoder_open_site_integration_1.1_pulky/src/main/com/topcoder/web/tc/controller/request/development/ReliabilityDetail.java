package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 9, 2006
 */
public class ReliabilityDetail extends Base {
    protected void developmentProcessing() throws TCWebException {
        try {
            String phaseId = getRequest().getParameter(Constants.PHASE_ID);
            String userId = getRequest().getParameter(Constants.USER_ID);
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId) || String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId))
            {
                Request r = new Request();
                r.setContentHandle("reliability_detail");
                r.setProperty(Constants.PHASE_ID, phaseId);
                r.setProperty(Constants.USER_ID, userId);
                getRequest().setAttribute("contests", getDataAccess().getData(r).get("reliability_detail"));

                getRequest().setAttribute(Constants.PHASE_ID, phaseId);
                getRequest().setAttribute(Constants.CODER_ID, userId);
                getRequest().setAttribute(Constants.TYPE_KEY,
                        (getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE)) ?
                                HandleTag.DEVELOPMENT : HandleTag.DESIGN));


                setNextPage("/dev/reliabilityDetail.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("Invalid phase specified " + phaseId);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
