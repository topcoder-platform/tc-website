package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

/**
 * User: dok
 * Date: Jul 19, 2004
 * Time: 4:02:16 PM
 */
public class ProblemArchive extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            Request r = new Request();
            r.setContentHandle("problem_archive");

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(sortCol.equals("") || sortDir.equals(""))) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
                r.setProperty(DataAccessConstants.SORT_QUERY, "problem_list");
            }

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("crpf_donation_list");
            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("problem_name"), "asc");
            s.addDefault(rsc.getColumnIndex("contest_name"), "asc");
            s.addDefault(rsc.getColumnIndex("div1_level"), "desc");
            s.addDefault(rsc.getColumnIndex("div2_level"), "desc");
            s.addDefault(rsc.getColumnIndex("div1_success"), "desc");
            s.addDefault(rsc.getColumnIndex("div2_success"), "desc");
            getRequest().setAttribute("resultMap", result);

            setNextPage(Constants.PROBLEM_ARCHIVE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
