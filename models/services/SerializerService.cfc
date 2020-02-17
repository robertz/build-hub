component output = "false" {

	// Create hex string that can easily be shared
	function serialize (required struct objData) {
		return binaryEncode(toBinary(toBase64(serializeJSON(objData))), "hex")
	}

	// Decode a hex string to a JSON object
	function deserialize (required string dc) {
		return isJSON(toString(binaryDecode(dc, "hex"))) ? deserializeJSON(toString(binaryDecode(dc, "hex"))) : {}
	}

}