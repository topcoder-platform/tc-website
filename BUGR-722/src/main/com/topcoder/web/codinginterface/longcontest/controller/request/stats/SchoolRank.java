package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;

/**
 * 
 * @author Cucu
 *
 */
public class SchoolRank extends Base {


    public void longContestProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("marathon_school_rank");
        ResultSetContainer rsc = getDataAccess(DBMS.DW_DATASOURCE_NAME, true).getData(r).get("marathon_school_rank");;
        
        getRequest().setAttribute("list", rsc);
        
        setNextPage(Constants.PAGE_SCHOOL_RANK);
        setIsNextPageInContext(true);    

    }
}
