/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

/**
 * This utility class is responsible for returning appropriate "context" for
 * given phase ID. This context can be further used in pretty rendering of 
 * user handle
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class TCO09Helper {
    
    /**
     * Class can't be instantiated.
     */
    private TCO09Helper (){
    }
    
    /**
     * Returns context for a given phase ID.
     * @param phaseId phase for which context should be returned
     * @return context name or null if no mapping for requested phase id is present
     */
    public static String getContext(int phaseId) {
        switch (phaseId) {
            case TCO09Constants.DESIGN_PHASE_ID:
                return "design";
            case TCO09Constants.DEVELOPMENT_PHASE_ID:
                return "development";
        }
        return null;
    }
}
