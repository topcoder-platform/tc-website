/*
 * TCCC05ProjectDetails.java
 *
 * Created on January 5, 2005, 3:24 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;
/**
 *
 * @author rfairfax
 */
public class TCCC05ProjectDetails extends StatBase {
    
    String getCommandName() {
        return "tccc05_project_details";
    }
    
    String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }
    
    String getPageName() {
        return "/tournaments/tccc05/project_det.jsp";
    }
    
    void statProcessing() throws com.topcoder.web.common.TCWebException {
    }
    
}
