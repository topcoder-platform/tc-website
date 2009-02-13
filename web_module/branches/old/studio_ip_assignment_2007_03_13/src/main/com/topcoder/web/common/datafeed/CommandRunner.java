package com.topcoder.web.common.datafeed;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;


/**
 * Run a command from the query tool and stores the result.
 * 
 * @author Cucu
 */
public class CommandRunner {
    
    private Request request;
    private Map dataMap = null;
    private DataAccessInt dataAccess = null;
    
    /**
     * Create a CommandRunner.
     * 
     * @param dataAccess data access where the command will run.
     * @param request request to run.
     */
    public CommandRunner(DataAccessInt dataAccess, Request request) {
        this.request = request;
        this.dataAccess = dataAccess;
    }
    
    /**
     * Get the data map obtained by running the command.  If it hasn't been run yet, it will run,
     * if not, the cached value will be used.
     * 
     * @return a Map of the execution of the command.
     * @throws Exception
     */
    public Map getData() throws Exception {
        if (dataMap == null) {
            dataMap = dataAccess.getData(request);
        }
        
        return dataMap;
    }
    
    
}
