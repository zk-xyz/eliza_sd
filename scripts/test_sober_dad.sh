#!/bin/bash

# Test script for Sober Dad Eliza chatbot deployment

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Testing Sober Dad Eliza Chatbot Deployment${NC}"
echo "=================================="

# Check if character file exists
if [ -f "characters/sober_dad.character.json" ]; then
    echo -e "${GREEN}✓ Character file exists${NC}"
    
    # Check that the character file doesn't contain API keys (security best practice)
    if grep -q "ANTHROPIC_API_KEY" "characters/sober_dad.character.json"; then
        echo -e "${RED}✗ Security issue: API key found in character file. Please remove it and use environment variables instead.${NC}"
        exit 1
    else
        echo -e "${GREEN}✓ No API keys found in character file (good security practice)${NC}"
    fi
else
    echo -e "${RED}✗ Character file not found${NC}"
    exit 1
fi

# Check if render.yaml exists
if [ -f "render.yaml" ]; then
    echo -e "${GREEN}✓ Render configuration file exists${NC}"
else
    echo -e "${RED}✗ Render configuration file not found${NC}"
    exit 1
fi

# Check if docker-entrypoint.sh exists and is executable
if [ -f "docker-entrypoint.sh" ] && [ -x "docker-entrypoint.sh" ]; then
    echo -e "${GREEN}✓ Docker entrypoint script exists and is executable${NC}"
else
    echo -e "${RED}✗ Docker entrypoint script not found or not executable${NC}"
    exit 1
fi

# Check if .env.sober_dad exists
if [ -f ".env.sober_dad" ]; then
    echo -e "${GREEN}✓ Environment file exists${NC}"
else
    echo -e "${RED}✗ Environment file not found${NC}"
    exit 1
fi

# Check if Node.js is installed
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}✓ Node.js is installed (${NODE_VERSION})${NC}"
else
    echo -e "${RED}✗ Node.js is not installed${NC}"
    exit 1
fi

# Check if pnpm is installed
if command -v pnpm &> /dev/null; then
    PNPM_VERSION=$(pnpm -v)
    echo -e "${GREEN}✓ pnpm is installed (${PNPM_VERSION})${NC}"
else
    echo -e "${RED}✗ pnpm is not installed${NC}"
    exit 1
fi

echo "=================================="
echo -e "${GREEN}All checks passed! The Sober Dad Eliza chatbot is ready for deployment.${NC}"
echo "To deploy, follow the instructions in SOBER_DAD_DEPLOYMENT.md" 