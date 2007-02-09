package com.topcoder.web.common.datafeed;
import javax.xml.transform.sax.TransformerHandler;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public interface RSCElement {
    
    void writeXML(TransformerHandler hd, ResultSetContainer rsc, ResultSetContainer.ResultSetRow row) throws Exception;

}
