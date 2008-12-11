package com.topcoder.web.tc.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision: 63542 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public class Nomination extends Base {
    private Integer id;
    private User nominator;
    private Event event;
    private String name;
    private String emailAddress;
    private String schoolName;
    private String fieldOfInstruction;
    private String schoolURL;
    private String text;


    public Integer getId() {
        return id;
    }

    private void setId(Integer id) {
        this.id = id;
    }

    public User getNominator() {
        return nominator;
    }

    public void setNominator(User nominator) {
        this.nominator = nominator;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getFieldOfInstruction() {
        return fieldOfInstruction;
    }

    public void setFieldOfInstruction(String fieldOfInstruction) {
        this.fieldOfInstruction = fieldOfInstruction;
    }

    public String getSchoolURL() {
        return schoolURL;
    }

    public void setSchoolURL(String schoolURL) {
        this.schoolURL = schoolURL;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }
}
