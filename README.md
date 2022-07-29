# mini-saml-idp

Lightweight SAML2 IDP that can be used for testing

# run

Run using docker-compose:
```
  mini-saml-idp:
    container_name: mini-saml-idp
    image: mini-saml-idp:latest
    ports:
      - "9009:9009"
    volumes:
      - ./saml/:/data/
    environment:
      IDP_BASE_URL: http://localhost:9009
      SERVICE_METADATA_URL: http://my-saml-sp/saml/metadata
      USER_JSON: /data/users.json
```

If you do not mount a `users.json` the default one is used.

# build

```
docker build -t mini-saml-idp:latest .
```