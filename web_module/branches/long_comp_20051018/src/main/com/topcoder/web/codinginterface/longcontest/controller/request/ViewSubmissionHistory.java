package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.util.logging.Logger;


public class ViewSubmissionHistory extends Base{
    protected static final Logger log = Logger.getLogger(ViewSubmissionHistory.class);

    protected void businessProcessing() throws TCWebException {
	if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
	}
        try{
            TCRequest request = getRequest();
            Request r = new Request();
            
            String startRankStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecordsStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            
            int numRecords = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
            int startRank = 1, sortCol = 3;
            if (!"".equals(numRecordsStr)) {
                numRecords = Integer.parseInt(numRecordsStr);
            }
            if (!startRankStr.equals("")){
                startRank = Integer.parseInt(startRankStr);
            }
            if (!sortColStr.equals("")) {
                sortCol = Integer.parseInt(sortColStr);
            }

            int endRank = startRank + numRecords - 1;
            
            String component = request.getParameter(Constants.COMPONENT_ID);
            if(component == null){
                // TODO: translate problem id into component id
            }
            
            r.setContentHandle("long_contest_submission_history");
            r.setProperty(Constants.CODER_ID,request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.COMPONENT_ID,component);
            r.setProperty(Constants.ROUND_ID,request.getParameter(Constants.ROUND_ID));
            Map result = getDataAccess(false).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("long_coder_submissions");
            rsc.sortByColumn(sortCol, !"desc".equals(sortDir));

            rsc = new ResultSetContainer(rsc, startRank, endRank);

            result.put("long_coder_submissions", rsc);

//            SortInfo s = new SortInfo();
//            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, ""+numRecords);
            setDefault(DataAccessConstants.START_RANK, ""+startRank);

            request.setAttribute("resultMap", result);
            setNextPage(Constants.PAGE_SUBMISSION_HISTORY);
            setIsNextPageInContext(true);
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
}
