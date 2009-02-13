package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RatingHistory extends Base { 

    protected void businessProcessing() throws TCWebException {
        try {
            ListInfo li = new ListInfo(getRequest(), 1, 50, 3, "DESC");
            
            if (!hasParameter("cr") || !hasParameter("ratid")) {
                throw new IllegalArgumentException("Parameters cr and ratid expected"); 
            }
            
            Request r = new Request();
            r.setContentHandle("hs_rating_history");
            r.setProperty("cr", getRequest().getParameter("cr"));
            r.setProperty("ratid", getRequest().getParameter("ratid"));
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            getRequest().setAttribute("totalRows", ((ResultSetContainer) result.get("hs_rating_history")).getRowCount() + "");
            sortAndCrop(result, "hs_rating_history", li);
            
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("cr", getRequest().getParameter("cr"));
            getRequest().setAttribute("ratid", getRequest().getParameter("ratid"));
            getRequest().setAttribute("listInfo", li);
            
            setNextPage(Constants.HS_RATING_HISTORY);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
