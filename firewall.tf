resource "azurerm_mssql_firewall_rule" "allow_client_ip" {
  name             = "AllowMyIP"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "4.157.38.232"
  end_ip_address   = "4.157.38.232"
}
