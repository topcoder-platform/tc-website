package com.topcoder.web.ejb.country;

import java.io.Serializable;

/**
 * Interface for simple country object
 * 
 * @author djFD molc@mail.ru<br>
 */
public interface Country extends Serializable {
	
	/**
	 * Returns name of country. Names are 40 symbols at most.
	 * 
	 * @return String country name
	 */
	public String getName();
	
	/**
	 * Returns country code. Country codes consist of 1 to 3 alpha-numeric
	 * symbols.
	 * 
	 * @return String country code
	 */
	public String getCode();
}