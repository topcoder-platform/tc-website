/*
 * TCO05CompRegistrants.java
 *
 * Created on June 24, 2005, 12:22 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.request.Base;
import java.util.Map;

/**
 *
 * @author rfairfax
 */
public class TCO05AlgRegistrants extends Base {
    
    public void businessProcessing() {
        try {
            Request r = new Request();
            r.setContentHandle("tco05_alg_registrants");
        
            Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false).getData(r);
        
            ResultSetContainer rsc = (ResultSetContainer)m.get("tco05_alg_registrants");
            
            getRequest().setAttribute("list", rsc);
            
            setNextPage("/tournaments/tco05/alg_registrants.jsp");
            setIsNextPageInContext(true);
            
        } catch (Exception e) {
        }
    }
}
