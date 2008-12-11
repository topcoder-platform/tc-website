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
public class MatchList extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

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

            r.setContentHandle("match_list");

            Map result = getDataAccess(true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("match_list");

            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }
            
            result.put("match_list", (ResultSetContainer)rsc.subList(Integer.parseInt(startRank)-1, endRank));

            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("numcompetitors"), "desc");
            s.addDefault(rsc.getColumnIndex("numcompetitors1"), "desc");
            s.addDefault(rsc.getColumnIndex("numcompetitors2"), "desc");
            s.addDefault(rsc.getColumnIndex("start_date"), "desc");
            s.addDefault(rsc.getColumnIndex("submitted1"), "desc");
            s.addDefault(rsc.getColumnIndex("submitted2"), "desc");
            s.addDefault(rsc.getColumnIndex("avgsubmitted1"), "desc");
            s.addDefault(rsc.getColumnIndex("avgsubmitted2"), "desc");
            s.addDefault(rsc.getColumnIndex("challengessuccessful1"), "desc");
            s.addDefault(rsc.getColumnIndex("challengessuccessful2"), "desc");
            s.addDefault(rsc.getColumnIndex("avgchallengessuccessful1"), "desc");
            s.addDefault(rsc.getColumnIndex("avgchallengessuccessful2"), "desc");

            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
            setDefault(DataAccessConstants.START_RANK, startRank);
            getRequest().setAttribute("resultMap", result);

            setNextPage("/statistics/matchList.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

