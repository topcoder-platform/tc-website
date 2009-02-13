package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;

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

    public DemographicResponse() {
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
                if (oa.getUser()==null) {
                    log.warn("other user is null ");
                }
                if (getUser()==null) {
                    log.warn("user is null");
                }
                //log.debug(" compare " + oa.getQuestion().getId() + " " + question.getId() + " " + oa.getAnswer().getId() + " " + getAnswer().getId());
                boolean sameUser = (oa.getUser().getId() == null && getUser().getId() == null) ||
                        (oa.getUser().getId() != null && getUser().getId() != null && oa.getUser().getId().equals(getUser().getId()));
                boolean sameQuestion = (oa.getQuestion().getId() == null && getQuestion().getId() == null) ||
                        (oa.getQuestion().getId() != null && getQuestion().getId() != null && oa.getQuestion().getId().equals(getQuestion().getId()));
                boolean sameAnswer = (oa.getAnswer().getId() == null && getAnswer().getId() == null) ||
                        (oa.getAnswer().getId() != null && getAnswer().getId() != null && oa.getAnswer().getId().equals(getAnswer().getId()));
                boolean sameResponse = true;
                if (getQuestion().isFreeForm()) {
                    sameResponse = (oa.getResponse() == null && getResponse() == null) ||
                            (oa.getResponse() != null && oa.getResponse().equals(getResponse()));
                }
                boolean ret = sameUser && sameQuestion && sameAnswer && sameResponse;
                return ret;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getUser() == null) {
            buf.append("");
        } else if (getUser().getId() == null) {
            buf.append(getUser().hashCode());
        } else {
            buf.append(getUser().getId());
        }
        buf.append(" ");
        if (getAnswer() == null) {
            buf.append("");
        } else if (getAnswer().getId() == null) {
            buf.append(getAnswer().hashCode());
        } else {
            buf.append(getAnswer().getId());
        }
        buf.append(" ");
        if (getQuestion() == null) {
            buf.append("");
        } else if (getQuestion().getId() == null) {
            buf.append(getQuestion().hashCode());
        } else {
            buf.append(getQuestion().getId());
        }
        if (getQuestion().isFreeForm()) {
            buf.append(" ");
            if (getResponse() == null) {
                buf.append("");
            } else {
                buf.append(getResponse());
            }
        }
        int ret = buf.toString().hashCode();
        //log.debug(buf.toString() + " code: " + ret);
        return ret;
    }

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





