# Sober Dad Eliza Chatbot Deployment Guide

This document provides instructions for deploying the Sober Dad Eliza chatbot on Render.com and embedding it into your Sober Dad website.

## Overview

The Sober Dad Eliza chatbot is built on the ElizaOS framework and consists of two services:

1. **Agent Service (sober-dad-agent)**: The backend service that handles the AI conversation logic.
2. **Client Service (sober-dad-client)**: The frontend service that provides the chat interface.

## Prerequisites

- A Render.com account
- An Anthropic API key for Claude 3.5 Sonnet
- Git repository with the Eliza codebase

## Deployment Steps

### 1. Fork or Clone the ElizaOS Repository

```bash
git clone https://github.com/elizaos/eliza.git sober-dad-eliza
cd sober-dad-eliza
```

### 2. Configure the Character File

The `characters/sober_dad.character.json` file contains the configuration for the Sober Dad character. Make sure to update the following:

- Customize the character's knowledge, example conversations, and system prompt as needed
- Customize the web client settings (title, description, theme colors, avatar URL)

### 3. Configure Render Deployment

The `render.yaml` file contains the configuration for deploying both services on Render.com. Make sure to:

- Set the `ANTHROPIC_API_KEY` environment variable in the Render dashboard as a secret
- Verify that the `VITE_SERVER_URL` in the client service points to your agent service URL

### 4. Deploy to Render

1. Push your code to a Git repository
2. Connect your repository to Render.com
3. Use the "Blueprint" deployment option and select your repository
4. Render will automatically detect the `render.yaml` file and create both services
5. **Important**: Add your Anthropic API key in the Render dashboard under Environment Variables for the agent service

### 5. Embed in Your Website

Once deployed, you can embed the client in your Sober Dad website using an iframe:

```html
<iframe
  src="https://sober-dad-client.onrender.com"
  width="400"
  height="600"
  frameborder="0"
  style="border-radius: 10px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);"
></iframe>
```

## Configuration Details

### Agent Service

The agent service runs the Eliza backend with the Sober Dad character configuration. Key settings:

- **Model**: Claude 3.5 Sonnet (Anthropic)
- **Temperature**: 0.7 (balanced between creativity and consistency)
- **Character File**: `characters/sober_dad.character.json`

### Client Service

The client service provides the web interface for interacting with the Sober Dad agent. Key settings:

- **Theme**: Blue-based color scheme (customizable in the character file)
- **Server URL**: Points to the agent service URL

## Security Best Practices

- **API Keys**: Never store API keys in your character.json file or commit them to version control. Always use environment variables set in the Render dashboard.
- **Environment Variables**: Use the Render dashboard to set sensitive environment variables like API keys.
- **Secrets Management**: For production deployments, consider using a secrets management solution like Render's built-in secrets or a third-party service.

## Troubleshooting

- **Agent Service Not Responding**: Check the Render logs for any errors. Verify that the Anthropic API key is correct in the Render dashboard.
- **Client Cannot Connect to Agent**: Verify that the `VITE_SERVER_URL` environment variable is set correctly.
- **Deployment Failures**: Check that the Docker build is completing successfully. Review the build logs in Render.

## Maintenance

- **Updating the Character**: Edit the `characters/sober_dad.character.json` file and redeploy.
- **Scaling**: Adjust the service settings in Render as needed for higher traffic.
- **Monitoring**: Use Render's built-in monitoring tools to track performance and usage.

## Security Considerations

- The Anthropic API key is stored as a secret in Render and not exposed to clients.
- User conversations are not stored permanently unless configured to do so.
- Consider implementing additional authentication if the chatbot will handle sensitive information.

## Support

For issues with the Eliza framework, refer to the [ElizaOS documentation](https://elizaos.github.io/eliza/).

For issues specific to the Sober Dad deployment, contact your system administrator. 