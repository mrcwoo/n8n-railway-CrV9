FROM node:18-alpine

# Use latest n8n version
ARG N8N_VERSION=1.84.0

# Install n8n
RUN npm install -g n8n@${N8N_VERSION}

# Create and set permissions for n8n directory
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 755 /home/node/.n8n

# Switch to node user
USER node

# Set working directory
WORKDIR /home/node

# Expose the port n8n runs on
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
