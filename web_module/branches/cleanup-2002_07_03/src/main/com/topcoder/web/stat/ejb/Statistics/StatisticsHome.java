package com.topcoder.web.stat.ejb.Statistics;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 * The home interface for the coder statistics EJB.
 *
 * @author  Dave Pecora
 * @version 1.00, 02/11/2002 
 */

public interface StatisticsHome extends EJBHome {
    /**
     * Creates and returns a <tt>Statistics</tt> object.
     *
     * @return  A new <tt>Statistics</tt> object.
     */
    Statistics create() throws CreateException, RemoteException;
}

