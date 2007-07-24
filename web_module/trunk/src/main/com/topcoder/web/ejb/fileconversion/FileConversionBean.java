package com.topcoder.web.ejb.fileconversion;

import com.topcoder.file.convert.Conversion;
import com.topcoder.file.convert.ConversionClient;
import com.topcoder.file.convert.ConversionException;
import com.topcoder.file.convert.ConversionFormatDescriptor;
import com.topcoder.file.convert.ConversionInputSource;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.CreateException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;

/**
 * The EJB class which handles database access routines for screening
 * admin services.
 *
 * @author 1mahesh
 * @version 1.01, 12/31/2002
 */

public class FileConversionBean implements SessionBean {

    private static final Logger log = Logger.getLogger(FileConversionBean.class);

    /**
     * This method is required by the EJB Specification
     */
    public void ejbActivate() {

    }


    /**
     * This method is required by the EJB Specification
     */
    public void ejbPassivate() {

    }


    /**
     * This method is required by the EJB Specification.
     * Used to get the context ... for dynamic connection pools.
     */
    public void ejbCreate() throws CreateException {
    }

    /**
     * This method is required by the EJB Specification
     */
    public void ejbRemove() {
    }


    /**
     * Sets the transient SessionContext.
     * Sets the transient Properties.
     */
    public void setSessionContext(SessionContext ctx) {
    }


    public byte[] convertDoc(byte[] file, String extension) throws RemoteException {
        if (file == null) {
            throw new IllegalArgumentException("The file was null");
        }
        // get an instance of the converter
        ConversionClient client = Conversion.getNewClient();

        if (log.isDebugEnabled()) {
            for (ConversionFormatDescriptor d : client.getInputFormats()) {
                log.debug(d.getDescription() + " " + d.getExtension());
            }
        }


        if (client.isSupported(extension)) {
            ConversionFormatDescriptor inFormat = client.getInputFormat(extension);
            ConversionFormatDescriptor outFormat = client.getOutputFormat(inFormat.getType(), "pdf");
            ConversionInputSource input = new ConversionInputSource(new ByteArrayInputStream(file), inFormat.getType());

            // start the conversion
            try {
                log.debug("STARTING");
                InputStream finishedFile = client.convertSync(input, outFormat.getType());

                byte[] b = new byte[finishedFile.available()];
                finishedFile.read(b);
                finishedFile.close();


                return b;
            } catch (ConversionException ce) {
                // something went wrong
                ce.printStackTrace();
            } catch (IOException io) {
                //io exception
                io.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

            return new byte[0];

        } else {
            throw new IllegalArgumentException("Unsupported extension " + extension);

        }


    }
}
