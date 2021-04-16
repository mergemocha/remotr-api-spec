# Server-daemon handshake procedure

## Registration

In order to register a daemon with the central server, the API expects a handshake procedure to complete for security reasons. The handshake procedure works as follows.

1. The daemon performs `POST /daemons/register`, with the `X-Secret` header set to the handshake secret as defined by the server.
2. If the secret is valid, the API provides a token to the daemon in the response body (Field `token`) that will be used for subsequent authorisation of the connection between the server and the daemon.
3. If the API returns 200 OK, the server expects the daemon to pingback with `POST /daemons/identify`, with the `Authorization` header set to the value of the `token` field from the previous response body. The API additionally expects the daemon to provide information about itself; the specific information wanted is documented in the endpoint documentation for `/daemons/identify`.

In future, the API expects the daemon to `POST /daemons/identify` each time it starts (Either via system startup or software restart).

## De-registration

In order for a daemon to be de-registered, the API expects `DELETE /daemons/:mac` peformed, with the `mac` request parameter set to the daemon MAC address. In this instance, the `Authorization` parameter accepts both daemon and user tokens, meaning that this operation can also be initiated client-side.
