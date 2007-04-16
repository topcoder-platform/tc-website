package com.topcoder.web.common.model;

/**
 * @author cucu
 */
@SuppressWarnings("serial")
public class IntroEventPropertyType extends Base {

    public Integer GENERAL_TYPE = new Integer(1);
    public Integer ALGO_TYPE = new Integer(2);
    public Integer COMP_TYPE = new Integer(3);
    
    
    private Integer id;
    private String description;
    private Integer type;
    private boolean mandatory;
    
    
    protected IntroEventPropertyType() {        

    }


    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }


    public boolean isMandatory() {
        return mandatory;
    }


    public void setMandatory(boolean mandatory) {
        this.mandatory = mandatory;
    }


    public Integer getType() {
        return type;
    }

}

