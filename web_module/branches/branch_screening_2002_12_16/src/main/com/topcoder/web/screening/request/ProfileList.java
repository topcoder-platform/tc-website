package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Map;

/**
 * Processing for the Profile List page.
 * @author Porgery
 */
public class ProfileList extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        InitialContext context = new InitialContext();
        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        
        Request dr = new Request();
        dr.setContentHandle("profileList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map != null && map.size() == 1)
        {
            ResultSetContainer result = 
                (ResultSetContainer)map.get("profileList");
            getRequest().setAttribute("profileList", result);
        }

        setNextPage(Constants.PROFILE_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}
