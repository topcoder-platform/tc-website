package com.topcoder.common.web.xml;

import com.topcoder.common.web.error.TCException;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.docGen.xml.xsl.XSLTransformerCache;
import com.topcoder.shared.docGen.xml.xsl.XSLTransformerWrapper;
import com.topcoder.shared.util.logging.Logger;

import java.io.ByteArrayOutputStream;
import java.io.StringReader;

public class HTMLRenderer {

    private static Logger log = Logger.getLogger(HTMLRenderer.class);

    public HTMLRenderer() {
    }

    /**
     * Use the provided XML and file to generate html.
     */
    public String render(XMLDocument xmldocObject, String xsldocURLString, String cacheKey)
            throws TCException {

        ByteArrayOutputStream baos = null;
        XSLTransformerWrapper wrapper = null;
        XSLTransformerCache cache = null;


        try {
            cache = XSLTransformerCache.getInstance();
            baos = new ByteArrayOutputStream();
            wrapper = cache.getXSLTransformerWrapper(xsldocURLString);
            wrapper.transform(new StringReader(xmldocObject.createXML()), baos);
            return baos.toString();

        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("ejb.HTMLRenderer.HTMLRendererBean:render:ERROR:\n" + e);
        }
    }

    /**
     * Clears the cache.
     */
    public byte[] refresh() throws TCException {
        log.info("HTMLRenderer.refresh()");
        XSLTransformerCache cache = null;
        byte[] result = null;
        try {
            cache = XSLTransformerCache.getInstance();
            cache.clear();
            java.net.InetAddress localHost = java.net.InetAddress.getLocalHost();
            result = localHost.getAddress();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("Error in HTMLRendererBean.refresh()");
        }
        return result;
    }
}
