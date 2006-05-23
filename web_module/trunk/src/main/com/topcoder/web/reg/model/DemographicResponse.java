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
                //log.debug(" compare " + oa.getQuestion().getId() + " " + question.getId() + " " + oa.getAnswer().getId() + " " + getAnswer().getId());
                boolean sameUser = (oa.getUser().getId()==null&&getUser().getId()==null) ||
                        (oa.getUser().getId()!=null&&getUser().getId()!=null&&oa.getUser().getId().equals(getUser().getId()));
                boolean sameQuestion = (oa.getQuestion().getId()==null&&getQuestion().getId()==null) ||
                        (oa.getQuestion().getId()!=null&&getQuestion().getId()!=null&&oa.getQuestion().getId().equals(getQuestion().getId()));
                boolean sameAnswer = (oa.getAnswer().getId()==null&&getAnswer().getId()==null) ||
                        (oa.getAnswer().getId()!=null&&getAnswer().getId()!=null&&oa.getAnswer().getId().equals(getAnswer().getId()));
                boolean sameResponse = true;
                if (getQuestion().isFreeForm()) {
                    sameResponse = (oa.getResponse()==null&&getResponse()==null) ||
                            (oa.getResponse()!=null && oa.getResponse().equals(getResponse()));
                }
                boolean ret = sameUser&&sameQuestion&&sameAnswer&&sameResponse;
                return ret;
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        StringBuffer buf = new StringBuffer(30);

        if (getUser()==null) {
            buf.append("");
        } else if(getUser().getId()==null) {
            buf.append(getUser().hashCode());
        } else {
            buf.append(getUser().getId());
        }
        buf.append(" ");
        if (getAnswer()==null) {
            buf.append("");
        } else if(getAnswer().getId()==null) {
            buf.append(getAnswer().hashCode());
        } else {
            buf.append(getAnswer().getId());
        }
        buf.append(" ");
        if (getQuestion()==null) {
            buf.append("");
        } else if(getQuestion().getId()==null) {
            buf.append(getQuestion().hashCode());
        } else {
            buf.append(getQuestion().getId());
        }
        if (getQuestion().isFreeForm()) {
            buf.append(" ");
            if (getResponse()==null) {
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





/*
2006-05-21 15:30:17,200 [Base] - q 19 a 145 -427181105
2006-05-21 15:30:17,200 [Base] - q 17 a 114 -513992141
2006-05-21 15:30:17,200 [Base] - q 23 a 150 -403168784
2006-05-21 15:30:17,200 [Base] - q 18 a 130 -460427892
2006-05-21 15:30:17,200 [Base] - q 19 a 138 -453039693
2006-05-21 15:30:17,200 [Base] - q 19 a 147 -425334063
2006-05-21 15:30:17,200 [Base] - q 19 a 139 -452116172
2006-05-21 15:30:17,200 [Base] - q 22 a 321 -370990668
2006-05-21 15:30:17,201 [Base] - q 19 a 148 -424410542
2006-05-21 15:30:17,201 [Base] - q 26 a 179 -337598700
2006-05-21 15:30:17,201 [Base] - q 19 a 144 -428104626
2006-05-21 15:30:17,201 [Base] - q 14 a 318 -772001895
2006-05-21 15:30:17,201 [Base] - q 2 a 103 1783581621
2006-05-21 15:30:17,201 [Base] - q 16 a 111 -516762735
2006-05-21 15:30:17,201 [Base] - q 19 a 146 -426257584
2006-05-21 15:30:17,201 [Base] - q 19 a 140 -431798710
2006-05-21 15:30:17,201 [Base] - q 19 a 143 -429028147
2006-05-21 15:30:17,202 [Base] - q 25 a 164 -370845487
2006-05-21 15:30:17,202 [Base] - q 1 a 102 1783551799
2006-05-21 15:30:17,202 [Base] - q 5 a 15 1166044876



2006-05-21 15:30:26,909 [Base] - remove trans response 26 181 -1836672432
2006-05-21 15:30:26,909 [Base] - remove trans response 6 19 -302789496
2006-05-21 15:30:26,909 [Base] - remove trans response 18 132 501553747
2006-05-21 15:30:26,909 [Base] - remove trans response 2 6 -888812128
2006-05-21 15:30:26,909 [Base] - remove trans response 4 13 -1025397589
2006-05-21 15:30:26,910 [Base] - remove trans response 3 10 -1572065397
2006-05-21 15:30:26,910 [Base] - remove trans response 22 321 1286874615
2006-05-21 15:30:26,910 [Base] - remove trans response 14 318 1264709212
2006-05-21 15:30:26,910 [Base] - remove trans response 13 105 -444543106
2006-05-21 15:30:26,910 [Base] - remove trans response 25 167 -327327956
2006-05-21 15:30:26,910 [Base] - remove trans response 1 2 -49318122
2006-05-21 15:30:26,910 [Base] - remove trans response 16 112 -837380385
2006-05-21 15:30:26,911 [Base] - remove trans response 23 155 -273728169
2006-05-21 15:30:26,911 [Base] - remove trans response 5 15 1120434658
2006-05-21 15:30:26,911 [Base] - remove trans response 17 117 602222400
2006-05-21 15:30:26,912 [Base] - remove trans response 20 320 1002942187*/






