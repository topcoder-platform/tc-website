package com.topcoder.web.email.servlet.jsp.tag;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.email.bean.FieldValue;
import com.topcoder.web.email.bean.MemberData;

import java.util.List;


/**
 * Custom tag to iterate through the field/value
 * pairs of an address list member.
 *
 * @author    James Lee (jameslee@cs.stanford.edu)
 * @version    1.0
 *
 */


public class MemberDataFieldValueIteratorTag
        extends IteratorTag {
    private static Logger log = Logger.getLogger(MemberDataFieldValueIteratorTag.class);

    protected MemberData memberData;
    protected int index;

    public void setFields(List fields) {
        setCollection(fields);
    }

    public void setMemberData(MemberData memberData) {
        this.memberData = memberData;
    }

    Object getElementAt(int index) {
        Object element = super.getElementAt(index);
        if (element != null) {
            FieldValue fieldValue = new FieldValue();

            String field = (String) element;
            String value = "";
            if (memberData != null) {
                value = memberData.getValue(field);
            }

            fieldValue.setField(field);
            fieldValue.setValue(value);

            return fieldValue;
        } else {
            return null;
        }
    }

    public void release() {
        super.release();
        this.memberData = null;
    }


}
