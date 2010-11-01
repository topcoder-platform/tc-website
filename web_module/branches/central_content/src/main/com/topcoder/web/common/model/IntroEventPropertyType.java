package com.topcoder.web.common.model;

/**
 * @author cucu
 */
public class IntroEventPropertyType extends Base {

    public static final Integer GENERAL_TYPE = new Integer(1);
    public static final Integer ALGO_TYPE = new Integer(2);
    public static final Integer COMP_TYPE = new Integer(3);


    private Integer id;
    private String description;
    private Integer type;
    private boolean mandatory;
    private String explanation;
    private String defaultValue;
    private Boolean viewable;


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


    public String getDefaultValue() {
        return defaultValue;
    }


    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }


    public String getExplanation() {
        return explanation;
    }


    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }


    public Boolean getViewable() {
        return viewable;
    }


    public void setViewable(Boolean viewable) {
        this.viewable = viewable;
    }


    public void setDescription(String description) {
        this.description = description;
    }

}

