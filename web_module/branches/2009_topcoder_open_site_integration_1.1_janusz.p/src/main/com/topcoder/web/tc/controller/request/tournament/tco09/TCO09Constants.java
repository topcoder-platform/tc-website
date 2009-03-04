package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.util.HashMap;
import java.util.Map;

public final class TCO09Constants extends HashMap<String, Object> {
    
    private boolean initialized = false;
    /**
     *  
     */
    private static final long serialVersionUID = 1L;
    
    public final static int DESIGN_PHASE_ID = 112;
    public final static int DEVELOPMENT_PHASE_ID = 113;
    public final static int ARCHITECTURE_PHASE_ID = 118;
    public final static int SPECIFICATION_PHASE_ID = 134;
    public final static int ASSEMBLY_PHASE_ID = 125;
    public final static int ALGORITHM_QUALIFICATION_PHASE_ID = 1001;
    public final static int ALGORITHM_PHASE_ID = 1002;
    public final static int MARATHON_MATCH_PHASE_ID = 1004;
    public TCO09Constants() {
       this.put("DESIGN_PHASE_ID", DESIGN_PHASE_ID);
       this.put("DEVELOPMENT_PHASE_ID", DEVELOPMENT_PHASE_ID);
       this.put("ARCHITECTURE_PHASE_ID", ARCHITECTURE_PHASE_ID);
       this.put("SPECIFICATION_PHASE_ID", SPECIFICATION_PHASE_ID);
       this.put("ASSEMBLY_PHASE_ID", ASSEMBLY_PHASE_ID);
       this.put("ALGORITHM_QUALIFICATION_PHASE_ID", ALGORITHM_QUALIFICATION_PHASE_ID);
       this.put("ALGORITHM_PHASE_ID", ALGORITHM_PHASE_ID);
       this.put("MARATHON_MATCH_PHASE_ID", MARATHON_MATCH_PHASE_ID);
       initialized = true;
    }
    public void clear() {
        if (!initialized)
            super.clear();
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 
    public Object put(String key, Object value) {
        if (!initialized)
            return super.put(key, value);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 
    public void putAll(Map m) {
        if (!initialized)
            super.putAll(m);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
 
    public Object remove(Object key) {
        if (!initialized)
            return super.remove(key);
        else
            throw new UnsupportedOperationException("Cannot modify this map");
    }
}
