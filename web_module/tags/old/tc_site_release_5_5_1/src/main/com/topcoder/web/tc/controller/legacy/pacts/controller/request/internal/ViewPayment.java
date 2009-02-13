package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.NoteHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 *
 * @author  cucu
 */
public class ViewPayment extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        long payment_id = Long.parseLong(getRequest().getParameter(PAYMENT_ID));

        try {
            DataInterfaceBean bean = new DataInterfaceBean();

            Payment payment = new Payment(bean.getPayment(payment_id));
            getRequest().setAttribute(PACTS_INTERNAL_RESULT, payment);

            Date creationDate = bean.getCreationDate(payment_id);
            getRequest().setAttribute(CREATION_DATE, new SimpleDateFormat(DATE_FORMAT_STRING).format(creationDate));

            Map search = new HashMap();
            search.put(PAYMENT_ID, payment_id + "");

            Map notes = bean.findNotes(search);
            getRequest().setAttribute(NOTE_HEADER_LIST, new NoteHeaderList(notes).getHeaderList());


            setNextPage(INTERNAL_PAYMENT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

