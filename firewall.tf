resource "azurerm_mssql_firewall_rule" "allow_client_ip" {
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "2804:7f0:b300:78a9:6820:acb7:ca4e:6b5f"
  end_ip_address   = "2804:7f0:b300:78a9:6820:acb7:ca4e:6b5f"
}
