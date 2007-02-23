package com.topcoder.web.forums.model;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentVersionInfo;

/**
 * @author mtong
 * 
 * Image data for software component icons.
 */
public class ImageData {
    private static final String PHASE_COMPLETE_ICON = "iconStatusCompleteSm.gif";
    private static final String PHASE_COLLAB_ICON = "iconStatusCollabSm.gif";
    private static final String PHASE_SPEC_ICON = "iconStatusSpecSm.gif";
    private static final String PHASE_DEV_ICON = "iconStatusDevSm.gif";
    
    private static final String PHASE_COMPLETE_TEXT = "Complete";
    private static final String PHASE_COLLAB_TEXT = "Collaboration";
    private static final String PHASE_SPEC_TEXT = "Design and Architecture";
    private static final String PHASE_DEV_TEXT = "Development and Testing";
    
    private static final String TECH_JAVA_ICON = "javaSm.gif";
    private static final String TECH_JAVA_CUSTOM_ICON = "javaCustomSm.gif";
    private static final String TECH_NET_ICON = "dotnetSm.gif";
    private static final String TECH_NET_CUSTOM_ICON = "dotnetCustomSm.gif";
    private static final String TECH_FLASH_ICON = "flashSm.gif";
    private static final String TECH_APPLICATION_ICON = "appSm.gif";
    
    private static final String TECH_JAVA_TEXT = "Java";
    private static final String TECH_JAVA_CUSTOM_TEXT = "Java Custom";
    private static final String TECH_NET_TEXT = ".NET";
    private static final String TECH_NET_CUSTOM_TEXT = ".NET Custom";
    private static final String TECH_FLASH_TEXT = "Flash";
    private static final String TECH_APPLICATION_TEXT = "Application";
    
    public static final long PHASE_IDS[] = {
        ComponentVersionInfo.COLLABORATION, ComponentVersionInfo.SPECIFICATION,
            ComponentVersionInfo.DEVELOPMENT, ComponentVersionInfo.COMPLETED
    };
    public static final String[][] PHASE_PROPERTIES = {
        {PHASE_COLLAB_ICON, PHASE_SPEC_ICON, PHASE_DEV_ICON, PHASE_COMPLETE_ICON},
        {PHASE_COLLAB_TEXT, PHASE_SPEC_TEXT, PHASE_DEV_TEXT, PHASE_COMPLETE_TEXT}
    };
    public static final long TECH_IDS[] = {
        Catalog.JAVA_CATALOG, Catalog.JAVA_CUSTOM_CATALOG, Catalog.NET_CATALOG, Catalog.NET_CUSTOM_CATALOG,
        Catalog.FLASH_CATALOG, Catalog.APPLICATION_CATALOG
    };
    public static final String[][] TECH_PROPERTIES = {
        {TECH_JAVA_ICON, TECH_JAVA_CUSTOM_ICON, TECH_NET_ICON, TECH_NET_CUSTOM_ICON,
         TECH_FLASH_ICON, TECH_APPLICATION_ICON},
        {TECH_JAVA_TEXT, TECH_JAVA_CUSTOM_TEXT, TECH_NET_TEXT, TECH_NET_CUSTOM_TEXT,
         TECH_FLASH_TEXT, TECH_APPLICATION_TEXT}
    };
    
    private String phaseIcon;
    private String phaseText;
    private String technologyIcon;
    private String technologyText;
    
    public String getPhaseIcon() {
        return phaseIcon;
    }
    public String getPhaseText() {
        return phaseText;
    }
    public String getTechnologyIcon() {
        return technologyIcon;
    }
    public String getTechnologyText() {
        return technologyText;
    }
    
    public ImageData(long componentPhase, long rootCategoryID) {
        phaseIcon = phaseText = technologyIcon = technologyText = "";
        for (int i=0; i<PHASE_IDS.length; i++) {
            if (componentPhase == PHASE_IDS[i]) {
                phaseIcon = PHASE_PROPERTIES[0][i];
                phaseText = PHASE_PROPERTIES[1][i];
            }
        }
        for (int i=0; i<TECH_IDS.length; i++) {
            if (rootCategoryID == TECH_IDS[i]) {
                technologyIcon = TECH_PROPERTIES[0][i];
                technologyText = TECH_PROPERTIES[1][i];
            }
        }
    }
}