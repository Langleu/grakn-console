# grakn-console
> grakn console in an alpine image

Main aim of this image is to have the console without the server and to be more useful for the Kubernetes and Docker context.
It allows to automatically apply the Grakn Schema.

## Environment Variables
- ADDRESS - (def) 127.0.0.1:48555
- KEYSPACE - (def) grakn
- TIMEOUT - (def) 60
- FILE - absolute path
