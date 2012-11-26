package com.topcoder.web.email.bean;


import java.io.Serializable;


/**

 * FieldValue.java

 *

 * Contains two String properties - field and value.

 * Used to iterate through field/value pairs of address

 * list fields.

 *

 * @author 	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class FieldValue

        implements Serializable {

    protected String field;

    protected String value;


    public FieldValue() {

    }


    public void setField(String field) {

        this.field = field;

    }


    public String getField() {

        return field;

    }


    public void setValue(String value) {

        this.value = value;

    }


    public String getValue() {

        return value;

    }


    public String toString() {

        return "Field: " + field + ", Value: " + value;

    }

}