resource "azurerm_mssql_firewall_rule" "allow_client_ip" {
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "172.212.49.139"
  end_ip_address   = "172.212.49.139"
}
