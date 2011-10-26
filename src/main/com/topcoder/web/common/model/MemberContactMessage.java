package com.topcoder.web.common.model;

import java.util.Date;


/**
 * A class to hold messages sent through member contact.
 *
 * @author cucu
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 17, 2006
 */
public class MemberContactMessage extends Base {

    private Long id;
    private User sender;
    private User recipient;
    private String text;
    private boolean copy;
    private Date sentDate;

    public boolean isCopy() {
        return copy;
    }

    public void setCopy(boolean copy) {
        this.copy = copy;
    }

    public MemberContactMessage() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public Date getSentDate() {
        return sentDate;
    }

    public void setSentDate(Date sentDate) {
        this.sentDate = sentDate;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
