package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 31, 2006
 */
public class TCCC06AlgRegistrants extends Base {

    public void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("tccc06_alg_registrants");

        //this gets refreshed when people sign up.
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) m.get("tccc06_alg_registrants");

        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        if (!(sortCol.equals("") || sortDir.equals(""))) {
            rsc.sortByColumn(Integer.parseInt(sortCol), sortDir.equals("asc"));
        }

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_lower"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        getRequest().setAttribute("list", rsc);

        setNextPage("/tournaments/tccc06/alg_registrants.jsp");
        setIsNextPageInContext(true);
    }
}
