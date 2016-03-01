"""
environ:
  REQUEST_URI
  PATH_INFO
  QUERY_STRING
  ...
  wsgi.version
  wsgi.url_scheme
  ... 
"""

def application(environ, start_response):
	# some logic
	status = '200 OK'
	headers = [
		('Content-Type', 'text/plain')
	]
	body = environ['QUERY_STRING'].replace('&', '\n')
	start_response(status, headers)
	return [body]
