extends Node

const _API_KEY := "AIzaSyAcgPWwaCpH58HMllKEh2wC-UcjHercniY"

const _REGISTER_URL := "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=%s" % _API_KEY
const _LOGIN_URL := "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=%s" % _API_KEY

var _current_token := ""

func _get_token_id_from_result(result: Array) -> String:
	var result_body := JSON.parse(result[3].get_string_from_ascii()).result as Dictionary
	return result_body.idToken


func register(email: String, password: String, http: HTTPRequest) -> void:
	var body := {
		"email": email,
		"password": password,
	}
# warning-ignore:return_value_discarded
	http.request(_REGISTER_URL, [], true, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	if result[1] == 200:
		_current_token = _get_token_id_from_result(result)


func login(email: String, password: String, http: HTTPRequest) -> void:
	var body := {
		"email": email,
		"password": password,
	}
# warning-ignore:return_value_discarded
	http.request(_LOGIN_URL, [], false, HTTPClient.METHOD_POST, to_json(body))
	var result := yield(http, "request_completed") as Array
	if result[1] == 200:
		_current_token = _get_token_id_from_result(result)
