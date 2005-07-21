/*
 * SiteTest.java
 *
 * Created on July 21, 2005, 11:52 AM
 */

package com.topcoder.utilities;

import com.meterware.httpunit.*;

import com.topcoder.shared.util.logging.Logger;

/**
*
* @author mtong
* 
* Checks if a site can be accessed normally. This class can be expanded in the future to include
* additional tests.
*/
public class SiteTest {
    
    private static Logger log = Logger.getLogger(SiteTest.class);
    
    public boolean check(String url) {
        WebConversation wc = new WebConversation();
        WebRequest wr = new GetMethodWebRequest(url);
        WebResponse resp = null;
        try {
            resp = wc.getResponse(wr);
        } catch (Exception e) {
            return false;
        }
        return validResponse(resp);
    }
    
    //  verifies that the return code of the result page is correct
    private boolean validResponse(WebResponse resp) {
        if(resp.getResponseCode() != 200) {
            log.info("SiteTest: Bad Response Code from " + resp.getURL().toString() + " (Resp: " + resp.getResponseCode() + ")");
            return false;
        }

        log.info("SiteTest: Good Response from " + resp.getURL().toString());
        return true;
    }
}