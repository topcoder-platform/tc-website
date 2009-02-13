package com.topcoder.shared.dataAccess;

import java.util.*;
/** 
 * This interface needs to be implemented for any data-retrievers running
 * in the servlet context.
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
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
    public Map getData(RequestInt request) throws Exception;
}

