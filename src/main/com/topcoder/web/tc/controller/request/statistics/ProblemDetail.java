package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;

import java.util.Map;
import javax.servlet.http.HttpUtils;

/**
 * User: dok
 * Date: Jul 22, 2004
 * Time: 4:02:16 PM
 */
public class ProblemDetail extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            Request r = new Request();
            Map map = HttpUtils.parseQueryString(getRequest().getQueryString());

            r.setProperties(map);
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);

            getRequest().setAttribute("resultMap", result);


            setNextPage(Constants.PROBLEM_DETAIL);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
