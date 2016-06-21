<SCRIPT Language="javascript"> <!--

function checkEmpty(field, value)
{
	if (value == "") return field + " cannot be empty.";
	return "";
}

function ltrim ( s )
{
	return s.replace( /^\s*/, "" )
}

function rtrim ( s )
{
	return s.replace( /\s*$/, "" );
}

function trim ( s )
{
	return rtrim(ltrim(s));
}


function checkEmailAddress(field, value)
{
	var valid = true;

	var trimmedAddress = trim(value);
	if (trimmedAddress == "") {
		// it's empty
		valid = false;
	} else {
		var atIndex = trimmedAddress.indexOf("@");
		if (atIndex <= 0) {
			// @ is either missing or the first character
			valid = false;
		} else {
			var dotIndex = trimmedAddress.indexOf(".", atIndex);
			if (dotIndex == -1) {
				// not dot anywhere after "@"
				valid = false;
			}
		}
	}

	if (valid) {
		return "";
	} else {
		return field + " does not appear to be a valid e-mail address.";
	}
}

//--> </SCRIPT>
