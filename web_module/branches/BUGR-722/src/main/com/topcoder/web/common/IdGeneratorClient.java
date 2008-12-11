package com.topcoder.web.common;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

/**
 * The Client which uses the IdGenerator component to generate
 * an long sequence id for any sequence name in the Screening Database
 *
 * @author Fred Wang (fred@fredwang.com)
 * @version $Revision: 63183 $
 *          Dec 23, 2002 6:44:37 PM
 */
public class IdGeneratorClient {

    private static Logger log = Logger.getLogger(IdGeneratorClient.class);


    /**
     * Uses the IdGenerator class to retrieve a sequence value for the
     * sequence name given. Will initialize the IdGenerator if not initialized
     * yet.
     *
     * @param seqName
     * @return The next sequence val. -1 if there is an exception thrown
     *         or other error retrieving the sequence id.
     */

    public static long getSeqId(String seqName) throws IDGenerationException {
        if (log.isDebugEnabled()) {
            log.debug("getSeqId(" + seqName + ") called");
        }
        long ret = getSeqId(seqName, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        if (log.isDebugEnabled()) {
            log.debug("returning " + ret);
        }
        return ret;
    }

    private static long getSeqId(String seqName, String dataSourceName) throws IDGenerationException {
/*
        if (log.isDebugEnabled()) {
            log.debug("getSeqId(" + seqName + ", " + dataSourceName + ") called");
        }
*/
        long retVal;
        IDGenerator gen = IDGeneratorFactory.getIDGenerator(seqName);
        retVal = gen.getNextID();
        //System.out.println("retVal = " + retVal);
        return retVal;
    }

}