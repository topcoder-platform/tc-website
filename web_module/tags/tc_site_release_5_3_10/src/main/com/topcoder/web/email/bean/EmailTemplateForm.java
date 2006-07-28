package com.topcoder.web.email.bean;


import java.io.Serializable;
import java.util.ArrayList;


/**

 * Bean to store information about a template from a form

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class EmailTemplateForm

        implements Serializable {

    protected int id;

    protected String name;

    protected String template;

    protected int group;



    // keep track of whether or not this template has been added

    // (to avoid duplicates when reloading pages)

    protected boolean added = false;


    public EmailTemplateForm() {

        added = false;

    }


    public void setAdded(boolean added) {

        this.added = added;

    }


    public boolean isAdded() {

        return added;

    }


    /**

     * This method validates the fields of the template.  Returns an

     * empty ArrayList if there are no errors.  Otherwise returns an

     * ArrayList of error messages.

     *

     * @return ArrayList		list of error messages

     */


    public ArrayList validate() {

        ArrayList errors = new ArrayList();


        String name = getName();

        if (name.length() == 0) errors.add("Name cannot be empty.");


        String template = getTemplate();

        if (template.length() == 0) errors.add("Template cannot be empty.");


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


    public void setTemplate(String template) {

        this.template = template;

    }


    public String getTemplate() {

        return (template == null ? "" : template);

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

        sb.append("Template:\n");

        sb.append(template);


        return sb.toString();

    }


}