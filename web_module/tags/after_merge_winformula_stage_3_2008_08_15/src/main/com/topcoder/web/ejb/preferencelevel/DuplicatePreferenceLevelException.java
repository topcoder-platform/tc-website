/*
 * TCS Screening Tool 1.1
 *
 * DuplicatePreferenceLevelException.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.ejb.preferencelevel;

import com.topcoder.web.common.TCWebException;


/**
 * <p>An exception to be thrown to indicate that the preference level for specified candidate relevant to specified
 * company already exists.</p>
 *
 * <p>This exception will contain the IDs of requested candidate and company that can be obtained via appropriate <code>
 * get-</code> methods.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class DuplicatePreferenceLevelException extends TCWebException {

    /**
     * A <code>long</code> ID of a requested candidate a lookup for preference level relevant to specified company had
     * failed for.
     */
    private long candidateId = 0;

    /**
     * A <code>long</code> ID of a company a lookup for preference level.
     */
    private long companyId = 0;

    /**
     * Constructs new <code>DuplicatePreferenceLevelException</code> with specified ID of a candidate and a company.
     *
     * @param candidateId a <code>long</code> containing the ID of requested candidate.
     * @param companyId a <code>long</code> containing the ID of requested company.
     */
    public DuplicatePreferenceLevelException(long candidateId, long companyId) {
        super();
        this.candidateId = candidateId;
        this.companyId = companyId;
    }

    /**
     * Constructs new <code>DuplicatePreferenceLevelException</code> with specified ID of a candidate and a company and
     * a <code>String</code> details providing the description of an occured exception.
     *
     * @param details a <code>String</code> details of created exception.
     * @param candidateId a <code>long</code> containing the ID of requested candidate.
     * @param companyId a <code>long</code> containing the ID of requested company.
     */
    public DuplicatePreferenceLevelException(String details, long candidateId, long companyId) {
        super(details);
        this.candidateId = candidateId;
        this.companyId = companyId;
    }

    /**
     * Gets the ID of requested candidate.
     *
     * @return a <code>long</code> containing the ID of requested candidate.
     */
    public long getUserId() {
        return candidateId;
    }

    /**
     * Gets the ID of requested company.
     *
     * @return a <code>long</code> containing the ID of requested company.
     */
    public long getCompanyId() {
        return companyId;
    }
}
