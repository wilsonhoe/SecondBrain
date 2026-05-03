# Next Steps for Your AI Second Brain

## 1. Launch Obsidian
- Run the AppImage: `~/Applications/Obsidian.AppImage`
- In Obsidian, choose "Open folder as vault" and select `/home/wls/second-brain/vault`
- Obsidian will load your vault with the predefined folder structure.

## 2. Install Claude Integration (Optional but Recommended)
While Obsidian does not have an official Claude plugin, you can:
  - Install the **Text Generator** community plugin (or similar AI integration) 
  - Configure it with your Claude API key and model `claude-3-5-sonnet:latest`
  - Use it to summarize notes, extract action items, and suggest tags directly inside Obsidian.

## 3. Start Capturing Knowledge
- Place raw notes, meeting transcripts, or ideas in `00_Inbox/`
- The daily heartbeat (runs at 9 AM via cron) will automatically:
    - Scan the inbox
    - Route items to appropriate folders (Projects, People, Daily) based on content
    - Extract summaries and todos, appending them to `AI/memory.md`
- You can also run the heartbeat manually anytime:  
  `/home/wls/second-brain/scripts/daily_heartbeat.sh`

## 4. Leverage the Knowledge Graph
- Use Obsidian's **Graph view** to see connections between notes via wikilinks (`[[Note Title]]`) and tags (`#tag`).
- As you accumulate notes, the graph will reveal patterns and insights.

## 5. Customize & Extend
- Adjust the heuristics in `daily_heartbeat.sh` to better match your workflow.
- Add more sophisticated processing (e.g., using Claude API directly) if desired.
- Backup your vault regularly (e.g., via Git or cloud sync).

## 6. Explore Existing Notes
- Check `vault/welcome.md` for a starter note.
- Review `vault/CLAUDE.md` for the AI's identity and session protocols.

Your AI Second Brain is now ready to help you manage customer conversation logs, cross‑project memory, and task automation. Happy knowledge building!