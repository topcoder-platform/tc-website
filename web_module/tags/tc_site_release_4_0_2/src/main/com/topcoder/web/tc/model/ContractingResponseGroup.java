/*
 * ContractingResponseGroup.java
 *
 * Created on October 7, 2004, 2:55 PM
 */

package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author  rfairfax
 */
public class ContractingResponseGroup implements Serializable {

    String name;
    ArrayList responses;

    public ContractingResponseGroup() {
        name = "";
        responses = new ArrayList();
    }

    public String getName() {
        return name;
    }

    public void setName(String n) {
        name = n;
    }

    public List getResponses() {
        return responses;
    }

    public void addResponse(ContractingResponse r) {
        responses.add(r);
    }

}
