package com.topcoder.web.stat.common;

import java.util.*;
import com.topcoder.web.stat.bean.*;
/** 
 * This interface needs to be implemented for any data-retrievers running
 * in the servlet context.
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2002/03/16 20:18:40  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/06 04:14:54  tbone
 *           added to cvs
 *
 */

public interface StatDataAccessInt {
    public Map getData(StatRequestBean srb) throws DataRetrievalException;
}

