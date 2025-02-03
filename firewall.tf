data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}

locals {
  my_ip = jsondecode(data.http.my_ip.response_body).ip
}

resource "azurerm_mssql_firewall_rule" "allow_client_ip" {
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = local.my_ip
  end_ip_address   = local.my_ip
}
