/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;


/**
 * Wrapping class for the contact project manager data.
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ContactPMData extends OnlineReviewProjectData {

    // --------------------------------------------------- Instance Variables

    /**
     * The message subject.
     */
    private String messageSubject = null;

    /**
     * The message text.
     */
    private String messageText = null;

    // ------------------------------------------------------------ Constructor

    /**
     * <p>
     * Creates the instance of <code>ContactPMData</code> class.
     * </p>
     *
     * @param orpd The OnlineReviewProjectData to be set.
     * @param subject The message subject to be set.
     * @param text The message text to be set.
     */
    protected ContactPMData(OnlineReviewProjectData orpd,
                            String subject, String text) {
        super(orpd);

        if (subject == null || text == null) {
            throw new NullPointerException();
        }

        this.messageSubject = subject;
        this.messageText = text;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * <p>
     * Return the message text.
     * </p>
     *
     * @return a String with the message text.
     */
    public String getMessageText() {
        return messageText;
    } // end getMessageText

    /**
     * <p>
     * Return the message subject.
     * </p>
     *
     * @return a String with the message subject.
     */
    public String getSubject() {
        return messageSubject;
    } // end getSubject

} // end ContactPMData



