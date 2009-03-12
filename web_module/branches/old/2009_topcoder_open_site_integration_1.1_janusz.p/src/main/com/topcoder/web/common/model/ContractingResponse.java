/*
 * ContractingResponse.java
 *
 * Created on October 7, 2004, 2:53 PM
 */

package com.topcoder.web.common.model;

/**
 *
 * @author rfairfax
 */

import java.io.Serializable;

public class ContractingResponse implements Serializable {

    /**
     * Creates a new instance of ContractingResponse
     */

    private String name;
    private String val;

    public ContractingResponse() {
        name = "";
        val = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        name = n;
    }

    public String getVal() {
        return val;
    }

    public void setVal(String v) {
        val = v;
    }

}
