package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

import java.util.ArrayList;
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
        DataAccessInt dAccess = getDataAccess();
        
        Request dr = new Request();
        dr.setContentHandle("profileList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map == null || map.size() != 1)
            throw new ScreeningException("Data retrieval error");
        
        ResultSetContainer result = 
            (ResultSetContainer)map.get("profileList");


        getRequest().setAttribute("profileList", result);

        setNextPage(Constants.PROFILE_LIST_PAGE);
        setNextPageInContext(true);
    }

}
