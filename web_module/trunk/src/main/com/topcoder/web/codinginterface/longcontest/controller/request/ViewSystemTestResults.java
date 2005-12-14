/*
 * ViewSystemTestResults.java
 *
 * Created on November 9, 2005, 3:21 AM
 *
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;

import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;

/**
 * @author Porgery
 */
public class ViewSystemTestResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewSystemTestResults.class);

    protected void longContestProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            TCRequest request = getRequest();
            Request r = new Request();

            String startRowStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String startColStr = StringUtils.checkNull(getRequest().getParameter(Constants.START_COL));
            String rowCountStr = StringUtils.checkNull(getRequest().getParameter(Constants.ROW_COUNT));
            String colCountStr = StringUtils.checkNull(getRequest().getParameter(Constants.COL_COUNT));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            int rowCount = Integer.parseInt(Constants.DEFAULT_SYSTEM_TEST_RESULTS_ROW_COUNT);
            int colCount = Integer.parseInt(Constants.DEFAULT_COL_COUNT);
            int startRow = 1, startCol = 1, sortCol = 2;
            if (!"".equals(rowCountStr)) {
                rowCount = Integer.parseInt(rowCountStr);
            }
            if (!"".equals(colCountStr)) {
                colCount = Integer.parseInt(colCountStr);
            }
            if (!startRowStr.equals("")) {
                startRow = Integer.parseInt(startRowStr);
            }
            if (!startColStr.equals("")) {
                startCol = Integer.parseInt(startColStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }
            if (sortDir.equals("")) {
                sortDir = (sortCol == 1) ? "asc" : "desc";
            }

            int endRow = startRow + rowCount - 1;
            int endCol = startCol + colCount - 1;

            r.setContentHandle("long_contest_system_test_results");
            r.setProperty(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
            if (!"".equals(StringUtils.checkNull(request.getParameter(Constants.TEST_CASE_ID))))
                r.setProperty(Constants.TEST_CASE_ID, request.getParameter(Constants.TEST_CASE_ID));

            Map result = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("long_contest_test_results_coders");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));
            rsc = new ResultSetContainer(rsc, startRow, endRow);
            result.put("long_contest_test_results_coders", rsc);

            ResultSetContainer rscCol = (ResultSetContainer) result.get("long_contest_test_results_cases");
//            rscCol.sortByColumn(sortCol, !"desc".equals(sortDir));
            rscCol = new ResultSetContainer(rscCol, startCol, endCol);
            result.put("long_contest_test_results_cases", rscCol);

            ResultSetContainer rscScores = (ResultSetContainer) result.get("long_contest_system_test_results");
            HashMap hash = new HashMap();
            for (ListIterator iter = rscScores.listIterator(); iter.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) iter.next();
                hash.put(row.getItem("coder_id") + "_" + row.getItem("test_case_id"), "" + row.getItem("score"));
            }

            request.setAttribute("resultMap", result);
            request.setAttribute("scoreHash", hash);

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            StringBuffer buf = new StringBuffer(100);
            buf.append(info.getServletPath());
            buf.append("?").append(Constants.MODULE).append("=ViewSystemTestResults");
            buf.append("&").append(Constants.ROUND_ID).append("=").append(request.getParameter(Constants.ROUND_ID));
            buf.append("&").append(Constants.PROBLEM_ID).append("=").append(request.getParameter(Constants.PROBLEM_ID));
            if (request.getParameter(Constants.CODER_ID) != null)
                buf.append("&").append(Constants.CODER_ID).append("=").append(request.getParameter(Constants.CODER_ID));
            if (request.getParameter(Constants.ROW_COUNT) != null)
                buf.append("&").append(Constants.ROW_COUNT).append("=").append(request.getParameter(Constants.ROW_COUNT));
            if (request.getParameter(Constants.COL_COUNT) != null)
                buf.append("&").append(Constants.COL_COUNT).append("=").append(request.getParameter(Constants.COL_COUNT));
            String linkBase = buf.toString();

            if (request.getParameter(DataAccessConstants.SORT_COLUMN) != null)
                buf.append("&").append(DataAccessConstants.SORT_COLUMN).append("=").append(request.getParameter(DataAccessConstants.SORT_COLUMN));
            if (request.getParameter(DataAccessConstants.SORT_DIRECTION) != null)
                buf.append("&").append(DataAccessConstants.SORT_DIRECTION).append("=").append(request.getParameter(DataAccessConstants.SORT_DIRECTION));
            if (request.getParameter(Constants.TEST_CASE_ID) != null)
                buf.append("&").append(Constants.TEST_CASE_ID).append("=").append(request.getParameter(Constants.TEST_CASE_ID));
            String pageLinkBase = buf.toString();

            buf = new StringBuffer(20);
            if (request.getParameter(DataAccessConstants.START_RANK) != null)
                buf.append("&").append(DataAccessConstants.START_RANK).append("=").append(request.getParameter(DataAccessConstants.START_RANK));
            String pagingRParam = buf.toString();

            buf = new StringBuffer(20);
            if (request.getParameter(Constants.START_COL) != null)
                buf.append("&").append(Constants.START_COL).append("=").append(request.getParameter(Constants.START_COL));
            String pagingCParam = buf.toString();

            if (rsc.croppedDataBefore()) {
                request.setAttribute("prevPageLink",
                        new StringBuffer(pageLinkBase)
                                .append("&").append(DataAccessConstants.START_RANK)
                                .append("=").append("" + Math.max(1, rsc.getStartRow() - rowCount))
                                .append(pagingCParam)
                                .toString());
            }
            if (rsc.croppedDataAfter()) {
                request.setAttribute("nextPageLink",
                        new StringBuffer(pageLinkBase)
                                .append("&").append(DataAccessConstants.START_RANK)
                                .append("=").append("" + (rsc.getStartRow() + rowCount))
                                .append(pagingCParam)
                                .toString());
            }
            if (rscCol.croppedDataBefore()) {
                request.setAttribute("prevPageColLink",
                        new StringBuffer(pageLinkBase)
                                .append(pagingRParam)
                                .append("&").append(Constants.START_COL)
                                .append("=").append("" + Math.max(1, rscCol.getStartRow() - colCount))
                                .toString());
            }
            if (rscCol.croppedDataAfter()) {
                request.setAttribute("nextPageColLink",
                        new StringBuffer(pageLinkBase)
                                .append(pagingRParam)
                                .append("&").append(Constants.START_COL)
                                .append("=").append("" + (rscCol.getStartRow() + colCount))
                                .toString());
            }

            request.setAttribute("sortLinkBase", linkBase + pagingCParam);

            setNextPage(Constants.PAGE_VIEW_SYSTEM_TEST_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
