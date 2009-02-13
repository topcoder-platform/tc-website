/*
* EPServlet
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller;

import java.util.MissingResourceException;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ep.arena.RoundEventInitializer;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EPServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(EPServlet.class);

    @Override
    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("EP");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

    
    @Override
    public void destroy() {
        super.destroy();
        RoundEventInitializer.release();
    }
}
