package com.topcoder.web.tc.controller.request.tournament.tco08;

import java.io.Serializable;

/**
 * Holds some data for the payment of a symposium registration.
 * 
 * @author Cucu
 *
 */
public class PaymentData implements Serializable {
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;
    
    private String method;
    private String cardNumber;
    private String expirationDate;
    
    public String getMethod() {
        return method;
    }
    public void setMethod(String method) {
        this.method = method;
    }
    public String getCardNumber() {
        return cardNumber;
    }
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
    public String getExpirationDate() {
        return expirationDate;
    }
    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }
    
    
}
