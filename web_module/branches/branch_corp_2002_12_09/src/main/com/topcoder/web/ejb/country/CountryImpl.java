package com.topcoder.web.ejb.country;

/**
 * Simplest Country implementation
 * 
 * @author djFD molc@mail.ru<br>
 */
class CountryImpl implements Country {
	private String name;
	private String code;
	
	/**
	 * creates Country instance.
	 * 
	 * @param cd country code. 1 to 3 symbols at most
	 * @param nm country name. 40 chars at most
	 *  
	 */
	CountryImpl(String cd, String nm) {
		name = nm;
		code = cd;
	}
	
	/**
	 * @see com.topcoder.web.ejb.country.Country#getName()
	 */
	public String getName() {
		return name;
	}

	/**
	 * @see com.topcoder.web.ejb.country.Country#getCode()
	 */
	public String getCode() {
		return code;
	}
}
