package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.SoftwareComponent;

/**
 * User: dok
 * Date: Aug 20, 2004
 */
public class ReviewBoard extends Base {

    protected void businessProcessing() throws TCWebException {
        String phaseId = getRequest().getParameter(Constants.PHASE_ID);
        if (phaseId.equals(String.valueOf(SoftwareComponent.DESIGN_PHASE)) || phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) {
            Request r = new Request();
            r.setContentHandle("review_board_members");
            r.setProperty(Constants.PHASE_ID, phaseId);
            try {
                DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
                getRequest().setAttribute("memberList", dai.getData(r).get("review_board_members"));
                if (phaseId.equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))) {
                    setNextPage("/review_board/design.jsp");
                } else {
                    setNextPage("/review_board/development.jsp");
                }
                setIsNextPageInContext(true);

            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }

        } else {
            throw new NavigationException("Invalid phase specified " + phaseId);
        }

    }

}
