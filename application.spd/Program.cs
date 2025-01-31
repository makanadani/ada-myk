using application.spd.Data;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Protocols.Configuration;

var builder = WebApplication.CreateBuilder(args);

Action<DbContextOptionsBuilder> retriveConnecringStringFromKeyVaultAction = (options) =>
{

    var keyVaultUrl = builder.Configuration["SPD_KEY_VAULT_URI"]
        ?? throw new InvalidConfigurationException("Variavel de ambiente `SPD_KEY_VAULT_URI` n�o encontrada");
    var secretClient = new SecretClient(new Uri(keyVaultUrl), new DefaultAzureCredential());
    var dbConnectionString = secretClient.GetSecret("db-connection-string").Value.Value;

    options.UseSqlServer(dbConnectionString);
};

// Add services to the container.
builder.Services.AddControllersWithViews();
builder
    .Services
    .AddDbContext<AppDbContext>(retriveConnecringStringFromKeyVaultAction);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

// app.UseHttpsRedirection();
app.UseRouting();

// app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();

app.Run();
