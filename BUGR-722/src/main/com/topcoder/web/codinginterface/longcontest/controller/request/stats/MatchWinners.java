package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;

/**
 * List the winner(s) for each match.
 * 
 * @author cucu
 */
public class MatchWinners extends Base {

    public static final int DATE_COLUMN = 1;
    public static final int NAME_COLUMN = 2;
    public static final int HANDLE_COLUMN = 3;
    public static final int NUM_WINS_COLUMN = 4;
    public static final int PROBLEM_COLUMN = 5;
    
    protected void longContestProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if ("".equals(sortCol)) {
                sortCol =  "1";
                sortDir = "desc";
            }

            int sc = Integer.parseInt(sortCol);

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

            int sr = Integer.parseInt(startRank);
            int nr = Integer.parseInt(numRecords);
            int endRank = sr + nr - 1;

            r.setContentHandle("marathon_match_winners");

            Map<String, ResultSetContainer> result = getDataAccess(DBMS.DW_DATASOURCE_NAME,true).getData(r);

            ResultSetContainer rsc = null;
            
            if (sc == DATE_COLUMN || sc == NAME_COLUMN || sc == PROBLEM_COLUMN) {
                rsc = result.get("marathon_match_winners_rounds");
                rsc = new ResultSetContainer(rsc, new RoundDisplayNameCalculator("display_name"));

                if (sc == DATE_COLUMN) sc = rsc.getColumnIndex("date");
                else if (sc == NAME_COLUMN) sc = rsc.getColumnIndex("display_name");
                else sc = rsc.getColumnIndex("problem_name");
                
                rsc.sortByColumn(sc, !"desc".equals(sortDir));                
                rsc = new ResultSetContainer(rsc, sr, endRank);

                ResultSetContainer winners = result.get("marathon_match_winners");
                Map<String, List<Winner>> winnersMap = new HashMap<String, List<Winner>>();
                
                for (ResultSetContainer.ResultSetRow row : winners) {
                    String roundId = "r" + row.getStringItem("round_id");
                    List<Winner> l = winnersMap.get(roundId);
                    if (l == null) {
                        l = new ArrayList<Winner>();
                        winnersMap.put(roundId, l);
                    }
                    l.add(new Winner(row.getIntItem("coder_id"), row.getIntItem("num_wins")));                
                }
                

                getRequest().setAttribute("winnersMap", winnersMap);

            } else if (sc == HANDLE_COLUMN || sc == NUM_WINS_COLUMN) {
                rsc = result.get("marathon_match_winners");
    
                int handleCol = rsc.getColumnIndex("handle");
                int winsCol = rsc.getColumnIndex("num_wins");
                
                if (sc == HANDLE_COLUMN){
                    rsc.sortByColumn(handleCol, winsCol, !"desc".equals(sortDir), false);
                    sc = handleCol;
                } else {
                    rsc.sortByColumn(winsCol, handleCol, !"desc".equals(sortDir), true);
                    sc = winsCol;
                }

                rsc = new ResultSetContainer(rsc, sr, endRank);
                rsc = new ResultSetContainer(rsc, new RoundDisplayNameCalculator("display_name"));

                getRequest().setAttribute("ungrouped", true);
                
            } else throw new NavigationException("Bad sort column: " + sc);

            SortInfo s = new SortInfo();
            s.addDefault(DATE_COLUMN, "desc");
            s.addDefault(NUM_WINS_COLUMN, "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
            setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);

            setDefault(DataAccessConstants.NUMBER_RECORDS, nr);
            setDefault(DataAccessConstants.START_RANK, sr);

            getRequest().setAttribute("list", rsc);

            setNextPage(Constants.PAGE_MATCH_WINNERS);
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
    public static class Winner {
        int coderId;
        int numWins;
        
        public Winner(int coderId, int numWins) {
            this.coderId = coderId;
            this.numWins = numWins;
        }

        public int getCoderId() {
            return coderId;
        }

        public int getNumWins() {
            return numWins;
        }
        
        
    }

}

