package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;

import javax.servlet.http.HttpUtils;
import java.util.Map;

public class Simple extends Base {

    protected void businessProcessing() throws TCWebException {
        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString());
        map.remove(Constants.MODULE_KEY); //no need to include this one
        try {
            dataRequest.setProperties(map);
            DataAccessInt dwdai = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);
            Map result = dwdai.getData(dataRequest);
            getRequest().setAttribute("resultMap", result);
            setNextPage(Constants.STATISTICS_PATH+dataRequest.getContentHandle()+".jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

}
