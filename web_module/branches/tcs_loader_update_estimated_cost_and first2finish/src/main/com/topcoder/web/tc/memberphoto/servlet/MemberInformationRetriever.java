/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

/**
 * <p>
 * This interface defines the contract to retrieve the member information.
 * </p>
 * <p>
 * <b>Thread-safety:</b> implementation should be thread-safe.
 * </p>
 * @author AleaActaEst, microsky
 * @version 1.0
 */
public interface MemberInformationRetriever {
    /**
     * <p>
     * Retrieve the member information for the given member id.
     * </p>
     * @param memberId the member id.
     * @return the member information.
     * @throws MemberInformationRetrievalException if fail to retrieve the
     *             member information.
     */
    public MemberInformation getMemberInformation(long memberId)
        throws MemberInformationRetrievalException;
}
