package com.topcoder.web.common.datafeed;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


/**
 * Data Feed that is able to run with parameters from it's parent rows.
 * This is usefull if you want that for each row or a RSC, a query is executed with parameters taken from that row.
 * 
 * @author Cucu
 */
public class RSCParamDataFeed extends RSCBaseDataFeed {

    private Request request;
    private DataAccessInt dataAccess = null;
    private String query;
    private Map params;
    
    /**
     * Create a Data Feed that is able to run with parameters from it's parent rows.
     * 
     * @param rootTag tag that wraps all the rsc rows.
     * @param rowTag tag for each row of the rsc.
     * @param dataAccess used to run the command.
     * @param request request to be passed to the dataAccess.
     * @param query query to retrieve in the command.
     */
    public RSCParamDataFeed(String rootTag, String rowTag, DataAccessInt dataAccess, Request request, String query) {
        super(rootTag, rowTag);
        this.request = request;
        this.dataAccess = dataAccess;
        this.query = query;
        params = new HashMap();        
    }
    
    /**
     * Maps a field with a parameter.  For example, user_id can be mapped to cr, then the field user_id will be retrieved
     * in the parent ResultSetContainer and passed as parameter ct when executing the command.
     * 
     * @param paramName name of the parameter for this command.
     * @param field name of the field in the parent ResultSetContainer.
     */
    public void addParam(String paramName, String field){
        params.put(paramName, field);
    }

    /**
     * Get the ResultSetContainer.
     * It runs the command specified in the constructor using the mapped parameters.
     */
    protected ResultSetContainer getRSC(ResultSetContainer.ResultSetRow parentRow) throws Exception{
        Request r = new Request(request.getProperties());
        
        for (Iterator it = params.entrySet().iterator(); it.hasNext(); ) {
            Map.Entry e = (Map.Entry) it.next();
            r.setProperty((String) e.getKey(), parentRow.getStringItem((String) e.getValue()));
        }

        return (ResultSetContainer) dataAccess.getData(r).get(query);
    }
    
}
