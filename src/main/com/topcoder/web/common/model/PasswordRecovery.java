package com.topcoder.web.common.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;

/**
 * Class holding data for each password recovery event.
 *
 * @author cucu
 */
public class PasswordRecovery extends Base {

    private Long id = null;
    private User user = null;
    private String recoveryAddress = null;
    private Date expireDate = null;
    private boolean used = false;
    private Long randomKey = null;

    private static Random random = new Random();

    public Date getExpireDate() {
        return expireDate;
    }

    public PasswordRecovery() {
        randomKey = random.nextLong();
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRecoveryAddress() {
        return recoveryAddress;
    }

    public void setRecoveryAddress(String recoveryAddress) {
        this.recoveryAddress = recoveryAddress;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getRandomKey() {
        return randomKey;
    }

    public void setRandomKey(Long randomKey) {
        this.randomKey = randomKey;
    }


    /**
     * Return a md5 hashcode for the password_recovery row.
     *
     * @return a md5 hashcode for the password_recovery row.
     */
    public String hash() {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] plain = (getId().toString() + randomKey.toString() + getExpireDate().getTime()).getBytes();
            byte[] raw = md.digest(plain);
            StringBuffer hex = new StringBuffer();
            for (int i = 0; i < raw.length; i++)
                hex.append(Integer.toHexString(raw[i] & 0xff));

            return hex.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalArgumentException("Can't do an MD5 hash." + e);
        }

    }
}
