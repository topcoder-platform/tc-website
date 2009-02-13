/*
 * ViewOverview.java
 *
 * Created on November 8, 2005, 4:59 PM
 *
 */

package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;

import java.util.Map;

/**
 * @author Porgery
 */
public class ViewOverview extends Base {
    protected static final Logger log = Logger.getLogger(ViewOverview.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            Request r = new Request();

            String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            int numRecords = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
            int startRank = 1, sortCol = 4;
            if (!numRecordsStr.equals("")) {
                numRecords = Integer.parseInt(numRecordsStr);
            }
            if (!startRankStr.equals("")) {
                startRank = Integer.parseInt(startRankStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }

            int endRank = startRank + numRecords - 1;

            r.setContentHandle("long_contest_overview");

            String roundID = request.getParameter(Constants.ROUND_ID);
            if (roundID == null) {
                // Find most recent round
                Request req = new Request();
                req.setContentHandle("long_contest_active_contests");
                ResultSetContainer rsc =
                        (ResultSetContainer) getDataAccess(false).getData(req).get("long_contest_active_contests");
                if (rsc.isEmpty()) { // No active contests
                    getRequest().setAttribute(Constants.MESSAGE, "There are currently no active rounds.");
                    setNextPage(Constants.PAGE_VIEW_REGISTRANTS);
                    setIsNextPageInContext(true);
                    return;
                } else { // Show the most recent active round
                    roundID = rsc.getStringItem(0, "round_id");
                }
            }
            r.setProperty(Constants.ROUND_ID, roundID);
            Map result = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_contest_overview_coders");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));

            rsc = new ResultSetContainer(rsc, startRank, endRank);

            result.put("long_contest_overview_coders", rsc);

//            SortInfo s = new SortInfo();
//            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, "" + numRecords);
            setDefault(DataAccessConstants.START_RANK, "" + startRank);

            request.setAttribute("resultMap", result);

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            StringBuffer buf = new StringBuffer(100);
            buf.append(info.getServletPath());
            buf.append("?").append(Constants.MODULE).append("=ViewOverview");
            buf.append("&").append(Constants.ROUND_ID).append("=").append(request.getParameter(Constants.ROUND_ID));
            if (request.getParameter(DataAccessConstants.NUMBER_RECORDS) != null)
                buf.append("&").append(DataAccessConstants.NUMBER_RECORDS).append("=").append(request.getParameter(DataAccessConstants.NUMBER_RECORDS));

            request.setAttribute("sortLinkBase", buf.toString());

            if (request.getParameter(DataAccessConstants.SORT_COLUMN) != null)
                buf.append("&").append(DataAccessConstants.SORT_COLUMN).append("=").append(request.getParameter(DataAccessConstants.SORT_COLUMN));
            if (request.getParameter(DataAccessConstants.SORT_DIRECTION) != null)
                buf.append("&").append(DataAccessConstants.SORT_DIRECTION).append("=").append(request.getParameter(DataAccessConstants.SORT_DIRECTION));

            if (rsc.croppedDataBefore()) {
                request.setAttribute("prevPageLink",
                        new StringBuffer().append(buf)
                                .append("&").append(DataAccessConstants.START_RANK)
                                .append("=").append("" + Math.max(1, rsc.getStartRow() - numRecords))
                                .toString());
            }
            if (rsc.croppedDataAfter()) {
                request.setAttribute("nextPageLink",
                        new StringBuffer().append(buf)
                                .append("&").append(DataAccessConstants.START_RANK)
                                .append("=").append("" + (rsc.getStartRow() + numRecords))
                                .toString());
            }

            setNextPage(Constants.PAGE_VIEW_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
