package com.topcoder.web.admin.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.shared.util.ApplicationServer;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 2, 2005
 */
public class Login extends BaseProcessor {


    protected void businessProcessing() throws Exception {

        setNextPage("/tc?module=Login&nextpage="+ApplicationServer.SERVER_NAME+"/admin");
        setIsNextPageInContext(false);


    }



}
