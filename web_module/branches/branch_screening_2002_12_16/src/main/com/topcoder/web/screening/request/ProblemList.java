package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Map;
import java.util.ArrayList;

/**
 * Processor for Problem List page.
 * @author Porgery
 */
public class ProblemList extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
//        authorize(getSelfRedirect());
        
        InitialContext context = new InitialContext();
        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        
        Request dr = new Request();
        dr.setContentHandle("problemList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map != null && map.size() == 1)
        {
            ResultSetContainer result = 
                (ResultSetContainer)map.get("problemList");
            
            ArrayList list = new ArrayList();
            if(result != null && result.size() > 0){
                TCResultItem round;
                int start=0;
                while(start < result.size()){
                    round = result.getItem(start,"session_round_id");
                    int end = start; 
                    while(end < result.size() && 
                        round.equals(result.getItem(end,"session_round_id")))
                            end++;
                    list.add(result.subList(start,end));
                    start = end;
                }
            }
            
            getRequest().setAttribute("problemList", list);
        }

        setNextPage(Constants.PROBLEM_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}
