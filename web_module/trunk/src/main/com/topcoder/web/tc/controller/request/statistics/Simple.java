package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.servlet.http.HttpUtils;
import java.util.Map;

public class Simple extends Static {

    private static TCResourceBundle bundle = new TCResourceBundle("TC");

    public static final String TRANS_FLAG = "trans";

    protected void businessProcessing() throws TCWebException {
        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString());
        map.remove(Constants.MODULE_KEY); //no need to include this one
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            DataAccessInt dai = getDataAccess(getDb(), true);
            Map result = dai.getData(dataRequest);

            ResultSetContainer rsc = (ResultSetContainer)result.get(dataRequest.getContentHandle());
            String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
            String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
            if (sortCol != null && sortDir != null && rsc != null)
                rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc"));

            getRequest().setAttribute("resultMap", result);

            String nextPage = bundle.getProperty(dataRequest.getContentHandle());
            if (nextPage==null) {
                super.businessProcessing();
            } else {
                setNextPage(nextPage);
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected String getDb() {
        String ret = DBMS.DW_DATASOURCE_NAME;
        String flag = StringUtils.checkNull(getRequest().getParameter(TRANS_FLAG));
        if (flag.toLowerCase().trim().equals("true")) {
            ret = DBMS.OLTP_DATASOURCE_NAME;
        }
        return ret;
    }


}
