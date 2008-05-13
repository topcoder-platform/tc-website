package com.topcoder.web.tc.controller.request.data;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.security.DataResource;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.tc.controller.request.Base;
import org.xml.sax.helpers.AttributesImpl;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import java.util.Iterator;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 27, 2005
 * @deprecated this class has been moved to its own module and will be removed in the future
 */
abstract class RatingDistribution extends Base {

    protected abstract Request getDistributionRequest();

    protected abstract int getDb();

    protected void businessProcessing() throws Exception {
        Request r = getDistributionRequest();

        DataResource resource = new DataResource(r.getContentHandle(), getDb());
        if (new TCSAuthorization(getUser()).hasPermission(resource)) {
            //for now we'll assume they're gettin data from the warehouse, perhaps that'll change later
            Map m = getDataAccess(BasicData.getDataSource(getDb()), true).getData(r);
            ResultSetContainer rsc;
            String key;
            Iterator it = m.keySet().iterator();
            //we're just giving them one thing at a time so the command should only have
            //one query associated with it.

            getResponse().setContentType("text/xml");

            if (it.hasNext()) {
                key = (String) it.next();
                rsc = (ResultSetContainer) m.get(key);

                StreamResult streamResult = new StreamResult(getResponse().getOutputStream());
                SAXTransformerFactory tf = (SAXTransformerFactory) SAXTransformerFactory.newInstance();
                TransformerHandler hd = tf.newTransformerHandler();
                Transformer serializer = hd.getTransformer();
                serializer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
                serializer.setOutputProperty(OutputKeys.INDENT, "no");
                hd.setResult(streamResult);
                hd.startDocument();

                AttributesImpl emptyAtts = new AttributesImpl();
                hd.startElement("", "", r.getContentHandle(), emptyAtts);

                AttributesImpl bucketAtts;

                ResultSetContainer.ResultSetRow rsr;
                Iterator rscIt = rsc.iterator();
                if (rscIt.hasNext()) {  //there's only one record here
                    rsr = (ResultSetContainer.ResultSetRow) rscIt.next();
                    for (int i = 0; i < rsc.getColumnCount(); i++) {
                        //create the min and max attributes for this bucket
                        bucketAtts = new AttributesImpl();
                        bucketAtts.addAttribute("", "", "min", "int", String.valueOf(i * 100));
                        bucketAtts.addAttribute("", "", "max", "", String.valueOf((i + 1) * 100 - 1));
                        //add the content of the bucket, the number of people in it
                        hd.startElement("", "", "bucket", bucketAtts);
                        hd.characters(rsr.getStringItem(i).toCharArray(), 0, rsr.getStringItem(i).length());
                        hd.endElement("", "", "bucket");
                    }
                }
                hd.endElement("", "", r.getContentHandle());
                hd.endDocument();
            }

            getResponse().flushBuffer();
        } else {
            throw new PermissionException(getUser(), resource);
        }
    }


}