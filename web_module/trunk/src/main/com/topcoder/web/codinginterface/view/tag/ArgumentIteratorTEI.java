package com.topcoder.web.codinginterface.view.tag;

import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;
import javax.servlet.jsp.tagext.TagData;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 21, 2005
 */
public class ArgumentIteratorTEI extends TagExtraInfo {
    public VariableInfo[] getVariableInfo(TagData data) {
        VariableInfo[] variableInfo = new VariableInfo[] {
            new VariableInfo(ArgumentIterator.INDEX, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(ArgumentIterator.ARGUMENT, String.class.getName(), true, VariableInfo.NESTED),
            new VariableInfo(ArgumentIterator.DIMENSION, String.class.getName(), true, VariableInfo.NESTED),
        };

        return variableInfo;
    }
}
