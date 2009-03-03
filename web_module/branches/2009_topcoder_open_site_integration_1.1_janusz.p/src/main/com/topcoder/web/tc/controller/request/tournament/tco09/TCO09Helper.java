package com.topcoder.web.tc.controller.request.tournament.tco09;

public class TCO09Helper {
    private TCO09Helper (){
        
    }
    public static String getContext(int phaseId) {
        switch (phaseId) {
            case TCO09Constants.ARCHITECTURE_PHASE_ID:
                return "architecture";
            case TCO09Constants.ASSEMBLY_PHASE_ID:
                return "assembly";
            case TCO09Constants.DESIGN_PHASE_ID:
                return "design";
            case TCO09Constants.DEVELOPMENT_PHASE_ID:
                return "development";
            case TCO09Constants.SPECIFICATION_PHASE_ID:
                return "specification";
        }
        return "";
    }
}
