/*
 * RoundEventInitializer
 * 
 * Created Oct 12, 2007
 */
package com.topcoder.web.ep.arena;

import com.topcoder.shared.messagebus.BusFactory;
import com.topcoder.shared.messagebus.jms.JMSConfigurationParser;
import com.topcoder.shared.messagebus.jms.activemq.ActiveMQBusFactory;
import com.topcoder.shared.round.events.RoundEventFactory;
import com.topcoder.shared.round.events.bus.RoundEventBusFactory;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author Diego Belfer (mural)
 * @version $Id$
 */
public class RoundEventInitializer {
    private static Logger log = Logger.getLogger(RoundEventInitializer.class);
    private static volatile boolean busInitialized = false;
    private static boolean roundEventInitialized = false;
    
    public static void ensureInitialized() {
        try {
            if (!busInitialized) {
                synchronized (RoundEventInitializer.class) {
                    if (!busInitialized) {
                        BusFactory.configureFactory(new ActiveMQBusFactory(new JMSConfigurationParser().getConfiguration()));
                        busInitialized = true;
                    }
                }
            }
            if (!roundEventInitialized ) {
                synchronized (RoundEventInitializer.class) {
                    if (!roundEventInitialized) {
                        RoundEventFactory.configureFactory(new RoundEventBusFactory());
                        roundEventInitialized = true;
                    }
                }
            }
        } catch (Exception e) {
            log.error("Could not initialize Round event service. Current status bus="+busInitialized+" event="+roundEventInitialized, e);
        }
    }
    
    /**
     * 
     */
    public static void release() {
        if (busInitialized) {
            BusFactory.getFactory().release();
        }
    }
}
