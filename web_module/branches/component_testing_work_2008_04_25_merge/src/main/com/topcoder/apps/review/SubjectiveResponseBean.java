/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.ResponseType;
import com.topcoder.apps.review.document.SubjectiveResponse;

/**
 * <p>
 * Java bean for the scorecard question.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class SubjectiveResponseBean {

    // --------------------------------------------------- Instance Variables

    /**
     * The subjective response.
     */
    private SubjectiveResponse response = null;

    /**
     * The possible response types.
     */
    private ResponseType[] responseTypes = null;

    /**
     * The possible response type strings.
     */
    private String[] responseAnswers = null;

    /**
     * Whether the input of this response is valid.
     */
    private boolean isValid = true;

    // --------------------------------------------------------- Constructors

    /**
     * Creates the <code>SubjectiveResponseBean</code> instance from the
     * SubjectiveResponse.
     *
     * @param response The SubjectiveResponse.
     */
    protected SubjectiveResponseBean(SubjectiveResponse response) {
        BusinessDelegate businessDelegate = new BusinessDelegate();

        this.response = response;
        responseTypes = businessDelegate.getResponseTypes();

        responseAnswers = new String[responseTypes.length];
        for (int i = 0; i < responseTypes.length; i++) {
            responseAnswers[i] = responseTypes[i].getName();
        }
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Return the response text.
     *
     * @return the response text.
     */
    public String getResponseText() {
        return response.getResponseText();
    }

    /**
     * Set the response text.
     *
     * @param text The response text.
     */
    public void setResponseText(String text) {
        response.setResponseText(text.trim());
    }

    /**
     * Return the response type
     *
     * @return the response type
     */
    public String getResponseType() {
        if (response.getResponseType() != null) {
            return response.getResponseType().getName();
        } else {
            return null;
        }
    }

    /**
     * Set the response type.
     *
     * @param type The response type.
     */
    public void setResponseType(String type) {
        for (int i = 0; i < responseTypes.length; i++) {
            if (responseTypes[i].getName().equals(type)) {
                response.setResponseType(responseTypes[i]);
            }
        }
    }

    /**
     * Return the possible response type strings
     *
     * @return the possible response type strings
     */
    public String[] getResponseAnswers() {
        return responseAnswers;
    }

    /**
     * Set whether the input of this response is valid.
     *
     * @param isValid Whether the input of this response is valid.
     */
    protected void setValid(boolean isValid) {
        this.isValid = isValid;
    }

    /**
     * Return whether the input of this response is valid.
     *
     * @return whether the input of this response is valid.
     */
    public boolean getValid() {
        return isValid;
    }

    // ------------------------------------------------------- Protected Methods

    /**
     * Return the response.
     *
     * @return the response.
     */
    protected SubjectiveResponse getResponse() {
        return response;
    }
}