package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.security.User;
import com.topcoder.web.screening.model.ProblemInfo;

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
        User user = getAuthentication().getActiveUser();

        Request dr = new Request();
        dr.setContentHandle("problemList");
        dr.setProperty("uid", String.valueOf(user.getId()));
        
        Map map = getDataAccess(true).getData(dr);

        if(map == null || map.size() != 1)
            throw new ScreeningException("Data retrieval error");

        ResultSetContainer result = 
            (ResultSetContainer)map.get("problemList");
            
        ArrayList list = new ArrayList();
        if(result != null && result.size() > 0){
            String round;
            int item=0;
            while(item < result.size()){
                ArrayList subList = new ArrayList(3);
                round = result.getItem(item,"session_round_id").toString();
                while(item < result.size() && 
                    round.equals(result.getItem(item,"session_round_id").toString())){
                        String problem = result.getItem(item,"problem_id").toString();
                        subList.add(
                            ProblemInfo.createProblemInfo(user,
                                                          Long.parseLong(round),
                                                          Long.parseLong(problem)));
                        item++;
                }
                list.add(subList);
            }
        }
        
        getRequest().setAttribute("problemList", list);

        setNextPage(Constants.PROBLEM_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}
