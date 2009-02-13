package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.*;

import java.util.Map;


public class ViewSubmissionHistory extends Base {
    protected static final Logger log = Logger.getLogger(ViewSubmissionHistory.class);

    protected void longContestProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            TCRequest request = getRequest();

            String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            int numRecords = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
            int startRank = 1, sortCol = 3;
            if (!"".equals(numRecordsStr)) {
                numRecords = Integer.parseInt(numRecordsStr);
            }
            if (!startRankStr.equals("")) {
                startRank = Integer.parseInt(startRankStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }

            int endRank = startRank + numRecords - 1;

            String component = StringUtils.checkNull(request.getParameter(Constants.COMPONENT_ID));
            if ("".equals(component)) {
                Request r = new Request();
                r.setContentHandle("long_contest_problem_component");
                r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
                component = ((ResultSetContainer)
                        getDataAccess(false).getData(r).get("long_contest_problem_component"))
                        .getStringItem(0, "component_id");
            }
            Request r = new Request();

            r.setContentHandle("long_contest_submission_history");
            r.setProperty(Constants.CODER_ID, request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.COMPONENT_ID, component);
            r.setProperty(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));
            Map result = getDataAccess(false).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_coder_submissions");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));

            rsc = new ResultSetContainer(rsc, startRank, endRank);

            result.put("long_coder_submissions", rsc);

//            SortInfo s = new SortInfo();
//            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, "" + numRecords);
            setDefault(DataAccessConstants.START_RANK, "" + startRank);

            request.setAttribute("resultMap", result);
            request.setAttribute(Constants.COMPONENT_ID, component);

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            StringBuffer buf = new StringBuffer(100);
            buf.append(info.getServletPath());
            buf.append("?").append(Constants.MODULE).append("=ViewSubmissionHistory");
            buf.append("&").append(Constants.ROUND_ID).append("=").append(request.getParameter(Constants.ROUND_ID));
            buf.append("&").append(Constants.COMPONENT_ID).append("=").append(component);
            buf.append("&").append(Constants.CODER_ID).append("=").append(request.getParameter(Constants.CODER_ID));
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

            setNextPage(Constants.PAGE_SUBMISSION_HISTORY);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
