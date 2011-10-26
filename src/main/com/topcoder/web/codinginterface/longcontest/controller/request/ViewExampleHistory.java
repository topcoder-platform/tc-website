package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.*;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;

import java.util.Map;

/**
 * @author dok
 * @version $Revision: 76671 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 17, 2006
 */
public class ViewExampleHistory extends Base {
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

            r.setContentHandle("long_contest_example_history");
            r.setProperty(Constants.CODER_ID, request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.COMPONENT_ID, component);
            r.setProperty(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));
            Map<String, ResultSetContainer> result = getDataAccess(false).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_coder_examples");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));

            rsc = new ResultSetContainer(rsc, startRank, endRank);

            result.put("long_coder_examples", rsc);

            ResultSetContainer infoRsc = new ResultSetContainer(result.get("long_contest_coder_examples_info"), new RoundDisplayNameCalculator("display_name"));
            if (infoRsc.size() == 0) {
                throw new NavigationException("Couldn't find round info for round " + request.getParameter(Constants.ROUND_ID));
            }
            
            long roundID = Long.parseLong(request.getParameter(Constants.ROUND_ID));
            
            if (isRoundExclusive(roundID) && !getSessionInfo().isAdmin() && !isUserRegistered(getUser().getId(), roundID))
            {
            	throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
            
            request.setAttribute("infoRow", infoRsc.get(0));

            setDefault(DataAccessConstants.NUMBER_RECORDS, "" + numRecords);
            setDefault(DataAccessConstants.START_RANK, "" + startRank);
            setDefault(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));

            request.setAttribute("resultMap", result);
            request.setAttribute(Constants.COMPONENT_ID, component);

            setNextPage(Constants.PAGE_EXAMPLE_HISTORY);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
