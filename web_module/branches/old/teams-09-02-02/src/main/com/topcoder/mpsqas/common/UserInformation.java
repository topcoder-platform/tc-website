package com.topcoder.mpsqas.common;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * A class to contain data about a user.
 */
public class UserInformation implements Serializable {
    public UserInformation(String handle, int userId) {
        this.handle = handle;
        this.userId = userId;
    }

    public UserInformation(String handle) {
        this.handle = handle;
        userId = -1;
    }

    public String getHandle() {
        return handle;
    }

    public int getUserId() {
        return userId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setPaid(double paid) {
        this.paid = paid;
    }

    public double getPaid() {
        return paid;
    }

    public void setPendingPayment(double pendingPayment) {
        this.pendingPayment = pendingPayment;
    }

    public double getPendingPayment() {
        return pendingPayment;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setWriter(boolean isWriter) {
        this.isWriter = isWriter;
    }

    public boolean isWriter() {
        return isWriter;
    }

    public void setTester(boolean isTester) {
        this.isTester = isTester;
    }

    public boolean isTester() {
        return isTester;
    }

    public void setWritingProblems(ArrayList writingProblems) {
        this.writingProblems = writingProblems;
    }

    public ArrayList getWritingProblems() {
        return writingProblems;
    }

    public void setTestingProblems(ArrayList testingProblems) {
        this.testingProblems = testingProblems;
    }

    public ArrayList getTestingProblems() {
        return testingProblems;
    }

    public boolean equals(Object o) {
        boolean result = true;
        if (o == null) {
            result = false;
        } else if (!(o instanceof UserInformation)) {
            result = false;
        } else {
            UserInformation u = (UserInformation) o;
            if (userId != u.getUserId()) {
                result = false;
            } else if (!handle.equals(u.getHandle())) {
                result = false;
            }
        }
        return result;
    }

    private boolean isWriter;
    private boolean isTester;
    private String handle;
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private double paid;
    private double pendingPayment;
    private ArrayList writingProblems;
    private ArrayList testingProblems;
}
