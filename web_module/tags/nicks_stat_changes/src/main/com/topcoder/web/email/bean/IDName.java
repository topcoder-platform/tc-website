package com.topcoder.web.email.bean;


import java.io.Serializable;


/**

 * IDName.java

 *

 * Contains an integer ID and String name.

 * Used by custom tags for iterating through

 * id/name pairs (for mail templates,

 * address lists, etc...)

 *

 * @author 	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class IDName

        implements Serializable {

    protected int id;

    protected String name;


    public IDName() {

    }


    public void setId(String id) {

        try {

            this.id = Integer.parseInt(id);

        } catch (NumberFormatException e) {

            this.id = 0;

        }

    }


    public String getId() {

        return "" + id;

    }


    public void setName(String name) {

        this.name = name;

    }


    public String getName() {

        return name;

    }


    public String toString() {

        return "ID: " + id + ", Name: " + name;

    }

}