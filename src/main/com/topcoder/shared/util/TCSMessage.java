package com.topcoder.shared.util;

import org.apache.log4j.Category;

/**
 * The TCSMessage is the base class for messaging services
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1  2002/05/21 18:42:50  steveb
 *           SB
 *
 *           Revision 1.1.2.1  2002/04/17 12:34:11  apps
 *           Initial implementation.
 *
 */
public abstract class TCSMessage {

    private static Category trace = Category.getInstance( TCSMessage.class.getName() );
    
}
