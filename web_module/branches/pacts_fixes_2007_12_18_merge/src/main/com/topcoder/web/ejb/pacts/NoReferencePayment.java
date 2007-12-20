package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;


/**
 * Payment that doesn't have any reference to another table.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author cucu
 *
 */
public class NoReferencePayment extends BasePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment that doesn't have any reference.
     *
     * @param paymentTypeId type of payment.  Must be of a payment that doesn't have a reference, or an exception is thrown.
     * @param coderId id of the coder being paid
     * @param grossAmount amount to pay
     * @param description description of the payment.
     */
    public NoReferencePayment(int paymentTypeId, long coderId, double grossAmount, String description) {
        this(paymentTypeId, coderId, grossAmount, description, new Date());
    }

    /**
     * Create a payment that doesn't have any reference.
     *
     * @param paymentTypeId type of payment.  Must be of a payment that doesn't have a reference, or an exception is thrown.
     * @param coderId id of the coder being paid
     * @param grossAmount amount to pay
     * @param description description of the payment.
     * @param eventDate the date that the event took place.  An interval will be summed depending on the type
     * to calculate the due date.
     */
    public NoReferencePayment(int paymentTypeId, long coderId, double grossAmount, String description, Date eventDate) {
        super(paymentTypeId, coderId, grossAmount);
        setDescription(description);
        setEventDate(eventDate);

        if (getReferenceTypeId() != NO_REFERENCE) {
            throw new IllegalArgumentException("Can't create a NoReferencePayment for type " + paymentTypeId);
        }
    }

    /**
     * Get a processor for this type of payment.
     *
     * @return a processor for this type of payment.
     */
    protected BasePayment.Processor getProcessor() {
        return new Processor();
    }

    /**
     * Processor for payments that doesn't have any reference.
     * It just returns the descriptions and dates stored in the payment.
     *
     * @author Cucu
     */
    protected static class Processor extends BasePayment.Processor {

        /**
         * Get the name of the reference.
         *
         * @return an empty string, because it doesn't reference anything.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            return "";
        }

        /**
         * Get the description of the payment.
         *
         * @param payment payment to retrieve its description.
         * @return the description of the payment.
         */
        public String lookupDescription(BasePayment payment) throws SQLException {
            return payment.getDescription();
        }

        /**
         * Get the event date of the payment.
         *
         * @param payment payment to retrieve its event date.
         * @return the event date of the payment.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return payment.getEventDate();
        }
    }



}
