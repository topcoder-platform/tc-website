package com.topcoder.util.idgenerator.bean;

/**
 * The id generator exception.  
 * 
 * @version 1.0  
 * @author Timur Zambalayev
 */ 
public final class IdGenException extends Exception {

    /**
     * Creates an instance of this class.
     * 
     * @param message   message.
     */ 
    IdGenException(String message) {
        super(message);
    }
    
}
