package com.topcoder.web.email.servlet.jsp.tag;


import com.topcoder.web.email.bean.FieldValue;
import com.topcoder.web.email.servlet.EmailConstants;

import java.util.ArrayList;
import java.util.List;


/**

 * Custom tag to iterate through all the field names

 * of an address list - each field name is given as a

 * FieldValue object whose value is the field name.

 * This might sound confusing... but this is for displaying

 * the field names as textfields, so the field names are the

 * values, and the field keys are the fields.  For example,

 * if the field list is {"Name", "Address"}, then the

 * first FieldValue object will have a field of "field-0"

 * and a value of "Name" ("field-" is the field prefix given

 * in EmailConstants).

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class MemberDataFieldNameIteratorTag

        extends IteratorTag {

    // the maximum number of total fields

    protected int maxNumFields;

    // the true index into the fields array

    protected int trueIndex;


    public void setFields(List fields) {

        List fieldList = new ArrayList(fields);



        // move default e-mail field to position zero

        int emailIndex = fieldList.indexOf(EmailConstants.EMAIL_ADDRESS_TAG);

        if (emailIndex >= 0) {

            fieldList.remove(emailIndex);

        }

        fieldList.add(0, EmailConstants.EMAIL_ADDRESS_TAG);


        setCollection(fieldList);

    }


    public void setMaxNumFields(int maxNumFields) {

        this.maxNumFields = maxNumFields;

    }


    Object getElementAt(int index) {

        if (index < maxNumFields) {

            FieldValue fieldValue = new FieldValue();


            fieldValue.setField(EmailConstants.FIELD_PREFIX + index);

            if (index < elementArray.length) {

                fieldValue.setValue((String) elementArray[index]);

            } else {

                fieldValue.setValue("");

            }


            return fieldValue;

        } else {

            return null;

        }

    }

}