package com.topcoder.web.common.datafeed;
import javax.xml.transform.sax.TransformerHandler;


public interface DataFeed {
    void writeXML(TransformerHandler hd) throws Exception;
}
