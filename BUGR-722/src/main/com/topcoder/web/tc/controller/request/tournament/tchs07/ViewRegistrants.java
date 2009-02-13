package com.topcoder.web.tc.controller.request.tournament.tchs07;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author dok, pulky
 * @version $Revision: 57437 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistrants extends Base {
    public void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("tchs07_registrants");

        //this gets refreshed when people sign up.
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);

        ResultSetContainer rsc = (ResultSetContainer) m.get("tchs07_registrants");

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

        setNextPage("/tournaments/tchs07/registrants.jsp");
        setIsNextPageInContext(true);
    }
}
