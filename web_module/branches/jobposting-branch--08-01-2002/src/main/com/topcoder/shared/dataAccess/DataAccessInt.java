package com.topcoder.shared.dataAccess;

import java.util.Map;

/**
 * This interface needs to be implemented for any data-retrievers running
 * in the servlet context.
 *
 * @author tbone
 * @version $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.1  2002/07/03 00:30:22  gpaul
 *           moving over here
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:40  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/06 04:14:54  tbone
 *           added to cvs
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

