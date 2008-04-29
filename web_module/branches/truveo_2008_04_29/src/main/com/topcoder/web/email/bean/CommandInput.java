package com.topcoder.web.email.bean;


import java.io.Serializable;


/**

 * Contains properties of a predefined query input (id, code, description, value).

 *

 * @author 	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class CommandInput

        implements Serializable {

    protected int id;

    protected String code;

    protected String description;

    protected String value;


    public CommandInput() {

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


    public void setCode(String code) {

        this.code = code;

    }


    public String getCode() {

        return (code == null ? "" : code);

    }


    public void setDescription(String description) {

        this.description = description;

    }


    public String getDescription() {

        return (description == null ? "" : description);

    }


    public void setValue(String value) {

        this.value = value;

    }


    public String getValue() {

        return (value == null ? "" : value);

    }


    public String toString() {

        return "ID: " + id + ", Code: " + code + ", Description: " + description;

    }

}