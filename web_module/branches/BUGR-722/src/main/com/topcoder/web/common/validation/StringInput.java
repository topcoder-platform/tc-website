package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class StringInput implements ValidationInput {
    private String input;

    public StringInput(String s) {
        this.input = s;
    }

    public Object getInput() {
        return input;
    }

    public String toString() {
        return input;
    }

}
