package com.topcoder.web.common.datafeed;
import javax.xml.transform.sax.TransformerHandler;

/**
 * Interface for a DataFeed object.  
 * 
 * @author Cucu
 */
public interface DataFeed {
    void writeXML(TransformerHandler hd) throws Exception;
}
