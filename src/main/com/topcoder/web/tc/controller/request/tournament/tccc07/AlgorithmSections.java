/*
* AlgorithmSections
*
* Created Aug 1, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tccc07;

import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.AdvancersBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: AlgorithmSections.java 64579 2007-08-29 21:16:17Z pulky $
 */
public class AlgorithmSections extends AdvancersBase {

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tccc07";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getCommandName()
     */
    @Override
    protected String getCommandName() {
        return "tccc07_alg_sections";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getDataSourceName()
     */
    protected String getDataSourceName() {
        return DBMS.JTS_OLTP_DATASOURCE_NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getPageName()
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/algorithm/sections.jsp";
    }
    
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#getFilter()
     */
    @Override
    protected Map getFilter() throws TCWebException {
        String round = StringUtils.checkNull(getRequest().getParameter(Constants.ROUND_ID));
        if ("".equals(round)) {
            throw new TCWebException("invalid round id parameter.");                
        }
        Long roundId;
        try {
            roundId = Long.parseLong(round);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid round id parameter.");                
        }
        
        getRequest().setAttribute(Constants.ROUND_ID, roundId.toString());

        Map ret = new HashMap(1);
        ret.put(Constants.ROUND_ID, roundId.toString());
        return ret;
    }    
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.AdvancersBase#setSortInfo()
     */
    @Override
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_sort"), "asc");
        s.addDefault(rsc.getColumnIndex("rating"), "desc");
        s.addDefault(rsc.getColumnIndex("seed"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

}