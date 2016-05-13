/*
 * ViewSystemTestResults.java
 *
 * Created on November 9, 2005, 3:21 AM
 *
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import java.util.HashMap;
import java.util.ListIterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;

/**
 * @author Porgery
 */
public class ViewSystemTestResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewSystemTestResults.class);

    protected void longContestProcessing() throws TCWebException {
        log.debug("start results processing");
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

            log.debug("get cases and coders");
            Map<String, ResultSetContainer> result = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);
            log.debug("got cases and coders");

            
            ResultSetContainer rsc = result.get("long_contest_test_results_coders");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));
            if ("".equals(startRowStr) && "".equals(sortColStr) && request.getParameter(Constants.CODER_ID) != null) {
                //go to the specified coder's row
                long coderId = Long.parseLong(request.getParameter(Constants.CODER_ID));
                for (int i = 0; i < rsc.size(); i++) {
                    if (coderId == rsc.getLongItem(i, "coder_id")) {
                        startRow = i + 1;
                        endRow = startRow + rowCount - 1;
                        break;
                    }
                }

            }
            rsc = (ResultSetContainer) rsc.subList(startRow - 1, endRow);
            result.put("long_contest_test_results_coders", rsc);

            String coders = createList(rsc, "coder_id");
            log.debug("coders: " + coders);
            
            ResultSetContainer rscCol = result.get("long_contest_test_results_cases");
            rscCol = (ResultSetContainer) rscCol.subList(startCol - 1, endCol);
            result.put("long_contest_test_results_cases", rscCol);

            String testCasesIds  = createList(rscCol, "test_case_id");
            log.debug("test cases: " + testCasesIds);
            
            
            Request rScores = new Request();
            rScores.setContentHandle("long_contest_system_test_scores");
            rScores.setProperty(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));
            rScores.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
            rScores.setProperty("crs", coders);
            rScores.setProperty("tids", testCasesIds);

            log.debug("get scores");
            //too much data to store for very long.
            Map<String, ResultSetContainer> scoresMap = getDataAccess(DBMS.DW_DATASOURCE_NAME, MaxAge.HALF_HOUR).getData(rScores);
            log.debug("got scores");


            ResultSetContainer infoRsc = new ResultSetContainer(result.get("long_contest_overview_info"), new RoundDisplayNameCalculator("display_name"));
            if (infoRsc.size() == 0) {
                throw new NavigationException("Couldn't find round info for round " + request.getParameter(Constants.ROUND_ID));
            }
            request.setAttribute("infoRow", infoRsc.get(0));

            ResultSetContainer rscScores = (ResultSetContainer) scoresMap.get("long_contest_system_test_results");
            HashMap hash = new HashMap();
            log.debug("start load map");

            HashMap testCases = null;
            for (ListIterator iter = rscScores.listIterator(); iter.hasNext();) {
                ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) iter.next();
                testCases = (HashMap) hash.get(row.getItem("coder_id").getResultData());
                if (testCases == null) {
                    testCases = new HashMap();
                }
                testCases.put(row.getItem("test_case_id").getResultData(), row.getItem("score").getResultData());
                hash.put(row.getItem("coder_id").getResultData(), testCases);
            }
            log.debug("end load map");

            request.setAttribute("resultMap", result);
            request.setAttribute("scoreHash", hash);

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            StringBuffer buf = new StringBuffer(100);
            buf.append(info.getServletPath());
            buf.append("?").append(Constants.MODULE).append("=ViewSystemTestResults");
            buf.append("&").append(Constants.ROUND_ID).append("=").append(request.getParameter(Constants.ROUND_ID));
            buf.append("&").append(Constants.PROBLEM_ID).append("=").append(request.getParameter(Constants.PROBLEM_ID));
            if (request.getParameter(Constants.CODER_ID) != null) {
                buf.append("&").append(Constants.CODER_ID).append("=").append(request.getParameter(Constants.CODER_ID));
            }
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
                                .append("=").append("" + Math.max(1, startRow - rowCount))
                                .append(pagingCParam)
                                .toString());
            }
            if (rsc.croppedDataAfter()) {
                request.setAttribute("nextPageLink",
                        new StringBuffer(pageLinkBase)
                                .append("&").append(DataAccessConstants.START_RANK)
                                .append("=").append("" + (startRow + rowCount))
                                .append(pagingCParam)
                                .toString());
            }
            if (rscCol.croppedDataBefore()) {
                request.setAttribute("prevPageColLink",
                        new StringBuffer(pageLinkBase)
                                .append(pagingRParam)
                                .append("&").append(Constants.START_COL)
                                .append("=").append("" + Math.max(1, startCol - colCount))
                                .toString());
            }
            if (rscCol.croppedDataAfter()) {
                request.setAttribute("nextPageColLink",
                        new StringBuffer(pageLinkBase)
                                .append(pagingRParam)
                                .append("&").append(Constants.START_COL)
                                .append("=").append("" + (startCol + colCount))
                                .toString());
            }

            request.setAttribute("sortLinkBase", linkBase + pagingCParam);

            setNextPage(Constants.PAGE_VIEW_SYSTEM_TEST_RESULTS);
            setIsNextPageInContext(true);
            log.debug("done results processing");
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private String createList(ResultSetContainer rsc, String colName) {
        StringBuffer sb = new StringBuffer(100);
        for (ResultSetContainer.ResultSetRow row : rsc) {
            sb.append(row.getStringItem(colName)).append(",");
        }
        if (sb.length() == 0) return "-1";
        return sb.substring(0, sb.length()-1);
    }
}
