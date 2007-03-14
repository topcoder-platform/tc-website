package com.topcoder.web.oracle;

import com.topcoder.web.common.WebConstants;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.MissingResourceException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class Constants implements WebConstants {

    private static final TCResourceBundle bundle = new TCResourceBundle("Oracle");
    private static final Logger log = Logger.getLogger(Constants.class);



    public static String DEFAULT_PAGE;


    static {
            initialize();
        }

        public static void initialize() {
            //log.debug("XXXXX initialize called");

            Field[] f = Constants.class.getFields();
            //log.debug(f.length + " fields found");
            for (Field aF : f) {
                //log.debug(f[i].getName());
                try {
                    if (!Modifier.isFinal(aF.getModifiers())) {
                        if (aF.getType().getName().equals("int")) {
                            try {
                                //log.debug("set " + f[i] + " to " + bundle.getIntProperty(f[i].getName().toLowerCase()));
                                aF.setInt(null, bundle.getIntProperty(aF.getName().toLowerCase()));
                            } catch (MissingResourceException ignore) {
                            }
                        } else if (aF.getType().getName().equals("java.lang.String")) {
                            try {
                                //log.debug("set " + f[i] + " to " + bundle.getProperty(f[i].getName().toLowerCase()));
                                aF.set(null, bundle.getProperty(aF.getName().toLowerCase()));
                            } catch (MissingResourceException ignore) {
                            }
                        } else {
                            throw new Exception("Unrecognized type: " + aF.getType().getName());
                        }
                    }
                    if (aF.get(null) == null)
                        log.error("**DID NOT LOAD** " + aF.getName() + " constant");
                    else
                        log.debug(aF.getName() + " <== " + aF.get(null));

                } catch (Exception e) {
                    /* probably harmless, could just be a type or modifier mismatch */
                    e.printStackTrace();
                }
            }
        }



}
