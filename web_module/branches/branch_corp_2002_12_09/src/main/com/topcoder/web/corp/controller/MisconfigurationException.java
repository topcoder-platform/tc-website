package com.topcoder.web.corp.controller;

/**
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class MisconfigurationException extends Exception {
    public MisconfigurationException(String msg) {
        super(msg);
    }
    public MisconfigurationException(String msg, Exception causedBy) {
        super(msg, causedBy);
    }
}
