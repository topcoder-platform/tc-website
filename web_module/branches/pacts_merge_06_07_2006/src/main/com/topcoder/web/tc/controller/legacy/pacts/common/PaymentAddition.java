package com.topcoder.web.tc.controller.legacy.pacts.common;

/**
 * This class holds the data fields of a payment which must be known
 * when adding a new payment to the database.
 *
 * @author   Dave Pecora
 * @version  1.00, 03/21/2002
 */
public class PaymentAddition implements java.io.Serializable {
    public long user_id;
    public String payment_desc;
    public int payment_type_id;
    public double net_amount;
    public double gross_amount;
    public int status_id;

    /**
     * This constructor builds a PaymentAddition from the specified data.
     * When adding a new payment using the data from this class, an entry in
     * both the payment and payment_detail tables is created, with the
     * following database columns defaulting: <p>
     *
     * - payment.print_count is set to 0 <br>
     * - payment.review is set to 0 <br>
     * - payment_detail.date_paid is set to null <br>
     * - payment_detail.date_printed is set to null <br>
     * - payment_detail.payment_address_id is set to null <br>
     * - payment_detail.modification_rationale_id is set to null
     *
     * @param userId The user ID to whom the payment is made
     * @param description The payment description
     * @param typeId The type of the payment
     * @param netAmount The net amount of the payment
     * @param grossAmount The gross amount of the payment
     * @param statusId The status code of the payment
     */
    public PaymentAddition(long userId, String description, int typeId, double netAmount,
                           double grossAmount, int statusId) {
        this.user_id = userId;
        this.payment_desc = description;
        this.payment_type_id = typeId;
        this.net_amount = netAmount;
        this.gross_amount = grossAmount;
        this.status_id = statusId;
    }
}

