import command_generator

# python3 /home/idir/Desktop/Projects/StockManager/desktop_app/scripts/commands_generator.py
adminCommands = [
    command_generator.DataHolder(
        "upload_users", "UploadUsers", "AdminApi", "uploadUsers", "AdminService"),
    command_generator.DataHolder(
        "download_users", "DownloadUsers", "AdminApi", "downloadUsers", "AdminService"),
    command_generator.DataHolder(
        "load_stats", "LoadAllStats", "AdminApi", "loadAllStats", "AdminService")
]

agentCommands = [
    command_generator.DataHolder(
        "verify_vehicule", "VerifyVehicule", "AgentApi", "verifyVehicule", "AgentService"),
    command_generator.DataHolder(
        "register_vehicule", "RegisterVehicule", "AgentApi", "registerVehicule", "AgentService"),
    command_generator.DataHolder(
        "verify_user", "VerifyUser", "AgentApi", "verifyUser", "AgentService"),
    
]

authCommands = [
    command_generator.DataHolder(
        "login", "Login", "AuthApi", "login", "AuthService"),
]


userCommands = [
    command_generator.DataHolder(
        "get_user_data", "GetUserData", "UserApi", "getUserData", "UserService"),
        
]

def generate_commands(data):
    for d in data:
        command_generator.generate_command_file(d)


# generate_commands(depositCommands)
# generate_commands(purchaseCommands)
# generate_commands(stockCommands)
# generate_commands(sellersCommands)
# generate_commands(transactionCommands)
# generate_commands(productModelsCommands)


# generate_commands(adminCommands)
# generate_commands(agentCommands)
# generate_commands(authCommands)
# generate_commands(userCommands)

