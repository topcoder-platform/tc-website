package com.topcoder.web.email.bean;


import com.topcoder.web.email.servlet.EmailConstants;

import java.io.Serializable;
import java.util.*;


/**

 * Bean to store information about an address list from a form

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 */


public class AddressListForm

        implements Serializable {

    protected int id;

    protected String name;

    protected int group;

    protected List fields;


    public AddressListForm() {

        name = "";

        fields = new ArrayList();

    }


    /**

     * This method validates the fields of the address list form.

     * Returns an empty ArrayList if there are no errors.  Otherwise

     * returns an ArrayList of error messages.

     *

     * @return ArrayList		list of error messages

     */


    public ArrayList validate() {

        ArrayList errors = new ArrayList();


        String name = getName();

        if (name.length() == 0) errors.add("Name cannot be empty.");


        List fields = getFields();

        if (fields.size() == 0) errors.add("There must be at least one field.");


        if (!fields.contains(EmailConstants.EMAIL_ADDRESS_TAG)) {

            errors.add("'" + EmailConstants.EMAIL_ADDRESS_TAG + "' must be one of the fields.");

        }


        for (Iterator i = fields.iterator(); i.hasNext();) {

            String field = (String) i.next();

            // add individual field checking here if necessary

        }


        return errors;

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

        return (name == null ? "" : name);

    }


    public void setGroup(String group) {

        try {

            this.group = Integer.parseInt(group);

        } catch (NumberFormatException e) {

            this.group = 0;

        }

    }


    public String getGroup() {

        return "" + group;

    }


    public void setFields(List fields) {

        this.fields = fields;

    }


    public List getFields() {

        return fields;

    }


    public String toString() {

        StringBuffer sb = new StringBuffer(2000);


        sb.append("ID: ");

        sb.append(id);

        sb.append("\n");

        sb.append("Name: ");

        sb.append(name);

        sb.append("\n");

        sb.append("Group: ");

        sb.append(group);

        sb.append("\n");

        sb.append("Fields: ");

        sb.append(fields);


        return sb.toString();

    }

}