package com.topcoder.security;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.ConfigManagerInterface;
import org.apache.log4j.Logger;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.spec.SecretKeySpec;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Key;
import java.security.KeyStore;
import java.security.Security;
import java.security.cert.Certificate;
import java.util.Enumeration;
import java.util.Vector;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * A bunch of static methods used in various com.topcoder.security (and subpackage)
 * classes.  They do things like execute queries in the database and encoding
 * and decoding passwords (so plain text passwords aren't stored in the db).  Requires
 * ConfigManager properties file.
 *
 * The methods in this class are only intended to be used by classes within
 * the Security Manager component.  It is only public because the package
 * heirarchy requires it to be public in order for classes in subpackages of
 * com.topcoder.security to access it.
 */
public class Util implements ConfigManagerInterface {

    private static String PROPERTIES_NAMESPACE = "com.topcoder.security.Util";
    private static String PROPERTIES_FORMAT = ConfigManager.CONFIG_PROPERTIES_FORMAT;
    private static Logger logger = Logger.getLogger(Util.class);
    private static String base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    //Supplies encryption provider
    static {
        Security.addProvider(new com.sun.crypto.provider.SunJCE());
    }

    /**
     * @return The ConfigManager for this namespace
     */
    public static ConfigManager getConfigManager()
            throws ConfigManagerException {

        //logger.debug("in getConfigManager");
        ConfigManager cm = ConfigManager.getInstance();
        //logger.debug("got ConfigManager");
        try {
            if (cm.existsNamespace(PROPERTIES_NAMESPACE)) {
                //logger.debug("getConfigManager if");
                cm.refresh(PROPERTIES_NAMESPACE);
            } else {
                //logger.debug("getConfigManager else");
                cm.add(PROPERTIES_NAMESPACE, PROPERTIES_FORMAT);
            }
        } catch (ConfigManagerException e) {
            e.fillInStackTrace();
            throw e;
        }
        logger.debug("getConfigManager - got cm");
        return cm;
    }

    /**
     * Get the particular property from the config manager
     *
     * @param property
     * @return The string property value
     */
    public static String getProperty(String property)
            throws GeneralSecurityException {

        logger.debug("Util - getProperty");
        try {
            ConfigManager cm = getConfigManager();
            String prop = (String) cm.getProperty(PROPERTIES_NAMESPACE, property);
            return prop;
        } catch (ConfigManagerException e) {
            throw new GeneralSecurityException("" + e);
        }
    }

    /**
     * Part of <code>ConfigManagerInterface</code>
     *
     * @return current namespace
     */
    public String getNamespace() {
        return PROPERTIES_NAMESPACE;
    }

    /**
     * art of <code>ConfigManagerInterface</code>
     *
     * @return all known property keys in this namespace
     */
    public Enumeration getConfigPropNames() {
        Vector propNames = new Vector();
        propNames.add("keystore");
        propNames.add("kspassword");
        propNames.add("keystring");
        return propNames.elements();
    }

    /**
     * Gets the key tied to the given alias.  If the key does not already
     * exist, create and store it.  The alias is used to look up the key
     * in the keystore.  The location of the keystore is dependent on
     * configuration settings in this class's .properties file.
     *
     * @param alias Used to store and lookup a particular key within a
     *              keystore
     * @return Returns a Key
     */
    private static Key loadKey(String alias)
            throws ConfigManagerException, GeneralSecurityException {

        KeyStore ks;
        Key key;
        logger.debug("Util - loadKey");
        ConfigManager cm = getConfigManager();
        //logger.debug("got ConfigManager from getConfigManager");
        String keyStoreFileName = getProperty("keystore");
        String cryptPswd = getProperty("kspassword");
        try {
            ks = KeyStore.getInstance("JCEKS", "SunJCE");
            //logger.debug("got KeyStore");
            File f = new File(keyStoreFileName);
            //f.delete();
            f.createNewFile();
            //logger.debug(Boolean.toString(f.exists()));
            try {
                ks.load(new FileInputStream(keyStoreFileName), cryptPswd.toCharArray());
                //logger.debug("ks.load");
                key = (Key) ks.getKey(alias, cryptPswd.toCharArray());
                //logger.debug("got key");
            } catch (java.io.EOFException e) {
                //logger.debug("in catch");
                key = storeKeyStore(ks, alias);
            }
            return key;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GeneralSecurityException("Password encryption error in com.topcoder.security.Util.loadKey: " + e.getMessage());
        }
    }

    /**
     * Store a KeyStore.  This is called if a new key has to be created and
     * stored.  The location of the keystore is dependent on
     * configuration settings in this class's .properties file.  Uses the
     * Blowfish algorithm and its default initialization to generate a key.
     *
     * @param ks
     * @param alias Used to store and lookup a particular key within a
     *              keystore
     */
    private static Key storeKeyStore(KeyStore ks, String alias)
            throws ConfigManagerException, GeneralSecurityException {

        logger.debug("in storeKeyStore");
        ConfigManager cm = getConfigManager();
        String keyStoreFileName = getProperty("keystore");
        String cryptPswd = getProperty("kspassword");
        String keyString = getProperty("keystring");
        try {
            KeyGenerator kgen = KeyGenerator.getInstance("Blowfish");
            Key skey = kgen.generateKey();
            byte[] raw = skey.getEncoded();
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "Blowfish");

            //logger.debug("storeKeyStore key");
            Certificate[] chain = new Certificate[0];
            //logger.debug("in storeKeyStore try");
            ks.load(null, cryptPswd.toCharArray());
            ks.setKeyEntry(alias, skeySpec, cryptPswd.toCharArray(), chain);
            //logger.debug("setKeyEntry");
            ks.store(new FileOutputStream(keyStoreFileName), cryptPswd.toCharArray());
            //logger.debug("ks.store");
            return skeySpec;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GeneralSecurityException("Password encryption error in com.topcoder.security.Util.storeKeyStore: " + e.getMessage());
        }
    }

    /**
     * Depending on cipherMode, encrypt or decrypt password using the key
     * retrieved or created with alias
     *
     * @param password
     * @param alias Used to look up a particular key within the keystore.
     * @param cipherMode
     * @return Returns the encrypted or decrypted password string
     */
    private static byte[] encdec(byte[] passwd, String alias, int cipherMode)
            throws ConfigManagerException, GeneralSecurityException {

        logger.debug("in encdec");
        Key key = loadKey(alias);
        //logger.debug("encdec - got key");
        byte[] encPasswd = new byte[0];
        try {
            //logger.debug("encdec - try");
            Cipher c = Cipher.getInstance("Blowfish");
            //logger.debug("encdec - got cipher");
            c.init(cipherMode, key);
            //logger.debug("encdec - init cipher");
            //logger.debug("passwd.length: " + passwd.length + " *" + new String(passwd) + "*");
            encPasswd = c.doFinal(passwd);
            //logger.debug("encdec - doFinal");
            //logger.debug("encPasswd.length: " + encPasswd.length);
            return encPasswd;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GeneralSecurityException("Password encrption error in com.topcoder.security.Util.encdec: " + e.getMessage());
        }
    }

    /**
     * Encrypt the password using the key tied to alias.  After being
     * encrypted with a Blowfish key. the encrypted byte array is then
     * encoded with a base 64 encoding, resulting in the String that is
     * returned.
     *
     * @param password
     * @param alias Used to look up a particular key within a keystore.  The
     *              location of the keystore is specified in a configuration
     *              file.
     * @return the encrypted and encoded password
     */
    public static String encodePassword(String password, String alias)
            throws GeneralSecurityException {
        logger.debug("in encodePassword");

        byte[] passwd = password.getBytes();
        try {
            byte[] encPasswd = encdec(passwd, alias, Cipher.ENCRYPT_MODE);
            return encode64(encPasswd);
        } catch (ConfigManagerException e) {
            throw new GeneralSecurityException("ConfigManagerException in com.topcoder.security.Util.encodePassword: " + e.getMessage());
        }
    }

    /**
     * Decrypt the password using the key tied to alias.  Takes a password
     * that has been ecrypted and encoded, uses base 64 decoding to return
     * an ecypted byte array.  That byte array is then decrypted using a
     * Blowfish key into the original string.
     *
     * @param password base 64 encoded String.
     * @param alias Used to look up a particular key within a keystore.  The
     *              location of the keystore is specified in a configuration
     *              file.
     * @return the decypted password
     */
    public static String decodePassword(String password, String alias)
            throws GeneralSecurityException {

        //byte[] passwd = decode(trimExtra(password));
        byte[] passwd = decode64(password);
        try {
            byte[] encPasswd = encdec(passwd, alias, Cipher.DECRYPT_MODE);
            return new String(encPasswd);
        } catch (ConfigManagerException e) {
            e.printStackTrace();
            throw new GeneralSecurityException("ConfigManagerException in com.topcoder.security.Util.encodePassword: " + e.getMessage());
        }
    }

    /**
     * Decode a string that was encoded using a base 64 encoding into its
     * original bytes.
     *
     * @param s The String to be decoded
     * @return a byte[]
     */
    private static byte[] decode64(String s) {
        int len = s.length();
        //System.out.println("s = " + s);
        byte[] b = new byte[(s.length() / 4) * 3];
        int cycle = 0;
        int combined = 0;
        int j = 0;
        int dummies = 0;
        for (int i = 0; i < len; i++) {
            int c = s.charAt(i);
            int value = (c == (int) '=') ? -2 : ((c <= 255) ? base64.indexOf(c) : -1);
            if (value == -2) {
                value = 0;
                dummies++;
            }
            if (value != -1) {
                if (cycle == 0) {
                    combined = value;
                    cycle++;
                } else {
                    combined <<= 6;
                    combined |= value;
                    cycle++;
                }
                if (cycle == 4) {
                    b[j + 2] = (byte) combined;
                    combined >>>= 8;
                    b[j + 1] = (byte) combined;
                    combined >>>= 8;
                    b[j] = (byte) combined;
                    j += 3;
                    cycle = 0;
                }
            }
        }
        if (dummies > 0) {
            j -= dummies;
            byte[] b2 = new byte[j];
            System.arraycopy(b, 0, b2, 0, j);
            b = b2;
        }
        return b;
    }

    /**
     * Encode a byte array into a String using base 64 encoding.
     *
     * @param b
     * @return the encoded String
     */
    private static String encode64(byte[] b) {

        int outputlength = ((b.length + 2) / 3) * 4;
        StringBuffer sb = new StringBuffer(outputlength);

        int len = (b.length / 3) * 3;
        int leftover = b.length - len;

        for (int i = 0; i < len; i += 3) {
            //get next three bytes in unsigned form lined up
            int combined = b[i] & 0xff;
            combined <<= 8;
            combined |= b[i + 1] & 0xff;
            combined <<= 8;
            combined |= b[i + 2] & 0xff;

            //break those 24 bits into 4 groups of 6 bits
            int c3 = combined & 0x3f;
            combined >>>= 6;
            int c2 = combined & 0x3f;
            combined >>>= 6;
            int c1 = combined & 0x3f;
            combined >>>= 6;
            int c0 = combined & 0x3f;

            //Translate them to equivalent alphanumeric char
            sb.append(base64.charAt(c0));
            sb.append(base64.charAt(c1));
            sb.append(base64.charAt(c2));
            sb.append(base64.charAt(c3));
        }
        if (leftover == 1) {
            sb.append(encode64(new byte[]{b[len], 0, 0}
            ).substring(0, 2));
            sb.append("==");
        } else if (leftover == 2) {
            sb.append(encode64(new byte[]{b[len], b[len + 1], 0}
            ).substring(0, 3));
            sb.append("=");
        }
        return sb.toString();
    }

    public static final java.sql.Connection getConnection(InitialContext context, String dataSourceName) throws SQLException {
        DataSource ds = null;
        try {
            ds = (DataSource) PortableRemoteObject.narrow(
                    context.lookup(dataSourceName),DataSource.class);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new SQLException(e.getMessage());
        }
        Connection conn = ds.getConnection();
        PreparedStatement ps = conn.prepareStatement("set lock mode to wait 5");
        ps.execute();
        return conn;
    }

}
