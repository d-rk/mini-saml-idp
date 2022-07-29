module github.com/d-rk/mini-saml-idp

replace github.com/crewjam/saml => github.com/d-rk/saml v0.0.0-20220728135604-cf9f8e8b6947

replace github.com/crewjam/saml/samlidp => github.com/d-rk/saml/samlidp v0.0.0-20220728135604-cf9f8e8b6947

go 1.18

require (
	github.com/crewjam/saml v0.0.0-00010101000000-000000000000
	github.com/crewjam/saml/samlidp v0.0.0-20220625143334-5e0ffd290abf
	github.com/zenazn/goji v1.0.1
	golang.org/x/crypto v0.0.0-20220722155217-630584e8d5aa
)

require (
	github.com/beevik/etree v1.1.0 // indirect
	github.com/jonboulle/clockwork v0.2.2 // indirect
	github.com/mattermost/xml-roundtrip-validator v0.1.0 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/russellhaering/goxmldsig v1.1.1 // indirect
)
