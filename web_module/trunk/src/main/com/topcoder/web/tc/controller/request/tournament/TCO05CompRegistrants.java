/*
 * TCO05CompRegistrants.java
 *
 * Created on June 24, 2005, 12:22 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.StringUtils;

import java.util.Map;

/**
 *
 * @author rfairfax
 */
public class TCO05CompRegistrants extends Base {

    public void businessProcessing() {
        try {
            Request r = new Request();
            r.setContentHandle("tco05_comp_registrants");

            Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false).getData(r);

            ResultSetContainer rsc = (ResultSetContainer)m.get("tco05_comp_registrants");

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(sortCol.equals("") || sortDir.equals(""))) {
                rsc.sortByColumn(Integer.parseInt(sortCol), sortDir.equals("asc"));
            }

            getRequest().setAttribute("list", rsc);

            setNextPage("/tournaments/tco05/comp_registrants.jsp");
            setIsNextPageInContext(true);

        } catch (Exception e) {
        }
    }
}
