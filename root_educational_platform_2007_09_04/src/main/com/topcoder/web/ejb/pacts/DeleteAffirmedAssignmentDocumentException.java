package com.topcoder.web.ejb.pacts;

/**
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 */
public class DeleteAffirmedAssignmentDocumentException extends Exception {
    
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object. 
     */
    private static final long serialVersionUID = 1L;
    
    public DeleteAffirmedAssignmentDocumentException() {
        super();
    }

    public DeleteAffirmedAssignmentDocumentException(String message, Throwable t) {
        super(message, t);
    }

    public DeleteAffirmedAssignmentDocumentException(String message) {
        super(message);
    }

    public DeleteAffirmedAssignmentDocumentException(Throwable t) {
        super(t);
    }
}
