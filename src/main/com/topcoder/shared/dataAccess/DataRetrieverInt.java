package com.topcoder.shared.dataAccess;

import java.util.*;
/** 
 * This interface needs to be implemented for a data retriever.  Data 
 * retrievers should take in request and produce data stored in a Map
 * as a response.
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 * @author Greg Paul
 */

public interface DataRetrieverInt {
    public Map executeCommand(Map map) throws Exception;
}

