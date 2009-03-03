package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.util.HashMap;
import java.util.Map;

public final class TCO09Constants extends HashMap<String, Object> {
    
    private boolean initialized = false;
    /**
     *  
     */
    private static final long serialVersionUID = 1L;
    public TCO09Constants() {
       this.put("DESIGN_PHASE_ID", 112);
       this.put("DEVELOPMENT_PHASE_ID", 113);
       this.put("ARCHITECTURE_PHASE_ID", 118);
       this.put("SPECIFICATION_PHASE_ID", 134);
       this.put("ASSEMBLY_PHASE_ID", 125);
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
