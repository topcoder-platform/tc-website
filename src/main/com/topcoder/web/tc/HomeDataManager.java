/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc;

import java.util.List;
import java.util.Map;

import com.topcoder.web.tc.dto.ActiveContestsSummary;
import com.topcoder.web.tc.dto.MemberInfo;
import com.topcoder.web.tc.dto.TopTenDTO;

/**
 * <p>
 * The interface defines the methods that are needed for the Home Page
 * </p>
 * 
 * @author TCSASSEMBLIER
 * @version 1.0
 */
public interface HomeDataManager {

    public static final String DESIGN = "design";
    
    public static final String ASSEMBLY = "assembly";
    
    public static final String DEVELOPMENT = "dev";

    public static final String TEST_SUITES = "testsuites";

    public static final String TEST_SCENARIOS = "testscenarios";

    public static final String ARCHITECTURE= "arch";
    
    public static final String CONCEPTUALIZATION = "concept";
    
    public static final String SPECIFICATION = "spec";
    
    public static final String STUDIO = "studio";
    
    public static final String UI_PROTOTYPE = "uiprototype";
    
    public static final String RIA_BUILD = "riabuild";
    
    public static final String RIA_COMPONENT = "riacomponent";

    public static final String COPILOT_POSTING = "copilotposting";

    public static final String CONTENT_CREATION = "contentcreation";

    public static final String BUGS = "bugs";
    
    public static final String DR = "dr";
    
    public static final String MM = "mm";
    
    public static final String NEXT_ALGO = "nextalgo";
    
	MemberInfo retrieveMemberDetails(long coderId);
	
	Map<String, ActiveContestsSummary> retrieveActiveContestsSummary();
	
	Map<String, List<TopTenDTO>> retrieveTop10Details();
}
