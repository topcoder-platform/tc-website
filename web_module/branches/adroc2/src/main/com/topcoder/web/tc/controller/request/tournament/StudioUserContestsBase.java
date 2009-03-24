package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class StudioUserContestsBase extends Base {

    public static final int CONTEST_NAME_COL = 1;
    public static final int START_DATE_COL = 2;
    public static final int END_DATE_COL = 3;
    public static final int REGISTRANTS_COL = 4;
    public static final int SUBMISSIONS_COL = 5;
    public static final int PLACED_COL = 6;
    public static final int POINTS_COL = 7;

    /**
     * Gets the contest prefix. It will be used mainly for the jsp path but could be used for other purposes as well.
     * Example: tco07, tccc07, etc.
     *
     * @return the contest prefix
     */
    protected abstract String getContestPrefix();

    /**
     * Gets the placement points for the points calculation.
     * Each i position of the element corresponds to amount of points for the i+1 placement.
     * If the placement is greater than the placement points specified, this method will return 0 points.
     *
     * @param contestPlace the placement to calculate
     * @return an array with the placement points
     */
    protected abstract int getPlacementPoints(int contestPlace);

    /**
     * Gets the maximum amount of projects that will be taken into consideration for the total points amount.
     * The points calculation will be based on the best getMax() projects placement points.
     *
     * @return the maximum amount of projects taken into consideration
     */
    protected abstract int getMaxContests();

    /**
     * Gets the command name for this stat
     *
     * @return the command name
     */
    protected String getCommandName() {
        return "event_user_results";
    }

    /**
     * Gets the datasource for this stat
     *
     * @return the datasource name
     */
    protected String getDataSourceName() {
        return DBMS.STUDIO_DATASOURCE_NAME;
    }

    /**
     * Gets the page for this stat
     *
     * @param complete wether to show completed or incomplete projectgs
     * @return the page
     */
    protected String getPageName(Integer complete) {
        return "/tournaments/" + getContestPrefix() + (complete.equals(1) ?  "/studio/completedContests.jsp" : "/studio/currentContests.jsp");
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    @Override
    protected void developmentProcessing() throws TCWebException {
        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY) &&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN) &&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        String completeParam = StringUtils.checkNull(getRequest().getParameter("complete"));
        Integer complete;
        try {
            complete = Integer.parseInt(completeParam);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid complete parameter.");
        }

        if (complete != 0 && complete != 1) {
            throw new TCWebException("invalid complete_proyects parameter.");
        }

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            Map result = dai.getData(dataRequest);

            processResult(result, complete);

            String nextPage = getPageName(complete);
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * This method will process the DB results including:
     * - Placement points calculation
     * - Sorting
     *
     * @param result the result of the command execution
     * @param complete wether to show completed or incomplete projects
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void processResult(Map result, Integer complete) throws com.topcoder.web.common.TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        String user = StringUtils.checkNull(getRequest().getParameter(Constants.USER_ID));
        Long userId;
        try {
            userId = Long.parseLong(user);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid user id parameter.");
        }

        // first thing we need to do is calculate placement points for each contest
        List<StudioUserContestsRow> results = calculatePlacementPoints(rsc, userId, complete);

        // sort
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        sortResult(results, sortCol, "desc".equals(sortDir));

        getRequest().setAttribute("handle", results.get(0).getHandle());
        getRequest().setAttribute("result", results);
    }

    /**
     * This method calculates the placement points for the specified user in each of his competitions
     *
     * The calculation will take into consideration:
     * - Relative placement within event registrants of the competition
     * - Placements points as specified in getPlacementPoints()
     *
     * @param rsc The ResultSetContainer with the DB query results
     * @param userId The userId being requested
     * @param complete whether to show complete or incomplete projects
     * @return a List of StudioUserContestRow elements with all the information for the stat chart
     */
    private List<StudioUserContestsRow> calculatePlacementPoints(ResultSetContainer rsc, Long userId, Integer complete) {
        long prevContestId = 0;
        int contestPlace = 1;

        ArrayList<StudioUserContestsRow> results = new ArrayList<StudioUserContestsRow>();
        for (ResultSetRow rsr: rsc) {
            if (rsr.getLongItem("contest_id") != prevContestId) {
                contestPlace = 1;
            }

            // keep only rows with the requested userId
            if (userId.equals(rsr.getLongItem("user_id")) && complete.equals(rsr.getIntItem("completed"))) {
                StudioUserContestsRow row = new StudioUserContestsRow(
                        rsr.getLongItem("contest_id"),
                        rsr.getStringItem("name"),
                        rsr.getTimestampItem("start_time"),
                        rsr.getTimestampItem("end_time"),
                        rsr.getStringItem("handle"),
                        rsr.getIntItem("registrants"),
                        rsr.getIntItem("submissions"),
                        contestPlace,
                        getPlacementPoints(contestPlace),
                        rsr.getLongItem("submission_id"));

                results.add(row);
            }

            prevContestId = rsr.getLongItem("contest_id");
            contestPlace++;
        }

        return results;
    }

    /**
     * Private helper method to sort the results
     *
     * @param result the list of StudioLeaderBoardRow elements
     * @param sortCol the sort column
     * @param invert true if an inverted list is requested
     */
    protected void sortResult(List<StudioUserContestsRow> result, String sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        if (sortCol.equals(String.valueOf(START_DATE_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getStartDate().compareTo(arg1.getStartDate());
                }
            });
        } else  if (sortCol.equals(String.valueOf(END_DATE_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getEndDate().compareTo(arg1.getEndDate());
                }
            });
        } else  if (sortCol.equals(String.valueOf(REGISTRANTS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getRegistrants().compareTo(arg1.getRegistrants());
                }
            });
        } else  if (sortCol.equals(String.valueOf(SUBMISSIONS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getSubmissions().compareTo(arg1.getSubmissions());
                }
            });
        } else  if (sortCol.equals(String.valueOf(PLACED_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getPlaced().compareTo(arg1.getPlaced());
                }
            });
        } else  if (sortCol.equals(String.valueOf(POINTS_COL))) {
            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getPoints().compareTo(arg1.getPoints());
                }
            });
        } else {
            // Default, sort by contest name.

            Collections.sort(result, new Comparator<StudioUserContestsRow>() {
                public int compare(StudioUserContestsRow arg0, StudioUserContestsRow arg1) {
                    return arg0.getContestName().compareTo(arg1.getContestName());
                }
            });
        }

        if (invert) {
            Collections.reverse(result);
        }

        SortInfo s = new SortInfo();
        s.addDefault(CONTEST_NAME_COL, "asc");
        s.addDefault(START_DATE_COL, "desc");
        s.addDefault(END_DATE_COL, "desc");
        s.addDefault(REGISTRANTS_COL, "desc");
        s.addDefault(SUBMISSIONS_COL, "desc");
        s.addDefault(PLACED_COL, "asc");
        s.addDefault(POINTS_COL, "desc");

        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
