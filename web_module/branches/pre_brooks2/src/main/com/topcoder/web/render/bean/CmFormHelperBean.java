/*
   CmFormHelperBean
   A JavaBean containing utility methods for assisting in creation of HTML
   forms.

   By John C. Bollinger
   Copyright 2002, TopCoder, Inc.
 */

package com.topcoder.web.render.bean;

import java.io.Serializable;
import java.util.List;

public class CmFormHelperBean implements Serializable {

    public static String optionList(List items) {
        return optionList(items, -1);
    }

    public static String optionList(List items, int inx) {
        return optionList(items, inx, true);
    }

    public static String optionList(List items, int match, boolean indexed) {
        return optionList(items, match, indexed, indexed);
    }

    public static String optionList(List items, int match, boolean indexed, boolean matchInx) {
        StringBuffer output = new StringBuffer();
        Object li;
        int id, val, sel;
        for (int i = 0; i < items.size(); i++) {
            li = items.get(i);
            id = li.hashCode();
            val = indexed ? i : id;
            sel = matchInx ? i : id;
            output.append("<option value='" + val + "'"
                    + ((sel == match) ? " selected='yes'>" : ">")
                    + li.toString() + "</option>");
        }
        return output.toString();
    }

}