/**
 * this is a list of Payment headers.  It is just an array that is created
 * becase all parsing of result sets should go in specific classes.
 *
 *
 * @author Sam King
 * @see PaymentHeader
 */

package com.topcoder.web.pacts.common;

import java.util.*;
import com.topcoder.web.common.*;
import org.apache.log4j.*;
   
public class PaymentList implements PactsConstants {
    private static Category log = 
	Category.getInstance(PaymentList.class.getName()); 

    public Payment[] headerList=null;
    /**
     * PaymentList.java
     * ----------------
     * will parse the result set container looking for several
     * rows of Payment data.  In the event of an error
     * the array will of length 0, but will not be null.
     *
     * @param results the results of a db query
     */
    public PaymentList(Map results) {
	ResultSetContainer rsc = (ResultSetContainer) 
	    results.get(PAYMENT_DETAIL_LIST);

	//make sure we got the payment headers
	if(rsc == null) {
	    log.error("There were no " + PAYMENT_DETAIL_LIST + " entries in the" +
		      " result set map sent to the PaymentList\n" +
		      "constructor.");
	    headerList = new Payment[0];
	}

	// see if there are any rows of data
	int numRows = rsc.getRowCount();
	if(numRows<=0) {
	    log.debug("there were no rows of data in the result set sent\n" +
		      "to the PaymentList constructor");
	    headerList = new Payment[0];
	}

	//now form all of the contract headers
	headerList = new Payment[numRows];
	for(int idx=0;idx<numRows;idx++) {
	    headerList[idx] = new Payment(results, idx);
	}
    }
}
	    
