/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.util.HashMap;
import java.util.Map;

/**
 * This class defines constants that specify "phase_id"s values used to 
 * determine what competition user views. This class can be instantiated 
 * and extends a HashMap in order to allow using it in JSTL tags. After
 * initialization this Map can't be changed.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public final class TCO09Constants extends HashMap<String, Object> {
    
    /**
     * This flag is used to mark map as initialized, when object is initialized
     * it can't be modified. 
     */
    private boolean initialized = false;
    
    /**
     * Serial version UID for serialization
     */
    private static final long serialVersionUID = 421341234812312378L;
    
    /**
     * Design phase ID (consistent with TC site).
     */
    public final static int DESIGN_PHASE_ID = 112;
    
    /**
     * Development phase ID (consistent with TC site).
     */
    public final static int DEVELOPMENT_PHASE_ID = 113;
    
    /**
     * Architecture phase ID (consistent with TC site).
     */
    public final static int ARCHITECTURE_PHASE_ID = 118;
    
    /**
     * Specification phase ID (consistent with TC site).
     */
    public final static int SPECIFICATION_PHASE_ID = 134;

    /**
     * Assembly phase ID (consistent with TC site).
     */
    public final static int ASSEMBLY_PHASE_ID = 125;
    

    /**
     * Algorithm Qualification phase ID (there is no phase id for such 
     * competition, thus arbitrary value has been used).
     */
    public final static int ALGORITHM_QUALIFICATION_PHASE_ID = 1001;
    
    /**
     * Algorithm Competition phase ID (there is no phase id for such 
     * competition, thus arbitrary value has been used).
     */
    public final static int ALGORITHM_PHASE_ID = 1002;
    
    /**
     * Marathon match phase ID (there is no phase id for such 
     * competition, thus arbitrary value has been used).
     */
    public final static int MARATHON_MATCH_PHASE_ID = 1004;
    
    /**
     * Mod Dash phase ID (there is no phase id for such 
     * competition, thus arbitrary value has been used).
     */
    public final static int MOD_DASH_PHASE_ID = 1005;
    
    /**
     * Initializes the class by adding all defined constants to the map.
     */
    public TCO09Constants() {
       this.put("DESIGN_PHASE_ID", DESIGN_PHASE_ID);
       this.put("DEVELOPMENT_PHASE_ID", DEVELOPMENT_PHASE_ID);
       this.put("ARCHITECTURE_PHASE_ID", ARCHITECTURE_PHASE_ID);
       this.put("SPECIFICATION_PHASE_ID", SPECIFICATION_PHASE_ID);
       this.put("ASSEMBLY_PHASE_ID", ASSEMBLY_PHASE_ID);
       this.put("ALGORITHM_QUALIFICATION_PHASE_ID", ALGORITHM_QUALIFICATION_PHASE_ID);
       this.put("ALGORITHM_PHASE_ID", ALGORITHM_PHASE_ID);
       this.put("MARATHON_MATCH_PHASE_ID", MARATHON_MATCH_PHASE_ID);
       this.put("MOD_DASH_PHASE_ID", MOD_DASH_PHASE_ID);
       initialized = true;
    }
    
    /**
     * Prevents user from clearing the map after initialization. 
     */
    public void clear() {
        if (!initialized)
            super.clear();
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 
    /**
     * Prevents user from adding objects to the map after initialization. 
     */
    public Object put(String key, Object value) {
        if (!initialized)
            return super.put(key, value);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 
    /**
     * Prevents user from adding objects to the map after initialization. 
     */
    public void putAll(Map m) {
        if (!initialized)
            super.putAll(m);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 

    /**
     * Prevents user from removing objects from the map after initialization. 
     */
    public Object remove(Object key) {
        if (!initialized)
            return super.remove(key);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
}
