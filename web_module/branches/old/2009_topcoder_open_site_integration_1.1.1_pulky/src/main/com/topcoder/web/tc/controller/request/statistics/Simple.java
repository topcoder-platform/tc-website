package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

import java.util.Map;
import java.util.MissingResourceException;
import java.util.HashMap;
import java.util.Iterator;

public class Simple extends Static {

    private static TCResourceBundle bundle = new TCResourceBundle("TC");

    public static final String TRANS_FLAG = "trans";

    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();

        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry)it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY)&&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN)&&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        dataRequest.setProperties(filteredMap);
        DataAccessInt dai = getDataAccess(getDb(), true);
        Map result = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
        String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
        String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
        if (sortCol != null && sortDir != null && rsc != null)
            rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc"));

        getRequest().setAttribute("resultMap", result);

        try {
            String nextPage = bundle.getProperty(dataRequest.getContentHandle());
            setNextPage(nextPage);
            setIsNextPageInContext(true);
        } catch (MissingResourceException e) {
            super.businessProcessing();
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
