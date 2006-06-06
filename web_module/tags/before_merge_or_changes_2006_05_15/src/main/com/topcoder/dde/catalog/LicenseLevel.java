/*
 * LicenseLevel.java
 * 20 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;


/**
 * An object that represents a license level. Instances of this class can
 * either be created by the component catalog to return information to the
 * client, or by the client to pass information to the component catalog. In the
 * former case, the instance will contain information about the license level's
 * primary key in the database and the price per unit. In the latter case, the
 * instance will have a dummy id of -1, and a price per unit of 0.0.
 *
 * @version 1.0, 20 September 2002
 * @author  Albert Mao
 * @see     Catalog
 */
public class LicenseLevel implements java.io.Serializable {

    /** The status constant used to indicate a license level has been deleted */
    public static final long DELETED = 0;

    /** The status constant used to indicate a license level is active */
    public static final long ACTIVE = 1;

    private long id;
    private String description;
    private double priceMultiplier;
    private double pricePerUnit;

    LicenseLevel(long id, String description, double priceMultiplier,
                 double pricePerUnit) {
        this(description, priceMultiplier);
        this.id = id;
        this.pricePerUnit = pricePerUnit;
    }

    /**
     * Constructs a new <code>LicenseLevel</code> object.
     *
     * @param description a description of the license level
     * @param priceMultiplier the price multiplier of the license level
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>, or if <code>priceMultiplier</code> is negative or
     * non-finite
     */
    public LicenseLevel(String description, double priceMultiplier) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for license description");
        }
        if (priceMultiplier < 0.0) {
            throw new IllegalArgumentException(
                    "Negative number specified for price multiplier");
        }
        if (Double.isInfinite(priceMultiplier)
                || Double.isNaN(priceMultiplier)) {
            throw new IllegalArgumentException(
                    "Non-finite number specified for price multiplier");
        }
        this.description = description;
        this.priceMultiplier = priceMultiplier;
        id = -1;
        pricePerUnit = 0.0;
    }


    /**
     * Returns the primary key of this license level.
     *
     * @return the primary key of this license level, or -1 if this license
     * level was constructed by the client (instead of returned by the component
     * catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns a description of this license level.
     *
     * @return a description of this license level
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the description of this license level.
     *
     * @param description the new description
     * @throws IllegalArgumentException if <code>description</code> is
     * <code>null</code>
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new IllegalArgumentException(
                    "Null specified for license level description");
        }
        this.description = description;
    }

    /**
     * Returns the price multiplier of this license level.
     *
     * @return the price multiplier of this license level
     */
    public double getPriceMultiplier() {
        return priceMultiplier;
    }

    /**
     * Sets the price multiplier of this license level.
     *
     * @param priceMultiplier the new price multiplier
     * @throws IllegalArgumentException if <code>priceMultiplier</code> is
     * negative or non-finite
     */
    public void setPriceMultiplier(double priceMultiplier) {
        if (priceMultiplier < 0.0) {
            throw new IllegalArgumentException(
                    "Negative number specified for price multiplier");
        }
        if (Double.isInfinite(priceMultiplier)
                || Double.isNaN(priceMultiplier)) {
            throw new IllegalArgumentException(
                    "Non-finite number specified for price multiplier");
        }
        this.priceMultiplier = priceMultiplier;
    }

    /**
     * Returns the price per unit, or 0.0 if this license level was constructed
     * by the client (instead of returned by the component catalog). Note that
     * the price per unit should be a system-wide constant.
     *
     * @return the price per unit
     */
    public double getPricePerUnit() {
        return pricePerUnit;
    }

    /**
     * Calculates the unit cost equivalent of a price in dollars for this
     * license level. The formula is:<br>
     * <code>unitcost = round(price * priceMultiplier / pricePerUnit)</code>
     *
     * @param price the price to convert to units
     * @return the unit cost
     * @throws IllegalArgumentException if <code>price</code> is negative or
     * non-finite
     * @throws IllegalStateException if this license level was constructed by
     * the client (instead of returned by the catalog)
     */
    public int calculateUnitCost(double price) {
        if (price < 0.0) {
            throw new IllegalArgumentException(
                    "Negative number specified for price");
        }
        if (Double.isInfinite(price) || Double.isNaN(price)) {
            throw new IllegalArgumentException(
                    "Non-finite number specified for price");
        }
        if (getId() == -1 || getPricePerUnit() == 0.0) {
            throw new IllegalStateException("The price per unit is unknown. Only license levels returned by the catalog can be used to calculate the unit cost.");
        }
        return (int) Math.round(price * priceMultiplier / pricePerUnit);
    }

    /**
     * Compares the specified object with this license level for equality. Two
     * license levels are considered equal if they have the same description and
     * price multiplier. The primary key and price per unit are <em>not</em>
     * tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * license level; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        LicenseLevel other = (LicenseLevel) object;
        return getDescription().equals(other.getDescription())
                && getPriceMultiplier() == other.getPriceMultiplier();
    }

    /**
     * Returns the hash code value for this license level. The hash code is
     * generated by performing a bitwise exclusive-or operation on the hash
     * codes of the <code>String</code> object containing the description and
     * the hash code of the price multiplier.
     *
     * @return the hash code value for this license level
     */
    public int hashCode() {
        return getDescription().hashCode() ^
                (new Double(getPriceMultiplier())).hashCode();
    }

    public String toString() {
        return "License Level " + getId() + " - " + getDescription()
                + " x" + getPriceMultiplier();
    }


}