import requests
import json

# Step 1: Authenticate with Looker
LOOKER_URL = "https://sadasystems.looker.com/"  
CLIENT_ID = "D2q66HgCR5pMQmtBQjC8"
CLIENT_SECRET = "6Pdd3zwPBVMmrXG9dtyhBRmC"

auth_payload = {
    "client_id": CLIENT_ID,
    "client_secret": CLIENT_SECRET
}

auth_response = requests.post(f"{LOOKER_URL}/api/4.0/login", data=auth_payload)
if auth_response.status_code != 200:
    print("Authentication failed.")
    exit(1)

access_token = auth_response.json()['access_token']

# Read Connection Details from File
with open('connections.json', 'r') as f:
    connection_data = json.load(f)

# Iterate through each connection and create it
headers = {
    "Authorization": f"Bearer {access_token}"
}

for connection_name, connection_details in connection_data.items():
    connection_payload = {
        "name": connection_name,
        **connection_details
    }
    connection_response = requests.post(f"{LOOKER_URL}/api/4.0/connections", headers=headers, json=connection_payload)
    if connection_response.status_code != 200:
        print(f"Connection {connection_name} creation failed.")
    else:
        print(f"Connection {connection_name} created successfully.")

# Import a Looker project from a GitHub repository
project_payload = {
    "name": "jay_looker_demo",
    "git_remote_url": "git://github.com/jaykasinathan/looker_template.git",
    "uses_git": "true",
    "git_service_name": "github"
}

project_response = requests.post(f"{LOOKER_URL}/api/4.0/projects", headers=headers, json=project_payload)
if project_response.status_code != 200:
    print("Project import failed.")
    exit(1)

print("All operations completed successfully.")