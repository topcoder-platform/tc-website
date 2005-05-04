/*
 * MemberProfile.java
 *
 * Created on May 3, 2005, 3:22 PM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import java.util.Map;

/**
 *
 * @author rfairfax
 */
public class MemberProfile extends Base { 
    
    protected void businessProcessing() throws TCWebException {
        try {
            //step 1, get the base data used for the top section           
            if(!hasParameter("cr")) {
                throw new TCWebException("Invalid Coder ID");
            }
            
            String coderId = getRequest().getParameter("cr");
            
            Request r = new Request();
            r.setContentHandle("member_profile");
            r.setProperty("cr", coderId);

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("Coder_Data");
                        
            getRequest().setAttribute("resultMap", result);
            
            //here we want to get the current tab, then load data for that tab
            
            setNextPage(Constants.MEMBER_PROFILE);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
}
