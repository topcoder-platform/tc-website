package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class CurrentSchool extends Base {

    private Long id;
    private Coder coder;
    private School school;
    private Float GPA;
    private Float GPAScale;
    private Boolean viewable;

    public CurrentSchool() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public Float getGPA() {
        return GPA;
    }

    public void setGPA(Float GPA) {
        this.GPA = GPA;
    }

    public Float getGPAScale() {
        return GPAScale;
    }

    public void setGPAScale(Float GPAScale) {
        this.GPAScale = GPAScale;
    }

    public Boolean getViewable() {
        return viewable;
    }

    public void setViewable(Boolean viewable) {
        this.viewable = viewable;
    }


}
