/*
* ArenaServicesFactory
*
* Created Oct 2, 2007
*/
package com.topcoder.web.ep.arena;

/**
 * Factory for the arena services provider
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id: ArenaServicesFactory.java 66901 2007-11-05 19:50:28Z pulky $
 */
public class ArenaServicesFactory {
    public static ArenaServices getArenaServices(){
        return new ArenaHelper();
    }
}
