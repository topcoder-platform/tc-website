package com.topcoder.web.project.common;

import java.io.Serializable;
import java.util.Date;

public class UserMessage implements Serializable, Cloneable {
    private int user_message_id = 0;
    private int sender_id = 0;
    private int receiver_id = 0;
    private int sender_folder = 0;
    private int receiver_folder = 0;
    private String subject = "";
    private String message = "";
    private Date sent_date = new Date();
    private Date read_date = new Date();

    public UserMessage Clone() {
        UserMessage userMessage = new UserMessage();
        userMessage.setUser_message_id(getUser_message_id());
        userMessage.setSender_id(getSender_id());
        userMessage.setReceiver_id(getReceiver_id());
        userMessage.setSender_folder(getSender_folder());
        userMessage.setReceiver_folder(getReceiver_folder());
        userMessage.setSubject(getSubject());
        userMessage.setMessage(getMessage());
        userMessage.setSent_date(getSent_date());
        userMessage.setRead_date(getRead_date());
        return userMessage;
    }

    public int getUser_message_id() {
        return this.user_message_id;
    }

    public void setUser_message_id(int intIn) {
        this.user_message_id = intIn;
    }

    public int getSender_id() {
        return this.sender_id;
    }

    public void setSender_id(int intIn) {
        this.sender_id = intIn;
    }

    public int getReceiver_id() {
        return this.receiver_id;
    }

    public void setReceiver_id(int intIn) {
        this.receiver_id = intIn;
    }

    public int getSender_folder() {
        return this.sender_folder;
    }

    public void setSender_folder(int intIn) {
        this.sender_folder = intIn;
    }

    public int getReceiver_folder() {
        return this.receiver_folder;
    }

    public void setReceiver_folder(int intIn) {
        this.receiver_folder = intIn;
    }

    public String getSubject() {
        return this.subject;
    }

    public void setSubject(String strIn) {
        this.subject = strIn;
    }

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String strIn) {
        this.message = strIn;
    }

    public Date getSent_date() {
        return this.sent_date;
    }

    public void setSent_date(Date datIn) {
        this.sent_date = datIn;
    }

    public Date getRead_date() {
        return this.read_date;
    }

    public void setRead_date(Date datIn) {
        this.read_date = datIn;
    }

}