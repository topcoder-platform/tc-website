package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.common.TCWebException;

import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.Transformer;
import javax.xml.transform.OutputKeys;
import java.io.PrintWriter;

import org.xml.sax.helpers.AttributesImpl;
import org.xml.sax.Attributes;

/**
 * @author dok
 * Date: Jan 19, 2004
 */
public class Data extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            PrintWriter out = getResponse().getWriter();
            StreamResult streamResult = new StreamResult(out);
            SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

            TransformerHandler hd = tf.newTransformerHandler();
            Transformer serializer = hd.getTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING,"ISO-8859-1");
            serializer.setOutputProperty(OutputKeys.INDENT,"yes");
            hd.setResult(streamResult);
            hd.startDocument();
            AttributesImpl atts = new AttributesImpl();

            hd.startElement("","","memberStats",atts);

            addElement(hd, "handle", "schveiguy", atts);
            addElement(hd, "algorithmRating", "2344", atts);
            addElement(hd, "algorithmRatingMax", "3605", atts);
            addElement(hd, "rank", "50", atts);
            addElement(hd, "percentile", "95", atts);
            addElement(hd, "memberSince", "03.25.02", atts);
            addElement(hd, "lastMatchDate", "12.30.03", atts);
            addElement(hd, "bestDvi1", "470", atts);
            addElement(hd, "bestDiv2", "350", atts);
            addElement(hd, "competitions", "46", atts);
            addElement(hd, "designRating", "1559", atts);
            addElement(hd, "developmentRating", "0", atts);


/*
            for (int i=0;i<id.length;i++) {
              atts.clear();
              atts.addAttribute("","","ID","CDATA",id[i]);
              atts.addAttribute("","","TYPE","CDATA",type[i]);
              hd.startElement("","","USER",atts);
              hd.characters(desc[i].toCharArray(),0,desc[i].length());
              hd.endElement("","","USER");
            }
*/
            hd.endElement("","","memberStats");
            hd.endDocument();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void addElement(TransformerHandler hd, String name, String value, Attributes atts) throws Exception {
        hd.startElement("", "", name, atts);
        hd.characters(value.toCharArray(), 0, value.length());
        hd.endElement("", "", name);

    }
}
