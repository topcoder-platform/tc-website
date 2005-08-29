package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.*;

import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.common.LongRoundResults;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.distCache.CacheClient;


public class ComponentScores extends Base{
    protected static final Logger log = Logger.getLogger(ComponentScores.class);

    protected void businessProcessing() throws TCWebException {
        try{
            TCRequest request = getRequest();
            CacheClient cc = null;
            LongRoundResults lrr = null;
            boolean hasCacheConnection = true;
            int cid = Integer.parseInt(request.getParameter(Constants.COMPONENT_ID));
            int rd = Integer.parseInt(request.getParameter(Constants.ROUND_ID));
            String sort = request.getParameter(Constants.SORT_ORDER);
            String startRow = request.getParameter(Constants.START_ROW);
            String startCol = request.getParameter(Constants.START_COL);
            String rowCount = request.getParameter(Constants.ROW_COUNT);
            String colCount = request.getParameter(Constants.COL_COUNT);
            if(startRow == null)startRow = "0";
            if(startCol == null)startCol = "0";
            if(rowCount == null)rowCount = Constants.DEFAULT_ROW_COUNT;
            if(colCount == null)colCount = Constants.DEFAULT_COL_COUNT;
            if(sort == null)sort = "T";
            String key = "LongRoundsResults_"+cid+"_"+rd;
            try {
                cc = CacheClientFactory.createCacheClient();
                lrr = (LongRoundResults) (cc.get(key));
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                hasCacheConnection = false;
            }
            if(lrr == null){
                lrr = getLongRoundResults(cid,rd);
                if (hasCacheConnection) {
                    try {
                        cc.set(key, lrr, 1000 * 60 * Constants.RESULTS_REFRESH);
                    } catch (Exception e) {
                        log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                    }
                }
            }
            Request r = new Request();
            r.setContentHandle("long_contest_over");
            r.setProperty(Constants.COMPONENT_ID,String.valueOf(cid));
            r.setProperty(Constants.ROUND_ID,String.valueOf(rd));
            DataAccessInt dataAccess = getDataAccess(false);
            Map m = dataAccess.getData(r);
            boolean over = ((ResultSetContainer)m.get("long_contest_over")).getBooleanItem(0,0);


            StringTokenizer st = new StringTokenizer(sort,"_");
            int[] order = new int[st.countTokens()];
            for(int i = 0; i<order.length; i++){
                String s = st.nextToken();
                if(s.equals("T")){
                    order[i] = LongRoundResults.Record.TOTAL_SORT;
                }else if(s.equals("-T")){
                    order[i] = -LongRoundResults.Record.TOTAL_SORT;
                }else if(s.equals("C")){
                    order[i] = LongRoundResults.Record.CODER_SORT;
                }else if(s.equals("-C")){
                    order[i] = -LongRoundResults.Record.CODER_SORT;
                }else{
                    order[i] = Integer.parseInt(s);
                }
            }
            lrr.sort(order);
            request.setAttribute(Constants.RESULTS, lrr.getRecords());
            request.setAttribute(Constants.CONTEST_OVER, new Boolean(over));
            request.setAttribute(Constants.START_ROW, new Integer(startRow));
            request.setAttribute(Constants.START_COL, new Integer(startCol));
            request.setAttribute(Constants.ROW_COUNT, new Integer(rowCount));
            request.setAttribute(Constants.COL_COUNT, new Integer(colCount));
            request.setAttribute(Constants.PRIMARY_COLUMN, new Integer(order[0]));
            request.setAttribute(Constants.SORT_ORDER,sort);
            setNextPage(Constants.RESULTS_TABLE_JSP);
            setIsNextPageInContext(true);
        }catch(TCWebException e){
            throw e;
        }catch(Exception e){
            e.printStackTrace();
            throw new TCWebException("Error retrieving page.");
        }
    }
    private LongRoundResults getLongRoundResults(int cid, int rd) throws Exception {
        Request r = new Request();
        r.setContentHandle("component_scores");
        r.setProperty(Constants.COMPONENT_ID,String.valueOf(cid));
        r.setProperty(Constants.ROUND_ID,String.valueOf(rd));
        DataAccessInt dataAccess = getDataAccess(false);
        Map m = dataAccess.getData(r);
        ResultSetContainer scores = (ResultSetContainer)m.get("long_scores");
        ResultSetContainer tests = (ResultSetContainer)m.get("long_test_scores");
        int count = ((ResultSetContainer)m.get("long_test_count")).getIntItem(0,0);
        boolean started = ((ResultSetContainer)m.get("long_contest_started")).getBooleanItem(0,0);
        String className = ((ResultSetContainer)m.get("long_class_name")).getStringItem(0,0);
        if(!started){
            throw new TCWebException("The contest has not started yet.");
        }
        lrr.setClassName(className);
        Map totalScores = new TreeMap();//need to use tree for the ordering
        Map testScores = new TreeMap();
        Map coders = new TreeMap();
        Set testCases = new TreeSet();
        Iterator it = scores.iterator();
        while(it.hasNext()){//get the score totals
            ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow)it.next();
            int coder_id = rsr.getIntItem("coder_id");
            double score = rsr.getDoubleItem("points");
            String handle = rsr.getStringItem("handle");
            Object key = new Integer(coder_id);
            totalScores.put(key,new Double(score));
            testScores.put(key, new ArrayList());
            coders.put(key, handle);
        }
        it = tests.iterator();
        while(it.hasNext()){//get the individual scores
            ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow)it.next();
            int test_id = rsr.getIntItem("test_case_id");
            int coder_id = rsr.getIntItem("coder_id");
            double score = rsr.getDoubleItem("score");
            ArrayList al = (ArrayList)testScores.get(new Integer(coder_id));
            if(al == null)continue;
            al.add(new Double(score));
            testCases.add(new Integer(test_id));
        }
        it = totalScores.keySet().iterator();
        while(it.hasNext()){
            Object key = it.next();
            ArrayList al = (ArrayList)testScores.get(key);
            if(al.size() != count){
                totalScores.remove(key);
                testScores.remove(key);
                coders.remove(key);
            }
        }
        log.info(coders);
        return new LongRoundResults(new ArrayList(testScores.values()), new ArrayList(testCases), new ArrayList(coders.keySet()), new ArrayList(totalScores.values()), new ArrayList(coders.values()), cid, rd);
    }
}
