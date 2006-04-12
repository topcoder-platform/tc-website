package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicResponse extends Base {
    private User user;
    private DemographicQuestion question;
    private DemographicAnswer answer;
    private String response;

    public User getUser() {
        try {
            return (User)user.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("something wrong, User is not cloneable");
        }
    }

    public void setUser(User user) {
        this.user = user;
    }

    public DemographicQuestion getQuestion() {
        try {
            return (DemographicQuestion)question.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("something wrong, DemographicQuestion is not cloneable");
        }
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public DemographicAnswer getAnswer() {
        try {
            return (DemographicAnswer)answer.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("something wrong, DemographicAnswer is not cloneable");
        }
    }

    public void setAnswer(DemographicAnswer answer) {
        this.answer = answer;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}
