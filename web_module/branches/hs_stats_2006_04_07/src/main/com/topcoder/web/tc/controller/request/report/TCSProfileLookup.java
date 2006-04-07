package com.topcoder.web.tc.controller.request.report;

import com.topcoder.common.web.data.report.Constants;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Map;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 3:28:26 PM
 */
public class TCSProfileLookup extends Base {

    protected void businessProcessing() throws TCWebException {
        log.debug("process called....");

        try {

            if (((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin()) {


                getProfile(getRequest());
                getRequest().setAttribute(Constants.PROCESSED_KEY, new Boolean(true));

                setNextPage(Constants.JSP_ADDR + Constants.REPORT_TCS_PROFILE_ADDR);
                setIsNextPageInContext(true);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    private void getProfile(TCRequest request) throws Exception {
        log.debug("getProfile called...");
        Request mainRequest = new Request();
        mainRequest.setContentHandle("tcs_profile_lookup");
        String handle = StringUtils.checkNull(request.getParameter(Constants.REPORT_HANDLE_KEY));
        String firstName = StringUtils.checkNull(request.getParameter(Constants.REPORT_FIRST_NAME_KEY));
        String lastName = StringUtils.checkNull(request.getParameter(Constants.REPORT_LAST_NAME_KEY));
        String email = StringUtils.checkNull(request.getParameter(Constants.REPORT_EMAIL_KEY));

        if (!handle.equals(""))
            mainRequest.setProperty(Constants.REPORT_HANDLE_KEY, handle);
        if (!firstName.equals(""))
            mainRequest.setProperty(Constants.REPORT_FIRST_NAME_KEY, firstName);
        if (!lastName.equals(""))
            mainRequest.setProperty(Constants.REPORT_LAST_NAME_KEY, lastName);
        if (!email.equals(""))
            mainRequest.setProperty(Constants.REPORT_EMAIL_KEY, email);

        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Map mainMap = dai.getData(mainRequest);
        ResultSetContainer profileList = (ResultSetContainer) mainMap.get("main_profile_info");

        log.debug("found " + profileList.size() + " people matching search criteria");
        log.debug("request was: " + mainRequest.toString());

        request.setAttribute(Constants.REPORT_PROFILE_LIST_KEY, profileList);
    }

}