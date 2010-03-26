/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.ldap;

import com.novell.ldap.LDAPExtendedOperation;
import com.novell.ldap.LDAPException;
import netscape.ldap.ber.stream.BEROctetString;
import netscape.ldap.ber.stream.BERSequence;
import netscape.ldap.ber.stream.BERTag;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

/**
 * <p>An extended LDAP operation to be used for changing user passwords.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class ChangePasswordOperation extends LDAPExtendedOperation {

    /**
     * <p>Constructs new <code>ChangePasswordOperation</code> instance. This implementation does nothing.</p>
     */
    public ChangePasswordOperation() {
    }

    /**
     * <p>Constructs new <code>ChangePasswordOperation</code> instance for chaning the password for specified user.</p>
     *
     * @param username    a <code>String</code> providing the username (DN) to change password for.
     * @param newPassword a <code>String</code> providing new password to be set.
     * @throws LDAPException if an unexpected error occurs.
     */
    public ChangePasswordOperation(String username, String newPassword) throws LDAPException {
        super("1.3.6.1.4.1.4203.1.11.1", null);
        setValue(getEncodedValue(username, newPassword));
    }

    /**
     * <p>Retrieves the ASN.1 BER encoded value of the LDAP extended operation for Password Modification request.</p>
     *
     * @param username the DN to change the password for.
     * @param newPassword new password to be set.
     * @return encoded value of password modify extended request.
     */
    public byte[] getEncodedValue(String username, String newPassword) {
        final BERSequence vSeq = new BERSequence();
        vSeq.addElement(new BERTag(BERTag.CONTEXT | 0, new BEROctetString(username), true));
        vSeq.addElement(new BERTag(BERTag.CONTEXT | 2, new BEROctetString(newPassword), true));
        return flattenBER(vSeq);
    }

    /**
     * <p>Creates a "flattened" BER encoding from a BER, and return it as a byte array.</p>
     *
     * @param ber a BER encoded sequence.
     * @return the byte array of encoded data.
     */
    private byte[] flattenBER(BERSequence ber) {
        try {
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            ber.write(outStream);
            return outStream.toByteArray();
        } catch (IOException e) {
            return null;
        }
    }
}
