#!/bin/bash

# Exit on error
set -e

# Function to check if an environment variable is set
check_env_var() {
    if [ -z "${!1}" ]; then
        echo "Error: $1 is not set"
        exit 1
    fi
}

# Set default environment flavor if not set
FLAVOR=${FLAVOR:-dev}

# Load environment variables from flavor-specific .env file
ENV_FILE=".env.$FLAVOR"
if [ -f "$ENV_FILE" ]; then
    echo "Loading environment variables from $ENV_FILE..."
    export $(cat "$ENV_FILE" | grep -v '^#' | xargs)
else
    echo "Error: $ENV_FILE not found"
    echo "Please create $ENV_FILE with the following variables:"
    echo "API_KEY=your_api_key"
    echo "BASE_URL=your_base_url"
    echo "BACKDOOR_EMAIL=your_backdoor_email (optional)"
    echo "BACKDOOR_PASSWORD=your_backdoor_password (optional)"
    exit 1
fi

# Check required environment variables
echo "Checking required environment variables..."
check_env_var "API_KEY"
check_env_var "BASE_URL"

# Construct DART_DEFINE_ARGS for API configuration
DART_DEFINE_ARGS="--dart-define=API_KEY=$API_KEY"
DART_DEFINE_ARGS="$DART_DEFINE_ARGS --dart-define=BASE_URL=$BASE_URL"

# Add backdoor access if provided
if [ ! -z "$BACKDOOR_EMAIL" ] && [ ! -z "$BACKDOOR_PASSWORD" ]; then
    DART_DEFINE_ARGS="$DART_DEFINE_ARGS --dart-define=BACKDOOR_EMAIL=$BACKDOOR_EMAIL"
    DART_DEFINE_ARGS="$DART_DEFINE_ARGS --dart-define=BACKDOOR_PASSWORD=$BACKDOOR_PASSWORD"
fi

# Run the app
echo "Running app in $FLAVOR environment..."
flutter run -d chrome $DART_DEFINE_ARGS 