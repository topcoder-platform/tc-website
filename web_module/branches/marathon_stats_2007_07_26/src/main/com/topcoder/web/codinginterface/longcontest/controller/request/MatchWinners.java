package com.topcoder.web.codinginterface.longcontest.controller.request;

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

/**
 * List the winner(s) for each match.
 * 
 * @author cucu
 */
public class MatchWinners extends Base {

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
            
            if (sc == 1 || sc == 2) {
                rsc = result.get("marathon_match_winners_rounds");

                if (sc == 1) sc = rsc.getColumnIndex("date");
                else if (sc == 2) sc = rsc.getColumnIndex("name");
                
                rsc.sortByColumn(sc, !"desc".equals(sortDir));                
                rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank)-1, endRank);

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
                
                SortInfo s = new SortInfo();
                s.addDefault(rsc.getColumnIndex("date"), "desc");
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                getRequest().setAttribute("winnersMap", winnersMap);

            } else if (sc == 3 || sc == 4) {
                rsc = result.get("marathon_match_winners");
    
                int handleCol = rsc.getColumnIndex("handle");
                int winsCol = rsc.getColumnIndex("num_wins");
                
                if (sc == 3){
                    rsc.sortByColumn(handleCol, winsCol, !"desc".equals(sortDir), false);
                    sc = handleCol;
                } else {
                    rsc.sortByColumn(winsCol, handleCol, !"desc".equals(sortDir), true);
                    sc = winsCol;
                }

                rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank)-1, endRank);

                SortInfo s = new SortInfo();
                s.addDefault(rsc.getColumnIndex("num_wins"), "desc");
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
                getRequest().setAttribute("ungrouped", true);
                
            } else throw new NavigationException("Bad sort column: " + sc);

            setDefault(DataAccessConstants.SORT_COLUMN, sc + "");
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

