package com.topcoder.shared.security;

/**
 * interface for resources, they could be web pages, web applications etc.
 * anything that one might require authentication for access to.
 * 
 * @author swif0ne <dancohn1@yahoo.com>
 * @version 1.0
 */
public class ProcessorResource extends SimpleResource {
    
    /** 
     * called super constructor with full name of object passed in
     * @param obj Object to get name of resource from
     */
    public ProcessorResource(Objects obj) {
        super(obj.getClass().getName());
    } 
}