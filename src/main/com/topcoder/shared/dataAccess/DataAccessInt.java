package com.topcoder.shared.dataAccess;

import java.util.Map;

/**
 * This interface needs to be implemented for any data-retrievers running
 * in the servlet context.
 *
 * @author tbone
 * @version $Revision$
 *
 */

public interface DataAccessInt {
    /**
     * Takes a request and produces a Map filled with the requested data.
     * @param request
     * @return the requested data
     * @throws Exception
     */
    public Map getData(RequestInt request) throws Exception;
}

