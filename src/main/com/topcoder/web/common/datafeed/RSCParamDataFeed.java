package com.topcoder.web.common.datafeed;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class RSCParamDataFeed extends RSCBaseDataFeed {

    private Request request;
    private DataAccessInt dataAccess = null;
    private String query;
    private Map params;
    
    public RSCParamDataFeed(String rootTag, String rowTag, DataAccessInt dataAccess, Request request, String query) {
        super(rootTag, rowTag);
        this.request = request;
        this.dataAccess = dataAccess;
        this.query = query;
        params = new HashMap();        
    }
    
    public void addParam(String paramName, String rowName){
        params.put(paramName, rowName);
    }

    protected ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception{
        Request r = new Request(request.getProperties());
        
        for (Iterator it = params.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry e = (Map.Entry) it.next();
            r.setProperty((String) e.getKey(), parentRow.getStringItem((String) e.getValue()));
        }

        return (ResultSetContainer) dataAccess.getData(r).get(query);
    }
    
}
