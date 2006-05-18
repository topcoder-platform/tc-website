package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicResponse extends Base {
    private Identifier id = new Identifier();
    private User user;
    private DemographicQuestion question;
    private DemographicAnswer answer;
    private String response;

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public User getUser() {
        try {
            return (User)user.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("something wrong, User is not cloneable");
        }
    }

    public void setUser(User user) {
        id.setUserId(user.getId());
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
        id.setDemographicQuestionId(question.getId());
        this.question = question;
    }

    public DemographicAnswer getAnswer() {
        return answer;
    }

    public void setAnswer(DemographicAnswer answer) {
        id.setDemographicAnswerId(answer.getId());
        this.answer = answer;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }


    public static class Identifier implements Serializable {
        private Long userId;
        private Long demographicQuestionId;
        private Long demographicAnswerId;

        public Identifier() {

        }

        public Identifier(Long userId, Long demographicQuestionId, Long demographicAnswerId) {
            this.userId = userId;
            this.demographicQuestionId = demographicQuestionId;
            this.demographicAnswerId = demographicAnswerId;
        }

        public Long getUserId() {
            return userId;
        }

        public void setUserId(Long userId) {
            this.userId = userId;
        }

        public Long getDemographicQuestionId() {
            return demographicQuestionId;
        }

        public void setDemographicQuestionId(Long demographicQuestionId) {
            this.demographicQuestionId = demographicQuestionId;
        }

        public Long getDemographicAnswerId() {
            return demographicAnswerId;
        }

        public void setDemographicAnswerId(Long demographicAnswerId) {
            this.demographicAnswerId = demographicAnswerId;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    DemographicResponse.Identifier oa = (DemographicResponse.Identifier) o;
                    return (oa.userId.equals(userId) &&
                            oa.demographicQuestionId.equals(demographicQuestionId) &&
                            oa.demographicAnswerId.equals(demographicAnswerId));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(userId);
            buf.append(" ");
            buf.append(demographicQuestionId);
            buf.append(" ");
            buf.append(demographicAnswerId);
            return buf.toString().hashCode();
        }
    }



}
