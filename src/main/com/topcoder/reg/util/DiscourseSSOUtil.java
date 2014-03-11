/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.util;

import com.topcoder.reg.dto.UserDTO;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.util.URIUtil;
import org.apache.commons.lang.StringUtils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *     This class provides some utility methods for discourse sso actions.
 * </p>
 *
 * <p>
 *     <strong>Thread Safety:</strong> This class is thread safe.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 * @since 1.0 (PoC Assembly - Discourse SSO by using existing Auth0 Login)
 */
public class DiscourseSSOUtil {
    /**
     * The logger.
     */
    private static final Logger LOGGER = Logger.getLogger(DiscourseSSOUtil.class);

    /**
     * The hash algorithm.
     */
    private static final String HASH_ALGORITHM = "HmacSHA256";

    /**
     * The payload placeholder.
     */
    private static final String PAYLOAD_PLACEHOLDER = "{payload}";

    /**
     * The sig placeholder.
     */
    private static final String SIG_PLACEHOLDER = "{sig}";

    /**
     * Get sso callback url.
     *
     * @param sso the payload
     * @param sig the signed payload
     * @param user the user
     * @return the callback url
     *
     * @throws TCWebException if exception occurs.
     * @throws NavigationException if the payload is invalid. 
     */
    public static String getSSOCallbackURL(String sso, String sig, UserDTO user) throws TCWebException {
        LOGGER.debug("enter getSSOCallbackURL");

        try {
            sso = URIUtil.decode(sso);
            String s2 = signBySHA256(sso);

            if (!StringUtils.equals(sig, s2)) {
                throw new NavigationException("Bad signature for payload.");
            }

            List<String> params = new ArrayList<String>();

            params.add(new String(Base64.decodeBase64(sso.getBytes())));
            addParamString(params, "email", user.getEmail(), true);
            addParamString(params, "external_id", user.getUserId().toString(), true);
            addParamString(params, "username", user.getHandle(), false);

            String name = (user.getFirstName() == null ? "" : user.getFirstName())
                    + " "
                    + (user.getLastName() == null ? "" : user.getLastName());
            addParamString(params, "name", name, false);

            String payload = StringUtils.join(params.iterator(), "&");
            payload = new String(Base64.encodeBase64(payload.getBytes()));

            String hash = signBySHA256(payload);
            payload = URIUtil.encodeQuery(payload);

            String ret = Constants.DISCOURSE_CALLBACK_URL
                    .replace(PAYLOAD_PLACEHOLDER, payload)
                    .replace(SIG_PLACEHOLDER, hash);

            LOGGER.debug("leave getSSOCallbackURL with callback URL: " + ret);
            return ret;
        } catch (URIException e) {
            throw new NavigationException("Bad payload.", e);
        } catch (NoSuchAlgorithmException e) {
            throw new TCWebException("Can't find algorithm.", e);
        } catch (InvalidKeyException e) {
            throw new TCWebException("The key is invalid.", e);
        }
    }

    /**
     * Add param to param list.
     *
     * @param params the param list
     * @param name the name
     * @param value the value
     * @param required whether required or not
     */
    private static void addParamString(List<String> params, String name, String value, boolean required) {
        if (!required && StringUtils.isEmpty(value)) {
            return;
        }
        params.add(name + "=" + (value == null ? "" : value.trim()));
    }

    /**
     * Sign the data by SHA256.
     *
     * @param data the data to sign
     * @return the signed data
     *
     * @throws NoSuchAlgorithmException if there is no such algorithm, should never happen.
     * @throws InvalidKeyException if the key is invalid.
     */
    public static String signBySHA256(String data) throws NoSuchAlgorithmException, InvalidKeyException {
        Mac sha256_HMAC = Mac.getInstance(HASH_ALGORITHM);
        SecretKeySpec secret_key = new SecretKeySpec(Constants.DISCOURSE_SSO_SECRET.getBytes(), HASH_ALGORITHM);
        sha256_HMAC.init(secret_key);

        return new String(Hex.encodeHex(sha256_HMAC.doFinal(data.getBytes())));
    }
}
