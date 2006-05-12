package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;

import java.util.Map;

/**
 * Processing for the Profile List page.
 * @author Porgery
 */
public class ProfileList extends BaseScreeningProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void screeningProcessing() throws TCWebException {
        try {
            DataAccessInt dAccess = Util.getDataAccess();

            Request dr = new Request();
            dr.setContentHandle("profileList");
            dr.setProperty("uid", String.valueOf(getUser().getId()));

            Map map = dAccess.getData(dr);

            if (map == null || map.size() != 1)
                throw new ScreeningException("Data retrieval error");

            ResultSetContainer result =
                    (ResultSetContainer) map.get("profileList");


            getRequest().setAttribute("profileList", result);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROFILE_LIST_PAGE);
        setIsNextPageInContext(true);
    }

}
