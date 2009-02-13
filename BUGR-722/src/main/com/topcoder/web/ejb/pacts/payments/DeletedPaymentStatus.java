/*
* DeletedPaymentStatus
*
* Created Apr 19, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.ejb.pacts.AlgorithmRoundReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.InvalidSearchInputException;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoObjectFoundException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UnsupportedSearchException;

/**
 * This class represents a Deleted status for payments.
 *
 * VERY IMPORTANT: remember to update serialVersionUID if needed
 *
 * @author Pablo Wolfus (pulky)
 * @version $Id: DeletedPaymentStatus.java 64933 2007-09-06 20:20:22Z cucu $
 */
public class DeletedPaymentStatus extends BasePaymentStatus {
    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The payment status id
     */
    public static final Long ID = 69l;

    /**
     * Default constructor
     */
    public DeletedPaymentStatus() {
        super();
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#getId()
     */
    @Override
    public Long getId() {
        return ID;
    }

    /**
     * This method will handle the state activation for each particular status
     *
     * @param payment the payment to apply the event to
     * @throws StateTransitionFailureException if anything fails
     */
    public void activate(BasePayment payment) throws StateTransitionFailureException {
        try {
            // If the payment is deleted, we need to cancel attached documents. (affidavit)
            cancelAttachedDocuments(payment);
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#inactiveCoder(com.topcoder.web.ejb.pacts.BasePayment)
     */
    @Override
    public int inactiveCoder(BasePayment payment) throws InvalidPaymentEventException {
        // do nothing
        return 0;
    }

    /**
     * @see com.topcoder.web.ejb.pacts.payments.BasePaymentStatus#newInstance()
     */
    @Override
    public BasePaymentStatus newInstance() {
        BasePaymentStatus newPaymentStatus = new DeletedPaymentStatus();
        newPaymentStatus.setDesc(this.desc);
        newPaymentStatus.setActive(this.active);
        return newPaymentStatus;
    }

}
