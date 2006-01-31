package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

import java.util.Map;

/**
 *
 * @author coachbudka
 */
public class SrmDivisionWins extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));

            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String divisionId = StringUtils.checkNull(getRequest().getParameter("dn"));

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if ("".equals(divisionId)) divisionId = "1";
            if (!"1".equals(divisionId) && !"2".equals(divisionId)) {
                throw new TCWebException("Invalid division_id (dn parameter)");
            }

            if ("".equals(numRecords)) {
                numRecords = "50";
            } else if (Integer.parseInt(numRecords)>200) {
                numRecords="200";
            } else if (Integer.parseInt(numRecords)<=0) {
                numRecords="50";
            }

            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

            r.setContentHandle("srm_division_wins");
            r.setProperty("dn", divisionId);

            Map result = getDataAccess(true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("srm_division_wins");
            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }

            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank),endRank);

            result.put("srm_division_wins", rsc);

            SortInfo s = new SortInfo();
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

            setDefault(DataAccessConstants.START_RANK, startRank);


            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("divisionId", divisionId);

            setNextPage("/compstats/srm_division_wins.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

