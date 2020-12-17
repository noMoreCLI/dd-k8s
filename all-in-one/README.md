
penssl genrsa -des3 -passout pass:over4chars -out dashboard.pass.key 2048
...
openssl rsa -passin pass:over4chars -in dashboard.pass.key -out dashboard.key
# Writing RSA key
rm dashboard.pass.key
openssl req -new -key dashboard.key -out dashboard.csr
...
Country Name (2 letter code) [AU]: US
...
A challenge password []:
...
Generate SSL certificate
The self-signed SSL certificate is generated from the dashboard.key private key and dashboard.csr files.

openssl x509 -req -sha256 -days 365 -in dashboard.csr -signkey dashboard.key -out dashboard.crt


kubectl create secret generic kubernetes-dashboard-certs --from-file=$HOME/certs -n kubernetes-dashboard

 Under Deployment section, add arguments to pod definition, it should look as follows:

      containers:
      - args:
        - --tls-cert-file=/dashboard.crt
        - --tls-key-file=/dashboard.key
