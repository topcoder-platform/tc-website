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
                boolean sameUser = (oa.user.getId()==null&&user.getId()==null) ||
                        (oa.user.getId()!=null&&user.getId()!=null&&oa.user.getId().equals(user.getId()));
                boolean sameQuestion = (oa.question.getId()==null&&question.getId()==null) ||
                        (oa.question.getId()!=null&&question.getId()!=null&&oa.question.getId().equals(question.getId()));
                boolean sameAnswer = (oa.answer.getId()==null&&answer.getId()==null) ||
                        (oa.answer.getId()!=null&&answer.getId()!=null&&oa.answer.getId().equals(answer.getId()));
                boolean sameResponse = true;
                if (question.isFreeForm()) {
                    sameResponse = (oa.response==null&&response==null) ||
                            (oa.response.equals(response));
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
        if (question.isFreeForm()) {
            buf.append(" ");
            if (response==null) {
                buf.append("");
            } else {
                buf.append(response);
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






