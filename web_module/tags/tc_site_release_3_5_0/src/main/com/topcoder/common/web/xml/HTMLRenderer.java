package com.topcoder.common.web.xml;

import com.topcoder.common.web.error.TCException;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.docGen.xml.xsl.XSLTransformerCache;
import com.topcoder.shared.docGen.xml.xsl.XSLTransformerWrapper;
import com.topcoder.shared.util.logging.Logger;

import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.StringReader;

public class HTMLRenderer {

    private static Logger log = Logger.getLogger(HTMLRenderer.class);

    public HTMLRenderer() {
    }

    /**
     * Use the provided XML and file to generate html.
     */
    public synchronized String render(XMLDocument xmldocObject, String xsldocURLString)
            throws TCException {

        ByteArrayOutputStream baos = null;
        XSLTransformerWrapper wrapper = null;
        XSLTransformerCache cache = null;


        try {
            cache = XSLTransformerCache.getInstance();
            baos = new ByteArrayOutputStream();
            wrapper = cache.getXSLTransformerWrapper(xsldocURLString);
            wrapper.transform(new StringReader(xmldocObject.getXML()), baos);
            return baos.toString();

        } catch (Exception e) {

            /* try and read through the file looking for suspicious characters. */
            try {

                FileReader fr = new FileReader(xsldocURLString);

                int lineCount = 1;
                char ch = 0;
                while (fr.ready()) {
                    ch = (char) fr.read();
                    if (ch == '\n') lineCount++;
                    if (!(ch > 0 && ch < 128)) {
                        log.info("possible bad char: " + ch + " found on line " + lineCount);
                    }
                }
                fr.close();
            } catch (Exception ex) {
                log.error("failed to read through file looking for bad characters: " + ex.getMessage());
            }
            log.debug(xmldocObject.getXML());
            e.printStackTrace();
            throw new TCException("ejb.HTMLRenderer.HTMLRendererBean:render:ERROR:\n" + e);
        }
    }

    /**
     * Clears the cache.
     */
    public byte[] refresh() throws TCException {
        //log.info("HTMLRenderer.refresh()");
        XSLTransformerCache cache = null;
        byte[] result = null;
        try {
            cache = XSLTransformerCache.getInstance();
            log.info("removing " + cache.size() + " items from the cache");
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
