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
 * @version $Revision: 74950 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class StudioLeaderboardBase extends Base {

    public static final int RANK_COL = 1;
    public static final int HANDLE_COL = 2;
    public static final int COMPLETED_CONTESTS_COL = 3;
    public static final int COMPLETED_POINTS_COL = 4;
    public static final int CURRENT_CONTESTS_COL = 5;

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
        return "event_leaderboard";
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
     * @return the page
     */
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/studio/leaderboard.jsp";
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

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), true);
            Map result = dai.getData(dataRequest);

            processResult(result);

            String nextPage = getPageName();
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
     * - Rank generation
     * - Sorting
     *
     * @param result the result of the command execution
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void processResult(Map result) throws com.topcoder.web.common.TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        // first thing we need to do is calculate placement points for each contest
        List<StudioLeaderBoardRow> results = calculatePlacementPoints(rsc);

        // generate rank
        generateRank(results);

        // sort
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        sortResult(results, sortCol, "desc".equals(sortDir));

        getRequest().setAttribute("result", results);
    }

    /**
     * This method calculates the placement points for all users in a particular event
     *
     * The calculation will take into consideration:
     * - Relative placement within event registrants of the competition
     * - Placements points as specified in getPlacementPoints()
     * - Maximum number of contests to be taken into consideration as specified in getMaxContests()
     *
     * @param rsc The ResultSetContainer with the DB query results
     * @return a List of StudioLeaderBoardRow elements with all the information for the stat chart
     */
    private List<StudioLeaderBoardRow> calculatePlacementPoints(ResultSetContainer rsc) {
        long prevContestId = 0;
        int contestPlace = 1;
        Map<Long, StudioLeaderBoardRow> leaderBoard = new HashMap<Long, StudioLeaderBoardRow>();
        for (ResultSetRow rsr: rsc) {
            if (rsr.getLongItem("contest_id") != prevContestId) {
                contestPlace = 1;
            }
            StudioLeaderBoardRow row = new StudioLeaderBoardRow(rsr.getLongItem("user_id"), rsr.getStringItem("handle"), rsr.getStringItem("handle_lower"));
            if (leaderBoard.containsKey(rsr.getLongItem("user_id"))) {
                row = leaderBoard.get(rsr.getLongItem("user_id"));
                leaderBoard.remove(row);
            }

            if (rsr.getIntItem("completed") == 1) {
                row.setCompletedContests(row.getCompletedContests() + 1);

                int placementPoints = getPlacementPoints(contestPlace);
                List<Integer> tmp = row.getCompletedPoints();
                tmp.add(placementPoints);
                row.setCompletedPoints(tmp);

                if (placementPoints > 0) {
                    List<Integer> tmpPlacements = row.getPlacements();
                    tmpPlacements.add(contestPlace);
                    row.setPlacements(tmpPlacements);
                }
            } else {
                row.setCurrentContests(row.getCurrentContests() + 1);
            }
            leaderBoard.put(rsr.getLongItem("user_id"), row);

            prevContestId = rsr.getLongItem("contest_id");
            contestPlace++;
        }

        // calculate completed points using the best N
        ArrayList<StudioLeaderBoardRow> results = new ArrayList<StudioLeaderBoardRow>(leaderBoard.values());
        for (StudioLeaderBoardRow row : results) {
            row.calculateBestPoints(getMaxContests());
        }

        return results;
    }

    /**
     * Private method to generate ranks based on the placement points each user got
     *
     * @param results the list of StudioLeaderBoardRow elements
     */
    private void generateRank(List<StudioLeaderBoardRow> results) {
        Comparator<StudioLeaderBoardRow> comparator = getComparator();
        Collections.sort(results, comparator);

        boolean first = true;
        StudioLeaderBoardRow prevRow = null;
        int rank = 1;
        for (StudioLeaderBoardRow row : results) {
            if (!first) {
                if (comparator.compare(row, prevRow) == 0) {
                    row.setRank(prevRow.getRank());
                } else {
                    row.setRank(rank);
                }
            } else {
                row.setRank(rank);
            }
            rank++;
            prevRow = row;
            first = false;
        }
    }


    /**
     * Protected method to define the comparision between competitors results before ranking
     *
     * @return a StudioLeaderBoardRow comparator
     */
    protected Comparator<StudioLeaderBoardRow> getComparator() {
        return new Comparator<StudioLeaderBoardRow>() {
            public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                return arg1.getBestPoints().compareTo(arg0.getBestPoints());
            }
        };
    }

    /**
     * Private helper method to sort the results
     *
     * @param result the list of StudioLeaderBoardRow elements
     * @param sortCol the sort column
     * @param invert true if an inverted list is requested
     */
    protected void sortResult(List<StudioLeaderBoardRow> result, String sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        if (sortCol.equals(String.valueOf(HANDLE_COL))) {
            Collections.sort(result, new Comparator<StudioLeaderBoardRow>() {
                public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                    return arg0.getHandleLower().compareTo(arg1.getHandleLower());
                }
            });
        } else  if (sortCol.equals(String.valueOf(COMPLETED_CONTESTS_COL))) {
            Collections.sort(result, new Comparator<StudioLeaderBoardRow>() {
                public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                    return arg0.getCompletedContests().compareTo(arg1.getCompletedContests());
                }
            });
        } else  if (sortCol.equals(String.valueOf(COMPLETED_POINTS_COL))) {
            Collections.sort(result, new Comparator<StudioLeaderBoardRow>() {
                public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                    return arg0.getBestPoints().compareTo(arg1.getBestPoints());
                }
            });
        } else  if (sortCol.equals(String.valueOf(CURRENT_CONTESTS_COL))) {
            Collections.sort(result, new Comparator<StudioLeaderBoardRow>() {
                public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                    return arg0.getCurrentContests().compareTo(arg1.getCurrentContests());
                }
            });
        } else {
            // Default, sort by rank.

            Collections.sort(result, new Comparator<StudioLeaderBoardRow>() {
                public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                    return arg0.getRank().compareTo(arg1.getRank());
                }
            });
        }

        if (invert) {
            Collections.reverse(result);
        }

        SortInfo s = new SortInfo();
        s.addDefault(RANK_COL, "desc"); // rank
        s.addDefault(HANDLE_COL, "asc"); // handle lower
        s.addDefault(COMPLETED_CONTESTS_COL, "desc"); // completed contests
        s.addDefault(COMPLETED_POINTS_COL, "desc"); // completed points
        s.addDefault(CURRENT_CONTESTS_COL, "desc"); // current contests

        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}
