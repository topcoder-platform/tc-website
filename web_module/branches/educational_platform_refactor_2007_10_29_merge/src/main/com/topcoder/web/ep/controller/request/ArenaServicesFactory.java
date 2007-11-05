/*
* ArenaServicesFactory
*
* Created Oct 2, 2007
*/
package com.topcoder.web.ep.controller.request;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ArenaServicesFactory {
    public static ArenaServices getArenaServices(){
        return new ArenaHelper();
    }
}
