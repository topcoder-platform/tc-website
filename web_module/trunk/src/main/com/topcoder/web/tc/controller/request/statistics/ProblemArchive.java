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

            String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            if (start.equals(""))
                start = "1";
            r.setProperty(DataAccessConstants.START_RANK, start);

            String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            if (end.equals(""))
                end = String.valueOf(Constants.PROBLEM_ARCHIVE_SCROLL_SIZE);
            r.setProperty(DataAccessConstants.END_RANK, end);

            //make sure we like the size they they're searching for
            if (Integer.parseInt(end)-Integer.parseInt(start)>(Constants.PROBLEM_ARCHIVE_SCROLL_SIZE-1)) {
                r.setProperty(DataAccessConstants.END_RANK, String.valueOf(Integer.parseInt(start)+Constants.PROBLEM_ARCHIVE_SCROLL_SIZE-1));
            }

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(sortCol.equals("") || sortDir.equals(""))) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
                r.setProperty(DataAccessConstants.SORT_QUERY, "problem_list");
            }

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("problem_list");

            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("problem_name"), "asc");
            s.addDefault(rsc.getColumnIndex("contest_name"), "asc");
            s.addDefault(rsc.getColumnIndex("contest_date"), "desc");
            s.addDefault(rsc.getColumnIndex("div1_level"), "desc");
            s.addDefault(rsc.getColumnIndex("div2_level"), "desc");
            s.addDefault(rsc.getColumnIndex("div1_success"), "desc");
            s.addDefault(rsc.getColumnIndex("div2_success"), "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            getRequest().setAttribute("resultMap", result);

            setNextPage(Constants.PROBLEM_ARCHIVE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
