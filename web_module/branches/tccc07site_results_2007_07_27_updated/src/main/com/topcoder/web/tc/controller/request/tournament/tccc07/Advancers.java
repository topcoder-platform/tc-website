/*
* Advancers
*
* Created Aug 1, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Advancers extends AdvancersBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getRoundsSort()
     */
    @Override
    protected Map<Long, Integer> getRoundsSort() {
        Map<Long, Integer> map = new HashMap<Long, Integer>();
        
        map.put(new Long(10738), 1);
        map.put(new Long(10742), 1);
        map.put(new Long(10743), 1);

        map.put(new Long(10749), 2);
        map.put(new Long(10751), 3);
        map.put(new Long(10759), 4);

        map.put(new Long(10839), 5);
        map.put(new Long(10840), 5);
        map.put(new Long(10841), 5);

        map.put(new Long(10842), 6);
        map.put(new Long(10843), 7);
        
        return null;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getTournamentInstances()
     */
    @Override
    protected int getNumberInstances() {
        return 7;
    }

}
