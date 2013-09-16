/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p>
 * This enum indicates the email request type: primary or secondary.
 *
 * <b>Thread safety:</b>
 * This class is thread safe.
 * </p>
 *
 * <p>
 * It is introduced in Release Assembly - TopCoder Email Address Management Update v1.0.
 * </p>
 *
 * @author Standlove, TCSASSEMBLER
 * @version 1.0
 */
public enum EmailRequestType {
	/**
	 * <p>Primary email change confirmation.</p>
	 */
	PrimaryEmailChangeConfirmation,
	/**
	 * <p>Secondary email change confirmation.</p>
	 */
	SecondaryEmailConfirmation
}