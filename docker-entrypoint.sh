#!/bin/sh

# Print environment information
echo "Node version: $(node -v)"
echo "PNPM version: $(pnpm -v)"
echo "Service type: $SERVICE_TYPE"
echo "Environment: $NODE_ENV"

# Handle different service types
if [ "$SERVICE_TYPE" = "client" ]; then
    echo "Starting client service in $NODE_ENV mode..."
    cd client
    
    # Build the client if not already built
    if [ ! -d "dist" ]; then
        echo "Building client..."
        pnpm run build
    fi
    
    # Start the client service
    exec pnpm exec vite preview --host "${HOST:-0.0.0.0}" --port "${PORT:-10000}" --strictPort true
else
    echo "Starting agent service in $NODE_ENV mode..."
    
    # Start the agent service with the Sober Dad character
    exec pnpm start --character=characters/sober_dad.character.json
fi 