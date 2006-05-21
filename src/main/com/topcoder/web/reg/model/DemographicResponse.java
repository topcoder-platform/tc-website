package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class DemographicResponse extends Base {
    protected static final Logger log = Logger.getLogger(DemographicResponse.class);
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
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public DemographicQuestion getQuestion() {
        return question;
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public DemographicAnswer getAnswer() {
        return answer;
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


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                DemographicResponse oa = (DemographicResponse) o;
                boolean sameUser = (oa.user.getId()==null&&user.getId()==null) ||
                        (oa.user.getId()!=null&&user.getId()!=null&&oa.user.getId().equals(user.getId()));
                boolean sameQuestion = (oa.question.getId()==null&&question.getId()==null) ||
                        (oa.question.getId()!=null&&question.getId()!=null&&oa.question.getId().equals(question.getId()));
                boolean sameAnswer = (oa.answer.getId()==null&&answer.getId()==null) ||
                        (oa.answer.getId()!=null&&answer.getId()!=null&&oa.answer.getId().equals(answer.getId()));
                boolean sameResponse = (oa.response==null&&response==null) ||
                        (oa.response.equals(response));
                return sameUser&&sameQuestion&&sameAnswer&&sameResponse;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (user==null) {
            buf.append("");
        } else if(user.getId()==null) {
            buf.append(user.hashCode());
        } else {
            buf.append(user.getId());
        }
        buf.append(" ");
        if (answer==null) {
            buf.append("");
        } else if(answer.getId()==null) {
            buf.append(answer.hashCode());
        } else {
            buf.append(answer.getId());
        }
        buf.append(" ");
        if (question==null) {
            buf.append("");
        } else if(question.getId()==null) {
            buf.append(question.hashCode());
        } else {
            buf.append(question.getId());
        }
        buf.append(" ");
        if (response==null) {
            buf.append("");
        } else {
            buf.append(response.hashCode());
        }
        //log.debug(buf.toString());
        return buf.toString().hashCode();
    }

/*
    public static class Identifier implements Serializable, Cloneable {
        private Long userId;
        private Long demographiextends BasecQuestionId;
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
*/


    public static class Identifier implements Serializable, Cloneable {

        private User user;
        private DemographicQuestion question;
        private DemographicAnswer answer;

        public Identifier() {

        }

        public Identifier(User user, DemographicQuestion question, DemographicAnswer answer) {
            this.user = user;
            this.question = question;
            this.answer = answer;
        }

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public DemographicQuestion getQuestion() {
            return question;
        }

        public void setQuestion(DemographicQuestion question) {
            this.question = question;
        }

        public DemographicAnswer getAnswer() {
            return answer;
        }

        public void setAnswer(DemographicAnswer answer) {
            this.answer = answer;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    DemographicResponse.Identifier oa = (DemographicResponse.Identifier) o;
                    return (oa.user.getId().equals(user.getId()) &&
                            oa.question.getId().equals(question.getId()) &&
                            oa.answer.getId().equals(answer.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(user.getId());
            buf.append(" ");
            buf.append(question.getId());
            buf.append(" ");
            buf.append(answer.getId());
            return buf.toString().hashCode();
        }


    }


}
