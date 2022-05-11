minimal reproduction for https://github.com/mrparkers/terraform-provider-keycloak/issues/688

Steps: 
1. Boot a local keycloak server 
```bash
docker run -d -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:18.0.0 start-dev
```
2. Using the admin UI, create a realm my-realm and a client within it my-client
3. Import the resources into terraform state
```bash
terraform init
terraform import keycloak_realm.my_realm my-realm
terraform import keycloak_openid_client.my_client my-realm/my-client
```