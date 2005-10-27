package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultColumn;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;

public class ViewActiveContests extends Base{
	
    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {
//        try {
//            TCRequest request = getRequest();
//            
//        }catch(TCWebException e){
//            throw e;
//        }catch(Exception e){
//            e.printStackTrace();
//            throw new TCWebException("Error retrieving page.");
//        }
    	
    	try {
	    	DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_active_contests");
	    	
	    	Map m = dai.getData(r);
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_active_contests");
	    	
	    	for(int i = 0; i < rsc.getRowCount(); i++) {
	    		for(int j = 0; j < rsc.getColumnCount(); j++) {
	    			//ResultColumn col = rsc.getColumnInfo(j);
	    			System.out.print(rsc.getStringItem(i,j));
	    		}
	    		System.out.println();
	    	}
	    	
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	
    	
    	setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
    	setIsNextPageInContext(true);
    }
}
