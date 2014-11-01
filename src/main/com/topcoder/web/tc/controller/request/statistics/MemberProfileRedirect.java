/*
 * Copyright (c) 2014 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * <p>
 * This class retrieves the member handle via coder id and redirect to the new
 * member profile page.
 * </p>
 *
 * @author Veve
 * @version 1.0
 */
public class MemberProfileRedirect extends Base {

    /**
     * <p>
     * Process the request of displaying member profile page.
     * </p>
     */
    protected void businessProcessing() throws TCWebException {
        try {
            // step 1, get the base data used for the top section
            if (!hasParameter("cr")) {
                throw new TCWebException("Invalid Coder ID");
            }

            String coderId = getRequest().getParameter("cr");

            Request r = new Request();
            r.setContentHandle("user_handle_email_by_user_id");
            r.setProperty("uid", coderId);

            DataAccessInt dai = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("user_handle_email_by_user_id");

            if (rsc.size() > 0) {
                String userHandle = rsc.get(0).getStringItem("handle");
                setNextPage("http://" + com.topcoder.shared.util.ApplicationServer.SERVER_NAME + "/member-profile/" +
                        userHandle);
                setIsNextPageInContext(false);
            } else {
                throw new TCWebException("Invalid Coder ID");
            }


        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
