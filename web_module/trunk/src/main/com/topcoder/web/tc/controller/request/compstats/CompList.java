/*
 * CompList.java
 *
 * Created on August 12, 2005 by Cucu
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

import java.util.ArrayList;
import java.util.Map;

/**
 * @author cucu
 */
public class CompList extends Base {


    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));

            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String phaseId = StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID));

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));


            ArrayList<ResultFilter> filters = new ArrayList<ResultFilter>(1);
            String contestName = StringUtils.checkNull(getRequest().getParameter(Constants.CONTEST_NAME));
            if (!contestName.equals("")) {
                if (log.isDebugEnabled()) {
                    log.debug("add contest name filter: " + contestName);
                }
                filters.add(new Contains(contestName, "component_name"));
                setDefault(Constants.CONTEST_NAME, contestName);
            }

            if (!"112".equals(phaseId) && !"113".equals(phaseId)) {
                throw new TCWebException("Invalid phase_id (" + Constants.PHASE_ID + ") parameter)");
            }

            if ("".equals(numRecords)) {
                numRecords = "50";
            } else if (Integer.parseInt(numRecords) > 200) {
                numRecords = "200";
            }

            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

            r.setContentHandle("comp_list");
            r.setProperty(Constants.PHASE_ID, phaseId);

            Map result = getDataAccess(true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("comp_list");
            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }

            if (filters.size() > 0) {
                rsc = new ResultSetContainer(rsc, filters.toArray(new ResultFilter[0]));
            }
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);

            result.put("comp_list", rsc);

            SortInfo s = new SortInfo();
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

            setDefault(DataAccessConstants.START_RANK, startRank);


            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("phaseId", phaseId);

            setNextPage("/compstats/compList.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}