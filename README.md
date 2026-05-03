# AI Second Brain Setup (Obsidian + Claude)

## Overview
This repository contains the setup for an AI-powered second brain using Obsidian as the knowledge base and a Claude plugin to automatically read notes, extract key points, and build knowledge connections.

## Steps to Replicate

### 1. Install Obsidian
- Download Obsidian from https://obsidian.md
- Install and launch the application
- Create a new vault (or open existing) – we'll use the `vault` folder in this directory as our vault

### 2. Install the Claude Plugin
While there isn't an official "Claude" plugin in the Obsidian Community Plugins list, you can achieve similar functionality via:
  - **Text Generator plugin** (or similar AI integration plugins) that allow you to connect to Claude via API
  - Alternatively, use the **Obsidian API** or **Templater** + **HTTP requests** to call Claude's API

#### Using Text Generator (example):
1. Open Obsidian Settings → Community plugins → Browse
2. Search for "Text Generator" (or "AI Assistant", "OpenAI Assistant", etc.)
3. Install the plugin
4. In the plugin settings, configure:
   - Provider: Anthropic Claude
   - API Key: Your Claude/Anthropic API key
   - Model: e.g., `claude-3-5-sonnet:latest`
   - Prompt template for summarizing/extracting insights
5. Enable the plugin

### 3. Set Up Knowledge Workflow
- **Daily Notes**: Use the Daily Notes core plugin to create a daily log.
- **Automated Tagging & Extraction**: Use the Claude plugin to:
  - Summarize long notes
  - Extract key entities, actions, and decisions
  - Suggest tags based on content
- **Graph View**: Enable the Graph view to visualize connections between notes as you accumulate knowledge.

### 4. Use Cases
- **Customer Conversation Logs**: Save call transcripts or meeting notes; let Claude extract action items and follow-ups.
- **Cross-Project Memory**: Keep a universal note for each project; Claude can link related concepts across projects.
- **AI Assistant**: When you ask the AI to help with tasks, it can read your vault for context and provide informed responses.

### 5. Automation (Optional)
- Use **Templater** or **Omniscribe** to run Claude prompts on file save or on a schedule.
- Example template: 
  ```
  <%* 
  const { text } = await tp.user.claude(`Summarize the key points of this note: <% tp.file.selection() %>`); 
  tR += `## AI Summary\n${text}`; 
  %> 
  ```

## Folder Structure
- `vault/` – Your Obsidian vault directory. Place all markdown notes here.
- `scripts/` – (Optional) Scripts for backup or automation.

## Example Note
See `vault/welcome.md` for a starter note.

## Notes
- Ensure you keep your API key secure; do not commit it to any public repository.
- Regularly back up your vault (e.g., via Git or cloud sync).
- The more you write, the richer the AI's understanding and the more useful the knowledge graph becomes.

---
*Setup complete. Start building your second brain!*