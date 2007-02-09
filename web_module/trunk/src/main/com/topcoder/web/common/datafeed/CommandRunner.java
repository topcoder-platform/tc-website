package com.topcoder.web.common.datafeed;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;


public class CommandRunner {
    private Request request;
    private Map dataMap = null;
    private DataAccessInt dataAccess = null;
    
    public CommandRunner(DataAccessInt dataAccess, Request request) {
        this.request = request;
        this.dataAccess = dataAccess;
    }
    
    public Map getData() throws Exception {
        if (dataMap == null) {
            dataMap = dataAccess.getData(request);
        }
        
        return dataMap;
    }
    
    
}
