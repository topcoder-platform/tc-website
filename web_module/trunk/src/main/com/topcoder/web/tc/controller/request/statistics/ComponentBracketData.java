/*
 * ComponentBracketData.java
 *
 * Created on October 13, 2004, 2:02 PM
 */

package com.topcoder.web.tc.controller.request.statistics;


import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.xml.transform.Transformer;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.sax.SAXTransformerFactory;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.text.DecimalFormat;
import java.util.Iterator;

import org.xml.sax.helpers.AttributesImpl;
import org.xml.sax.Attributes;

/**
 *
 * @author  rfairfax
 */
public class ComponentBracketData extends Base {
    
    private void writeMemberProfile() {
        
            
    }
    
    private final String[] tco04_des_finalists = new String[] {"277356","278342","289824","152342" };
    private final String[] tco04_dev_finalists = new String[] {"7270519", "7463987", "310233" };

    public void businessProcessing() throws TCWebException {

        try {
            String type = StringUtils.checkNull(getRequest().getParameter("type"));
            if (type.equals("")) {
                throw new TCWebException("Data type parameter not included in request");
            }

            getResponse().setContentType("text/xml");
            PrintWriter out = getResponse().getWriter();
            StreamResult streamResult = new StreamResult(out);
            SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();

            TransformerHandler hd = tf.newTransformerHandler();
            Transformer serializer = hd.getTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
            //flash doesn't like the whitespace
            serializer.setOutputProperty(OutputKeys.INDENT, "no");
            hd.setResult(streamResult);
            hd.startDocument();

            AttributesImpl emptyAtts = new AttributesImpl();
            hd.startElement("", "", "finalists", emptyAtts);
            
            SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
            DecimalFormat df = new DecimalFormat("0.00");
            
            String[] arr;
            if(type.equals("tco04_design")) {
                arr = tco04_des_finalists;
            } else if(type.equals("tco04_development")) {
                arr = tco04_dev_finalists;
            } else {
                throw new TCWebException("Invalid type in request");
            }
            
            Request profileRequest = new Request();
            profileRequest.setContentHandle("member_profile");

            ResultSetContainer profileRsc = null;
            ResultSetContainer.ResultSetRow rsr = null;

            DataAccessInt dataAccess = getDataAccess(true);

            for(int i = 0; i < arr.length; i++) {
                profileRequest.setProperty("cr", arr[i]);
                profileRsc = (ResultSetContainer) dataAccess.getData(profileRequest).get("Coder_Data");

                hd.startElement("", "", "competitor", emptyAtts);
                addElement(hd, "handle", profileRsc.getStringItem(0, "handle"), emptyAtts);
                addElement(hd, "room_seed", String.valueOf(i), emptyAtts);
                addElement(hd, "coderID", arr[i], emptyAtts);
                addElement(hd, "photo", profileRsc.getStringItem(0, "image_path"), emptyAtts);
                addElement(hd, "AlgRating", profileRsc.getStringItem(0, "rating"), emptyAtts);
                addElement(hd, "DesRating", profileRsc.getStringItem(0, "design_rating"), emptyAtts);
                addElement(hd, "DevRating", profileRsc.getStringItem(0, "development_rating"), emptyAtts);
                addElement(hd, "memberSince", sdf.format(profileRsc.getItem(0, "member_since").getResultData()), emptyAtts);
                
                hd.endElement("", "", "competitor");
            }

            hd.endElement("", "", "finalists");
            hd.endDocument();

            getResponse().flushBuffer();

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void addElement(TransformerHandler hd, String name, String value, Attributes atts) throws Exception {
        String temp = value == null ? "" : value;
        hd.startElement("", "", name, atts);
        hd.characters(temp.toCharArray(), 0, temp.length());
        hd.endElement("", "", name);

    }


}

