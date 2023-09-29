import requests
import json
import os 

# Step 1: Authenticate with Looker API

looker_url = os.environ.get('LOOKER_URL')
client_id = os.environ.get('CLIENT_ID')
client_secret = os.environ.get('CLIENT_SECRET')
looker_url = "https://fd0b0f3a-62c5-43c0-8f78-2dfb20ee13d3.looker.app"
client_id = "KVwtSRpDKTWMWXwWv6dG"
client_secret = "kDzjt5xjW9vm2w8fDXWZXMby"

auth_payload = {
    "client_id": client_id,
    "client_secret": client_secret
}

auth_response = requests.post(f"{looker_url}/api/4.0/login", data=auth_payload)
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
    connection_response = requests.post(f"{looker_url}/api/4.0/connections", headers=headers, json=connection_payload)
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

project_response = requests.post(f"{looker_url}/api/4.0/projects", headers=headers, json=project_payload)
if project_response.status_code != 200:
    print("Project import failed.")
    exit(1)

print("All operations completed successfully.")