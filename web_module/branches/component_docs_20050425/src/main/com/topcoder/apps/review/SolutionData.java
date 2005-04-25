/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import java.io.InputStream;

/**
 * Wrapping class for the solution data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class SolutionData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The inputstream for the submitted file.
     */
    private InputStream is;

    /**
     * The remote filename for the submitted file.
     */
    private String filename;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>SolutionData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param solution The solution to be set.
     * @param is The inputstream for the jar file of the submission.
     */
    protected SolutionData(OnlineReviewProjectData orpd,
                           InputStream is,
                           String filename) {
        super(orpd);

        if (is == null) {
            throw new NullPointerException();
        }

        this.is = is;
        this.filename = filename;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the inputstream for the submitted file.
     * </p>
     *
     * @return the inputstream for the submitted file.
     */
    public InputStream getInputStream() {
        return is;
    } // end getInputStream

    /**
     * @return Returns the filename.
     */
    public String getFilename() {
        return filename;
    }

} // end SolutionData



