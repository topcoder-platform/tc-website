/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.tag.HandleTag;

import java.util.Arrays;

/**
 * <p>A processor to be used for retrieving the reliability detail for <code>Assembly</code> track.</p>
 * 
 * @author isv
 * @version 1.0 (Release Assembly - TopCoder Assembly Track Subtypes Integration Assembly 1.0)
 */
public class AssemblyReliabilityDetail extends ReliabilityDetail {

    /**
     * <p>Constructs new <code>AssemblyReliabilityDetail</code> instance. This implementation does nothing.</p>
     */
    public AssemblyReliabilityDetail() {
    }

    /**
     * <p>Gets the name for competition track matching the specified project category.</p>
     *
     * @param projectTypeId an <code>int</code> providing the ID of requested project category.
     * @return a <code>String</code> providing the comma-separated list of project category IDs.
     */
    @Override
    protected String getHandleType(int projectTypeId) {
        return HandleTag.ASSEMBLY;
    }

    /**
     * <p>Gets the ID for requested project category to retrieve data for.</p>
     *
     * @return an <code>int</code> providing the ID for requested project category.
     * @throws TCWebException if an unexpected error occurs.
     */
    @Override
    protected int getProjectTypeId() throws TCWebException {
        return WebConstants.MODULE_ASSEMBLY_PROJECT_TYPE;
    }

    /**
     * <p>Gets the list of project category IDs for data retrieval.</p>
     *
     * @param projectTypeId an <code>int</code> providing the ID of requested project category.
     * @return a <code>String</code> providing the comma-separated list of project category IDs.
     */
    @Override
    protected String getProjectTypeIds(int projectTypeId) {
        String arrayText = Arrays.toString(WebConstants.ASSEMBLY_TRACK_SUBTYPES);
        return arrayText.substring(1, arrayText.length() - 1);
    }
}
