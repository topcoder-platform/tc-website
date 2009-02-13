package com.topcoder.web.stat.ejb.Statistics;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;

/** 
 * This remote interface needs to be implemented for any Stats data-retrievers 
 * running in the EJB context.
 *
 * @author  Dave Pecora
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.3  2002/04/02 18:00:38  apps
 *           Add ability to pass in data source chuck
 *
 *           Revision 1.1.2.2  2002/04/01 18:00:38  apps
 *           Add stat directory for Statistics ejb and related common classes chuck
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:54  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/03/05 16:14:37  dpecora
 *           - Renamed and relocated EJB
 *           - Query mods to fix up stuff broken by iron_man changes
 *
 *           Revision 1.5  2002/02/13 08:35:22  dpecora
 *           Add javadocs, implement ranklists
 *
 *           Revision 1.4  2002/02/06 05:42:02  tbone
 *           my bad, dummy me forgot about rmic
 *
 *           Revision 1.3  2002/02/06 05:21:09  tbone
 *           removed the EJBHome, not needed since we extend BaseEJB in the impl
 *
 *           Revision 1.2  2002/02/06 04:19:14  tbone
 *           made a change to the interfacing, making implementation a runtime choice
 *
 */

public interface Statistics extends EJBObject {
    /**
     * @see StatisticsBean#executeCommand(Map)
     */
    public Map executeCommand(Map inputs) throws RemoteException;

    /**
     * @see StatisticsBean#executeCommand(Map,String)
     */
    public Map executeCommand(Map inputs, String dataSourceName) throws RemoteException;
}

